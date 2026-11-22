unit UPedidoRecepcionModelo;
interface
uses SysUtils,Classes,Contnrs;
type
  TPedidoModoPrecio=(ppSimple,ppNiveles,ppPresentaciones);
  TPedidoCuatro= array[1..4] of Currency;
  TPedidoPorcientos= array[1..4] of Double;
  TPedidoPresentacion=record
    Unidad:Integer;Descripcion:string;Factor:Double;Persistida:Boolean;
    Precios,Anteriores:TPedidoCuatro;Porcientos:TPedidoPorcientos;
  end;
  TPedidoPresentaciones=array of TPedidoPresentacion;
  TPedidoProducto=class
  public
    Codigo:Integer;CodigoTexto,Descripcion:string;
    CostoAnterior,PrecioAnterior,MinimoAnterior,CostoNuevo:Currency;
    StockAnterior:Double;Tasa:Double;Inventariar:Boolean;Modo:TPedidoModoPrecio;
    Precios:TPedidoPresentaciones;SelloInventario,SelloPresentaciones:string;
    PreciosConfirmados:Boolean;
    procedure CopiarDe(P:TPedidoProducto);
    procedure Proponer(CostoBase:Currency);
    function PrecioBase:Currency;
    function MinimoBase:Currency;
    function FirmaPropuesta:string;
  end;
  TPedidoLinea=class
  public
    Producto:TPedidoProducto;Unidad:Integer;Presentacion:string;Factor:Double;
    Cantidad,Oferta:Double;CostoProveedor:Currency;IncluyeItbis:Boolean;
    Descuento:Double;Lote:string;Vence:TDateTime;
    function CostoConItbis:Currency;
    function CostoBase:Currency;
    function CompradasBase:Double;
    function EntradaBase:Double;
    function Bruto:Currency;
    function MontoDescuento:Currency;
    function Total:Currency;
    function Impuesto:Currency;
    procedure Validar(Fecha:TDateTime;RequiereLote:Boolean);
  end;
  TPedidoRecepcion=class
  public
    Empresa,Almacen,Proveedor,TipoProveedor,Usuario,Factura,FormaPago:Integer;
    NombreEmpresa,NombreProveedor,NombreAlmacen,NombreUsuario,NCF,Rnc:string;
    Fecha,VencimientoPago:TDateTime;RequiereLote:Boolean;TotalProveedor:Currency;
    Lineas,Productos:TObjectList;
    NumeroGuardado,NumeroTentativo:Integer;ResultadoIncierto:Boolean;
    constructor Create;
    destructor Destroy;override;
    function Total:Currency;
    procedure Validar;
    function Producto(Codigo:Integer):TPedidoProducto;
  end;
function PedidoDinero(V:Extended):Currency;
function PedidoEntero(V:Double):Boolean;
procedure ValidarPreciosPedido(CostoBase:Currency;Modo:TPedidoModoPrecio;
  const Precios:TPedidoPresentaciones);
implementation
uses Math;
procedure TPedidoProducto.CopiarDe(P:TPedidoProducto);
begin
  Codigo:=P.Codigo;CodigoTexto:=P.CodigoTexto;Descripcion:=P.Descripcion;
  CostoAnterior:=P.CostoAnterior;PrecioAnterior:=P.PrecioAnterior;MinimoAnterior:=P.MinimoAnterior;
  CostoNuevo:=P.CostoNuevo;StockAnterior:=P.StockAnterior;Tasa:=P.Tasa;Inventariar:=P.Inventariar;Modo:=P.Modo;
  Precios:=Copy(P.Precios,0,Length(P.Precios));SelloInventario:=P.SelloInventario;
  SelloPresentaciones:=P.SelloPresentaciones;PreciosConfirmados:=P.PreciosConfirmados;
end;
function Finito(V:Double):Boolean;
begin Result:=not IsNan(V) and not IsInfinite(V);end;
function PedidoDinero(V:Extended):Currency;
begin
  if not Finito(V) or (Abs(V)>999999999999) then raise Exception.Create('Importe fuera de rango.');
  if V>=0 then Result:=Trunc(V*100+0.50000001)/100
  else Result:=-Trunc(-V*100+0.50000001)/100;
end;
function PedidoEntero(V:Double):Boolean;
begin Result:=Finito(V) and (Abs(V)<2147483647) and (Abs(V-Round(V))<0.000001);end;
procedure ValidarPreciosPedido(CostoBase:Currency;Modo:TPedidoModoPrecio;
  const Precios:TPedidoPresentaciones);
