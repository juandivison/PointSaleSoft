DigitalPersona + Delphi 7 + IBX (Firebird 2.5) — Autorización de tareas por huella

CONTENIDO
- UFingerprintTypes.pas       Tipos compartidos (TFpCandidate)
- UVarBytes.pas               Conversiones BLOB <-> Variant(varByte[])
- UFrmFpEnroll.pas/.dfm       Form de enrolamiento (guarda templates en BD)
- UFrmFpVerify.pas/.dfm       Form de verificación (match contra candidatos)
- UFingerprintIBX.pas         Fachada: EnrolarHuellaUsuarioIBX / AutorizarTareaPorHuellaIBX

REQUISITOS
1) Ya debes tener importado/instalado el ActiveX "DigitalPersona One Touch for Windows Control 1.0"
   (esto genera DPFPCtlXLib_TLB.pas y los componentes TDPFPEnrollmentControl / TDPFPVerificationControl).
2) En cada PC deben existir los COM del SDK (x86):
   - DPFPEngX.DPFPVerification   (Engine de verificación)
   - DPFPShrX.DPFPTemplate       (Template Serialize/Deserialize)
   Si CreateOleObject falla, el SDK/runtime no está instalado o no está registrado en esa PC (32-bit).

TABLAS (sugeridas)
- SEC_TAREA (CODIGO único)
- SEC_TAREA_AUTORIZA (TAREA_ID, COD_USUARIO)
- SEC_USUARIO_HUELLA (COD_USUARIO, DEDO_MASK, TEMPLATE BLOB) con índice único (COD_USUARIO, DEDO_MASK)
- Generador: GEN_SEC_USUARIO_HUELLA (para ID)

USO
1) Enrolar huella:
   EnrolarHuellaUsuarioIBX(CodUsuario, dm.DB);

2) Autorizar tarea:
   if AutorizarTareaPorHuellaIBX('ANULAR_FACTURA', dm.DB, CodAutorizo, FAR) then
     ... autorizado ...
   else
     ... denegado ...

NOTAS
- El enrolamiento inserta o actualiza (sin pre-consulta) usando la violación de índice único (-803) como señal.
- Las consultas de candidatos se filtran por TaskCode (performance y seguridad).
