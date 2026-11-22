unit UPedidoRecepcionReporte;
interface
uses UPedidoRecepcionModelo,QuickRpt;
function CrearReporteRecepcionPedido(P:TPedidoRecepcion):TQuickRep;
procedure VistaPreviaRecepcionPedido(P:TPedidoRecepcion);
implementation
uses SysUtils,Classes,DB,QRPrntr,QRCtrls,RxMemDS,Graphics;
function CrearReporteRecepcionPedido(P:TPedidoRecepcion):TQuickRep;
var R:TQuickRep;D:TRxMemoryData;Titulo,Columnas,Detalle,Resumen:TQRBand;I:Integer;L:TPedidoLinea;
  Descuento,Itbis:Currency;
  procedure Texto(B:TQRBand;const S:string;X,Y,W:Integer;Negrita:Boolean=False);
  var C:TQRLabel;
  begin C:=TQRLabel.Create(R);C.Parent:=B;C.SetBounds(X,Y,W,20);C.AutoSize:=False;C.Caption:=S;C.Font.Name:='Arial';C.Font.Size:=9;if Negrita then C.Font.Style:=[fsBold];end;
  procedure Campo(const N:string;X,W:Integer);
  var C:TQRDBText;
  begin C:=TQRDBText.Create(R);C.Parent:=Detalle;C.SetBounds(X,2,W,32);C.AutoSize:=False;C.WordWrap:=True;C.AutoStretch:=True;C.DataSet:=D;C.DataField:=N;C.Font.Name:='Arial';C.Font.Size:=8;end;
begin
  if P.NumeroGuardado<=0 then raise Exception.Create('Primero debe procesar la recepcion.');
  R:=TQuickRep.CreateNew(nil);D:=TRxMemoryData.Create(R);
  try
    D.FieldDefs.Add('Producto',ftString,200);D.FieldDefs.Add('Cantidad',ftString,45);
    D.FieldDefs.Add('Costo',ftString,25);D.FieldDefs.Add('Descuento',ftString,20);D.FieldDefs.Add('Total',ftString,25);D.Open;
    Descuento:=0;Itbis:=0;
    for I:=0 to P.Lineas.Count-1 do begin
      L:=TPedidoLinea(P.Lineas[I]);D.Append;
      D.FieldByName('Producto').AsString:=L.Producto.CodigoTexto+' '+L.Producto.Descripcion;
      if L.Lote<>'' then D.FieldByName('Producto').AsString:=D.FieldByName('Producto').AsString+' | Lote '+L.Lote+' vence '+DateToStr(L.Vence);
      D.FieldByName('Cantidad').AsString:=FloatToStr(L.Cantidad)+' '+L.Presentacion;
      if L.Oferta>0 then D.FieldByName('Cantidad').AsString:=D.FieldByName('Cantidad').AsString+' + '+FloatToStr(L.Oferta)+' oferta';
      D.FieldByName('Costo').AsString:=FormatFloat('#,##0.00',L.CostoConItbis);
      D.FieldByName('Descuento').AsString:=FormatFloat('0.##',L.Descuento)+' %';
      D.FieldByName('Total').AsString:=FormatFloat('#,##0.00',L.Total);D.Post;
      Descuento:=Descuento+L.MontoDescuento;Itbis:=Itbis+L.Impuesto;
    end;
    D.First;R.DataSet:=D;R.ReportTitle:='Recepcion '+IntToStr(P.NumeroGuardado);
    R.Page.PaperSize:=Letter;R.Page.LeftMargin:=10;R.Page.RightMargin:=10;R.Page.TopMargin:=10;R.Page.BottomMargin:=10;
    Titulo:=TQRBand.Create(R);Titulo.Parent:=R;Titulo.BandType:=rbTitle;Titulo.Height:=125;
    Texto(Titulo,P.NombreEmpresa,0,0,700,True);
    Texto(Titulo,'RECEPCION DE MERCANCIA #'+IntToStr(P.NumeroGuardado),0,25,700,True);
    Texto(Titulo,'Proveedor: '+P.NombreProveedor+' | Factura: '+IntToStr(P.Factura),0,51,700);
    Texto(Titulo,'RNC: '+P.Rnc+' | NCF: '+P.NCF,0,73,700);
    Texto(Titulo,'Fecha: '+DateToStr(P.Fecha)+' | Almacen: '+P.NombreAlmacen,0,95,700);
    Columnas:=TQRBand.Create(R);Columnas.Parent:=R;Columnas.BandType:=rbColumnHeader;Columnas.Height:=25;
    Texto(Columnas,'Producto / lote',0,2,280,True);Texto(Columnas,'Cantidad',285,2,125,True);
    Texto(Columnas,'Costo c/ITBIS',415,2,100,True);Texto(Columnas,'Desc.',520,2,60,True);Texto(Columnas,'Total',585,2,100,True);
    Detalle:=TQRBand.Create(R);Detalle.Parent:=R;Detalle.BandType:=rbDetail;Detalle.Height:=40;
    Campo('Producto',0,280);Campo('Cantidad',285,125);Campo('Costo',415,100);Campo('Descuento',520,60);Campo('Total',585,100);
    Resumen:=TQRBand.Create(R);Resumen.Parent:=R;Resumen.BandType:=rbSummary;Resumen.Height:=105;
    Texto(Resumen,'Descuento del proveedor: '+FormatFloat('#,##0.00',Descuento),360,8,325);
    Texto(Resumen,'ITBIS contenido en el total: '+FormatFloat('#,##0.00',Itbis),360,31,325);
    Texto(Resumen,'TOTAL RD$ '+FormatFloat('#,##0.00',P.Total),360,55,325,True);
    Texto(Resumen,'Usuario: '+P.NombreUsuario,0,78,320);Result:=R;
  except R.Free;raise;end;
end;
procedure VistaPreviaRecepcionPedido(P:TPedidoRecepcion);
var R:TQuickRep;
begin
  R:=CrearReporteRecepcionPedido(P);try R.Preview;finally R.Free;end;
end;
end.
