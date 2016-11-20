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
     clsTUsuario;

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
begin
  usu := TUsuario.Create;
  usu.DTO.ID := 1;
  usu.DTO.Nome := 'Teste';
  usu.DTO.Nasc := EncodeDate(2016,10,30);
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

