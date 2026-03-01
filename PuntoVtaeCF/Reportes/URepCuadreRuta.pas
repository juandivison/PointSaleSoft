unit URepCuadreRuta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqckCuadreRuta = class(TQuickRep)
  private

  public

  end;

var
  qckCuadreRuta: TqckCuadreRuta;

implementation

uses UDatModCuadrexRuta, UDatModReportes;

{$R *.DFM}

end.
