unit UBridgePedidoQA;
interface
uses Forms,UPedidoRecepcionModelo,UPedidoRecepcionDatos;
type TfrmPrecioUnidadNivel=class(TForm) end;
function EditarPreciosRecepcion(const Nombre:string;Costo:Currency;
  Modo:TPedidoModoPrecio;var Precios:TPedidoPresentaciones;
  const Unidades:TPedidoUnidades):Boolean;

implementation
uses UPedidoPreciosBorrador;
function EditarPreciosRecepcion(const Nombre:string;Costo:Currency;
  Modo:TPedidoModoPrecio;var Precios:TPedidoPresentaciones;
  const Unidades:TPedidoUnidades):Boolean;
var F:TfrmPrecioUnidadNivel;
begin
  F:=TfrmPrecioUnidadNivel.CreateNew(nil);
  try Result:=EditarPreciosPedido(F,Nombre,Costo,Modo,Precios,Unidades);
  finally F.Free;end;
end;



end.

