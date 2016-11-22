program TesteJSON;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Form2},
  clsTDBUtils in 'classes\clsTDBUtils.pas',
  clsTUsuario in 'classes\clsTUsuario.pas',
  clsTUsuarioDAO in 'classes\clsTUsuarioDAO.pas',
  clsTUsuarioDTO in 'classes\clsTUsuarioDTO.pas',
  libEnumTypes in 'classes\libEnumTypes.pas',
  libRecordTypes in 'classes\libRecordTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
