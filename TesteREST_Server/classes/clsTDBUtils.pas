unit clsTDBUtils;

interface
{$M+}
uses
  System.SysUtils,
  System.Classes,
  Data.DB,
  Data.DBCommonTypes,
  Uni,
  DBAccess,
  Postgresqluniprovider;

type
  TColDevQuery = class(TUniQuery);
  TColDevConnection = class(TUniConnection);

  TDBUtils = class(TObject)
  private
    FConexao: TColDevConnection;
    FOwner: TComponent;
    FStringDeConexao: String;
    procedure SetConexao(const Value: TColDevConnection);
    procedure SetOwner(const Value: TComponent);
  public
    constructor Create(AOwner: TComponent; StringDeConexao: String);
    property Owner: TComponent read FOwner write SetOwner;
    property Conexao: TColDevConnection read FConexao write SetConexao;
  published
    function QueryFactory(const Statement: String; OpenIt: Boolean = False): TColDevQuery;
    function ResetQuery(var Query: TColDevQuery): Boolean;
    function SetQuery(var Query: TColDevQuery; const Statement: String): Boolean;
  end;

implementation

{ TDBUtils }

constructor TDBUtils.Create(AOwner: TComponent; StringDeConexao: String);
var
  strl: TStringList;
begin
  Self.FOwner := AOwner;
  if StringDeConexao = EmptyStr then
  begin
    strl:=TStringList.Create;
    strl.LoadFromFile('connectionstring.cfg');
    Self.FConexao := TColDevConnection.Create(nil);
    Self.FConexao.ConnectString := strl.Text;
    // 'Provider Name=PostgreSQL;Login Prompt=False;Data Source=192.168.0.116;User ID=postgres;Password=bitnami;Database=WeBuy;Port=5432';
    FreeAndNil(strl);
  end
  else
  begin
    Self.FStringDeConexao := StringDeConexao;
  end;

  try
    Self.FConexao.AutoCommit := True;
    Self.FConexao.Connect;
  except
    on E:Exception do
    begin
      raise Exception.Create('Erro de conexão com o banco de dados com a mensagem : '+E.Message);
    end;
  end;
end;

function TDBUtils.QueryFactory(const Statement: String; OpenIt: Boolean = False): TColDevQuery;
begin
  Result := TColDevQuery.Create(Self.Owner);
  Result.Connection := Self.Conexao;
  if not Result.Connection.Connected then
    Result.Connection.Connect;
  Result.SQL.Add(Statement);
  if OpenIt then
    Result.Open;
end;

function TDBUtils.ResetQuery(var Query: TColDevQuery): Boolean;
begin
  Result := False;
  try
    Query.Close;
    Query.SQL.Clear;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TDBUtils.SetConexao(const Value: TColDevConnection);
begin
  FConexao := Value;
end;

procedure TDBUtils.SetOwner(const Value: TComponent);
begin
  FOwner := Value;
end;

function TDBUtils.SetQuery(var Query: TColDevQuery; const Statement: String): Boolean;
begin
  Self.ResetQuery(query);
  query.SQL.Add(Statement);
end;

end.
