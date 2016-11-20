unit clsTUsuario;

interface

uses
  System.SysUtils,
  System.Classes,
  System.JSON,
  REST.JSON,
  Data.DBXJSON,
  Data.DBXJSONReflect,
  clsTUsuarioDTO;

type
  TUsuario = class
  private
    FMarshal: TJSONMarshal;
    FUnMarshal: TJSONUnMarshal;
    FDTO: TUsuarioDTO;
    procedure RegisterConverters;
    procedure RegisterReverters;
    procedure SetDTO(const Value: TUsuarioDTO);
    function GetDTO: TUsuarioDTO;
  public
    constructor Create; overload;
    constructor Create(pNome, pEmail: String; pNasc: TDateTIme); overload;
    constructor Create(pID: Integer; pNome, pEmail: String; pNasc: TDateTIme); overload;
    constructor Create(JSON: String); overload;
    destructor Destroy;
  published
    property DTO: TUsuarioDTO read GetDTO write SetDTO;
    function ToJSON: String;
    function FromJSON(JSON: string): Boolean;
  end;

implementation

{ TUsuario }

procedure TUsuario.RegisterConverters;
begin

end;

procedure TUsuario.RegisterReverters;
begin

end;

constructor TUsuario.Create(pNome, pEmail: String; pNasc: TDateTIme);
begin
  Self.FDTO.Nome := pNome;
  Self.FDTO.Nasc := pNasc;
  Self.FDTO.Email := pEmail;
end;

constructor TUsuario.Create;
begin
  Self.FDTO := TUsuarioDTO.Create;
  Self.FMarshal := TJSONMarshal.Create;
  Self.FUnMarshal := TJSONUnMarshal.Create;
  Self.RegisterConverters;
  Self.RegisterReverters;
end;

constructor TUsuario.Create(JSON: String);
begin
  Self.FMarshal := TJSONMarshal.Create;
  Self.FUnMarshal := TJSONUnMarshal.Create;
  Self.RegisterConverters;
  Self.RegisterReverters;
  Self.FromJSON(JSON);
end;

destructor TUsuario.Destroy;
begin
  Self.FDTO.Destroy;
  Self.FMarshal.Destroy;
  Self.FUnMarshal.Destroy;
  inherited;
end;

function TUsuario.FromJSON(JSON: string): Boolean;
begin
  Result := False;
  try
    Self.FDTO := Self.FUnMarshal.Unmarshal(TJSONObject.ParseJSONValue(JSON)) as TUsuarioDTO;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TUsuario.SetDTO(const Value: TUsuarioDTO);
begin
  Self.FDTO := Value;
end;

constructor TUsuario.Create(pID: Integer; pNome, pEmail: String; pNasc: TDateTIme);
begin
  Self.FDTO := TUsuarioDTO.Create;
  Self.FDTO.Nome := pNome;
  Self.FDTO.Nasc := pNasc;
  Self.FDTO.Email := pEmail;
  Self.FDTO.ID := pID;
end;

function TUsuario.GetDTO: TUsuarioDTO;
begin
  Result := Self.FDTO;
end;

function TUsuario.ToJSON: String;
begin
  Result := Self.FMarshal.Marshal(Self.DTO).ToJSON;
end;

end.