var I,J,K:Integer;Costo:Currency;Base:Boolean;
begin
  if CostoBase<=0 then raise Exception.Create('Indique el costo del producto.');
  if Length(Precios)=0 then raise Exception.Create('Complete los precios del producto.');
  Base:=False;
  for I:=0 to High(Precios) do begin
    if (Precios[I].Unidad<=0) or not Finito(Precios[I].Factor) or
      (Precios[I].Factor<=0) then raise Exception.Create('Presentacion sin equivalencia valida.');
    for K:=0 to I-1 do if Precios[K].Unidad=Precios[I].Unidad then
      raise Exception.Create('La presentacion esta repetida.');
    if Abs(Precios[I].Factor-1)<0.000001 then Base:=True;
    Costo:=PedidoDinero(CostoBase*Precios[I].Factor);
    if Precios[I].Precios[1]<=Costo then
      raise Exception.Create('El precio 1 debe superar el costo en '+Precios[I].Descripcion+'.');
    for J:=1 to 4 do begin
      if not Finito(Precios[I].Porcientos[J]) then raise Exception.Create('Porcentaje invalido.');
      if Precios[I].Precios[J]<0 then raise Exception.Create('No se permiten precios negativos.');
      if (Modo<>ppSimple) and (Precios[I].Precios[J]>0) and (Precios[I].Precios[J]<=Costo) then
        raise Exception.Create('El precio '+IntToStr(J)+' debe superar el costo de esa presentacion.');
    end;
    // En precio sencillo se utiliza el segundo valor como minimo independiente.
    if (Modo=ppSimple) and ((Precios[I].Precios[2]<=Costo) or
      (Precios[I].Precios[2]>Precios[I].Precios[1])) then
      raise Exception.Create('El minimo debe superar el costo y no exceder el precio de venta.');
  end;
  if not Base then raise Exception.Create('Debe existir una presentacion Unidad con equivalencia 1.');
end;
procedure TPedidoProducto.Proponer(CostoBase:Currency);
var I,J:Integer;CostoPrev,CostoAct:Currency;Porc:Double;
begin
  if Abs(CostoNuevo-CostoBase)<0.00005 then Exit;
  for I:=0 to High(Precios) do begin
    CostoPrev:=PedidoDinero(CostoAnterior*Precios[I].Factor);
    CostoAct:=PedidoDinero(CostoBase*Precios[I].Factor);
    for J:=1 to 4 do begin
      if (Modo=ppSimple) and (J>1) then Continue;
      Porc:=Precios[I].Porcientos[J];
      if (Porc<=0) and (CostoPrev>0) and (Precios[I].Precios[J]>CostoPrev) then
        Porc:=(Precios[I].Precios[J]/CostoPrev-1)*100;
      if Porc>0 then begin
        Precios[I].Porcientos[J]:=Porc;
        Precios[I].Precios[J]:=PedidoDinero(CostoAct*(1+Porc/100));
      end;
    end;
  end;
  CostoNuevo:=CostoBase;PreciosConfirmados:=False;
end;
function TPedidoProducto.PrecioBase:Currency;
var I:Integer;
begin
  Result:=0;
  for I:=0 to High(Precios) do if Abs(Precios[I].Factor-1)<0.000001 then
    begin Result:=Precios[I].Precios[1];Exit;end;
end;
function TPedidoProducto.MinimoBase:Currency;
var I:Integer;
begin
  Result:=PrecioBase;
  if Modo=ppSimple then for I:=0 to High(Precios) do
    if Abs(Precios[I].Factor-1)<0.000001 then begin Result:=Precios[I].Precios[2];Exit;end;
end;
function TPedidoProducto.FirmaPropuesta:string;
var I,J:Integer;
begin
  Result:=CurrToStr(CostoNuevo);
  for I:=0 to High(Precios) do begin
    Result:=Result+'|'+IntToStr(Precios[I].Unidad)+'|'+FloatToStr(Precios[I].Factor);
    for J:=1 to 4 do Result:=Result+'|'+CurrToStr(Precios[I].Precios[J])+'|'+FloatToStr(Precios[I].Porcientos[J]);
  end;
end;
function TPedidoLinea.CostoConItbis:Currency;
begin
  if Producto=nil then raise Exception.Create('Seleccione un producto.');
  if IncluyeItbis then Result:=PedidoDinero(CostoProveedor)
  else Result:=PedidoDinero(CostoProveedor*(1+Producto.Tasa/100));
end;
function TPedidoLinea.CostoBase:Currency;
begin
  if Factor<=0 then raise Exception.Create('Presentacion sin equivalencia.');
  Result:=PedidoDinero(CostoConItbis/Factor);
