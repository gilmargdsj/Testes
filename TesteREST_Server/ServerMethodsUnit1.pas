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
    function NovoUsuario(Value: String): String;
    function RemoveUsuario(Value: String): String;
    function AtualizaUsuario(Value: String): String;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils,
     clsTUsuario;

function TServerMethods1.AtualizaUsuario(Value: String): String;
begin

end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.NovoUsuario(Value: String): String;
var
  usu: TUsuario;
begin

end;

function TServerMethods1.RemoveUsuario(Value: String): String;
begin

end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;
end.

