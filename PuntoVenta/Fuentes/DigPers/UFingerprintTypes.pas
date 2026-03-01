unit UFingerprintTypes;

interface

uses
  Variants;

type
  TFpCandidate = record
    CodUsuario: Integer;
    TemplateBytes: OleVariant; // varByte[] listo para Deserialize
  end;

  TFpCandidateArray = array of TFpCandidate;

implementation

end.