end;
function TPedidoLinea.CompradasBase:Double;
begin Result:=Cantidad*Factor;end;
function TPedidoLinea.EntradaBase:Double;
begin Result:=(Cantidad+Oferta)*Factor;end;
function TPedidoLinea.Bruto:Currency;
begin Result:=PedidoDinero(Cantidad*CostoConItbis);end;
function TPedidoLinea.MontoDescuento:Currency;
begin Result:=PedidoDinero(Bruto*Descuento/100);end;
function TPedidoLinea.Total:Currency;
begin Result:=Bruto-MontoDescuento;end;
function TPedidoLinea.Impuesto:Currency;
begin Result:=PedidoDinero(Total-Total/(1+Producto.Tasa/100));end;
procedure TPedidoLinea.Validar(Fecha:TDateTime;RequiereLote:Boolean);
begin
  if (Producto=nil) or (Producto.Codigo<=0) then raise Exception.Create('Seleccione un producto.');
  if not PedidoEntero(Cantidad) or (Cantidad<=0) then
    raise Exception.Create('La cantidad de compra debe ser un entero mayor que cero.');
  if not PedidoEntero(Oferta) or (Oferta<0) then raise Exception.Create('La oferta debe ser un entero igual o mayor que cero.');
  if (Unidad<=0) or not PedidoEntero(Factor) or (Factor<=0) or
    not PedidoEntero(EntradaBase) then raise Exception.Create('Revise la equivalencia de la presentacion.');
  if (CostoProveedor<=0) or (CostoBase<=0) then raise Exception.Create('El costo debe ser mayor que cero.');
  if not Finito(Producto.Tasa) or (Producto.Tasa<0) or (Producto.Tasa>100) then raise Exception.Create('Tasa ITBIS invalida.');
  if not Finito(Descuento) or (Descuento<0) or (Descuento>100) then raise Exception.Create('El descuento debe estar entre 0 y 100 %.');
  if Length(Trim(Lote))>25 then raise Exception.Create('El lote admite hasta 25 caracteres.');
  if not Producto.Inventariar and ((Trim(Lote)<>'') or (Vence<>0)) then
    raise Exception.Create('Los lotes corresponden a productos inventariables.');
  if (RequiereLote and Producto.Inventariar) or (Trim(Lote)<>'') or (Vence<>0) then begin
    if (Trim(Lote)='') or (Vence=0) then raise Exception.Create('Complete lote y vencimiento.');
    if Trunc(Vence)<Trunc(Fecha) then raise Exception.Create('El lote vence antes de la fecha de recepcion.');
  end;
  if Total<=0 then raise Exception.Create('El total de la linea debe ser mayor que cero.');
end;
constructor TPedidoRecepcion.Create;
begin inherited;Lineas:=TObjectList.Create(True);Productos:=TObjectList.Create(True);end;
destructor TPedidoRecepcion.Destroy;
begin Lineas.Free;Productos.Free;inherited;end;
function TPedidoRecepcion.Producto(Codigo:Integer):TPedidoProducto;
var I:Integer;
begin Result:=nil;for I:=0 to Productos.Count-1 do
  if TPedidoProducto(Productos[I]).Codigo=Codigo then begin Result:=TPedidoProducto(Productos[I]);Exit;end;end;
function TPedidoRecepcion.Total:Currency;
var I:Integer;
begin Result:=0;for I:=0 to Lineas.Count-1 do Result:=Result+TPedidoLinea(Lineas[I]).Total;end;
procedure TPedidoRecepcion.Validar;
var I,J:Integer;L,P:TPedidoLinea;
begin
  if NumeroGuardado>0 then raise Exception.Create('Esta recepcion ya fue procesada.');
  if ResultadoIncierto then raise Exception.Create('Debe comprobar la recepcion anterior antes de intentar procesar otra vez.');
  if (Empresa<=0) or (Almacen<=0) or (Usuario<=0) then raise Exception.Create('Empresa, almacen y usuario son obligatorios.');
  if (Proveedor<=0) or (Factura<=0) then raise Exception.Create('Complete proveedor y numero de factura.');
  if (Fecha<=0) or (Trunc(Fecha)>Date) then raise Exception.Create('Revise la fecha de recepcion.');
  if not (FormaPago in [1,7,8]) then raise Exception.Create('Seleccione contado o credito.');
  if (FormaPago in [7,8]) and (VencimientoPago<Fecha) then raise Exception.Create('Revise el vencimiento del credito.');
  if (Length(NCF)>21) or (Length(Rnc)>15) then raise Exception.Create('NCF o RNC supera la longitud permitida.');
  if Lineas.Count=0 then raise Exception.Create('Agregue al menos un producto.');
  if TotalProveedor<=0 then raise Exception.Create('Indique el total de la factura del proveedor.');
  for I:=0 to Lineas.Count-1 do begin
    L:=TPedidoLinea(Lineas[I]);
    try
      L.Validar(Fecha,RequiereLote);
      if not L.Producto.PreciosConfirmados then raise Exception.Create('Revise y confirme sus precios.');
      ValidarPreciosPedido(L.Producto.CostoNuevo,L.Producto.Modo,L.Producto.Precios);
      for J:=0 to I-1 do begin
        P:=TPedidoLinea(Lineas[J]);
        if (P.Producto.Codigo=L.Producto.Codigo) and (Trim(P.Lote)=Trim(L.Lote)) and
          (Trunc(P.Vence)<>Trunc(L.Vence)) then raise Exception.Create('El mismo lote tiene vencimientos distintos.');
      end;
    except on E:Exception do raise Exception.Create('Linea '+IntToStr(I+1)+' - '+L.Producto.Descripcion+': '+E.Message);end;
  end;
  if Total>999999999999 then raise Exception.Create('El total del pedido excede el limite.');
  if Abs(Total-TotalProveedor)>0.005 then
    raise Exception.Create('El documento no cuadra con el proveedor. Diferencia: '+CurrToStr(Total-TotalProveedor)+'. Revise costo, ITBIS y descuento.');
end;
end.
