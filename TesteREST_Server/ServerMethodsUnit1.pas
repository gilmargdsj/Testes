unit ServerMethodsUnit1;

interface

uses System.SysUtils,
     System.Classes,
     Datasnap.DSServer,
     Datasnap.DSAuth;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Usuario(Value: String): String;
    function acceptUsuario(Value: String): String;
    function cancelUsuario(Value: String): String;
    function updateUsuario(Value: String): String;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils,
     clsTUsuario,
     clsTDBUtils;

function TServerMethods1.updateUsuario(Value: String): String;
var
  usu: TUsuario;

begin
  usu := TUsuario.Create;
  usu.DTO.ID := 1;
  usu.DTO.Nome := 'Teste';
  usu.DTO.Nasc := EncodeDate(2016,10,30);
  Result := usu.ToJSON;
end;

function TServerMethods1.Usuario(Value: String): String;
var
  usu: TUsuario;
  dbu: TDBUtils;
  q: TColDevQuery;
begin
  dbu:=TDBUtils.Create(Self, '');
  q:=dbu.QueryFactory('SELECT * FROM USUARIOS.USUARIOS WHERE ID_USUARIO ='+Value);
  q.Open;
  if not q.Eof then
  begin
    usu := TUsuario.Create;
    usu.DTO.ID := q.Fields.FieldByName('id_usuario').AsInteger;
    usu.DTO.Nome := q.Fields.FieldByName('nome').AsString;
    usu.DTO.Nasc := q.Fields.FieldByName('nasc').AsDateTime;
    usu.DTO.Email := q.Fields.FieldByName('email').AsString;
  end;
  Result := usu.ToJSON;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.acceptUsuario(Value: String): String;
var
  usu: TUsuario;
begin
  usu := TUsuario.Create;
  usu.DTO.ID := 1;
  usu.DTO.Nome := 'Teste';
  usu.DTO.Nasc := EncodeDate(2016,10,30);
  Result := usu.ToJSON;
end;

function TServerMethods1.cancelUsuario(Value: String): String;
var
  usu: TUsuario;
begin
  usu := TUsuario.Create;
  usu.DTO.ID := 1;
  usu.DTO.Nome := 'Teste';
  usu.DTO.Nasc := EncodeDate(2016,10,30);
  Result := usu.ToJSON;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;
end.

