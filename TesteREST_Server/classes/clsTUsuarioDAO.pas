unit clsTUsuarioDAO;

interface

uses
  System.SysUtils,
  System.Classes,
  clsTDBUtils,
  clsTUsuarioDTO;

type
  TUsuarioDAO = class(TComponent)
  private
    FDBUtils: TDBUtils;
    function GetLastID: Integer;
  public
    constructor Create;
    destructor Destroy;
    property DBUtils: TDBUtils read FDBUtils;
    function Get(const ID: Integer): TUsuarioDTO;
    function Post(const ID: Integer; const Usuario: TUsuarioDTO): Boolean;
    function Put(var Usuario: TUsuarioDTO): Boolean;
    function Delete(const ID: Integer): Boolean; overload;
    function Delete(const Usuario: TUsuarioDTO): Boolean; overload;
  end;

implementation

{ TUsuarioDAO }

constructor TUsuarioDAO.Create;
begin
  Self.FDBUtils := TDBUtils.Create(Self, '');
end;

destructor TUsuarioDAO.Destroy;
begin
  Self.FDBUtils.Free;
  inherited;
end;

function TUsuarioDAO.Delete(const ID: Integer): Boolean;
var
  q: TColDevQuery;
begin
  try
    q:=Self.FDBUtils.QueryFactory('DELETE FROM USUARIOS.USUARIOS WHERE ID_USUARIO = '+IntToStr(ID));
    q.ExecSQL;
    FreeAndNil(q);
  except
    on E:Exception do
    begin
      FreeAndNil(q);
      raise Exception.Create('Impossível excluir o usuário - erro : '+E.Message);
    end;
  end;
end;

function TUsuarioDAO.Delete(const Usuario: TUsuarioDTO): Boolean;
var
  q: TColDevQuery;
begin
  try
    q:=Self.FDBUtils.QueryFactory('DELETE FROM USUARIOS.USUARIOS WHERE ID_USUARIO = '+IntToStr(Usuario.ID));
    q.ExecSQL;
    FreeAndNil(q);
  except
    on E:Exception do
    begin
      FreeAndNil(q);
      raise Exception.Create('Impossível excluir o usuário - erro : '+E.Message);
    end;
  end;
end;

function TUsuarioDAO.Get(const ID: Integer): TUsuarioDTO;
var
  q: TColDevQuery;
begin
  q:=Self.FDBUtils.QueryFactory('SELECT * FROM USUARIOS.USUARIOS WHERE ID_USUARIO ='+IntToStr(ID));
  q.Open;
  if not q.Eof then
  begin
    Result := TUsuarioDTO.Create;
    Result.ID := q.Fields.FieldByName('id_usuario').AsInteger;
    Result.Nome := q.Fields.FieldByName('nome').AsString;
    Result.Nasc := q.Fields.FieldByName('nasc').AsDateTime;
    Result.Email := q.Fields.FieldByName('email').AsString;
  end;
  FreeAndNil(q);
end;

function TUsuarioDAO.GetLastID: Integer;
var
  q: TColDevQuery;
begin
  q:=Self.FDBUtils.QueryFactory('select nextval('+QuotedStr('usuarios.seq_id_usuario')+')');
  q.Open;
  Result := q.Fields.Fields[0].AsInteger;
  FreeAndNil(q);
end;

function TUsuarioDAO.Post(const ID: Integer; const Usuario: TUsuarioDTO): Boolean;
begin

end;

function TUsuarioDAO.Put(var Usuario: TUsuarioDTO): Boolean;
var
  q: TColDevQuery;
begin
  Usuario.ID := Self.GetLastID;
  q:=Self.FDBUtils.QueryFactory('INSERT INTO USUARIOS.USUARIOS (id_usuario, nome, nasc, email) values(:id_usuario, :nome, :email, :nasc)');
  q.ParamByName('id_usuario').AsInteger := Usuario.ID;
  q.ParamByName('nome').AsString := Usuario.Nome;
  q.ParamByName('email').AsString := Usuario.Email;
  q.ParamByName('nasc').AsDate := Usuario.Nasc;
  if q.ParamCheck then
    q.ExecSQL;
  FreeAndNil(q);
end;

end.
