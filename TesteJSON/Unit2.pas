unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Memo1: TMemo;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    Memo2: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    BuscarNoBanco: TCheckBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  clsTUsuario,
  libEnumTypes;

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  usu: TUsuario;
begin
  usu:=TUsuario.Create;
  usu.FromJSON(Memo1.Lines.Text);
  Edit1.Text := IntTOStr(usu.DTO.ID);
  Edit2.Text := usu.DTO.Nome;
  Edit3.Text := FormatDateTime('DD/MM/YYYY HH:nn:SS', usu.DTO.Nasc);
  Edit4.Text := usu.DTO.Email;
  FreeAndNil(usu);
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
var
  usu: TUsuario;
begin
  Memo2.Lines.Clear;
  usu := TUsuario.Create;
  if BuscarNoBanco.Checked then
  begin
    usu.DTO.ID := StrToInt(Edit1.Text);
    usu.Persiste(todSelect);
    Edit2.Text := usu.DTO.Nome;
    Edit3.Text := FormatDateTime('DD/MM/YYYY HH:nn:SS', usu.DTO.Nasc);
    Edit4.Text := usu.DTO.Email;
  end
  else
  begin
    usu.DTO.ID := StrToInt(Edit1.Text);
    usu.DTO.Nome := Edit2.Text;
    //usu.DTO.Nasc := Edit3.Text;
    usu.DTO.Email := Edit4.Text;
  end;

  Memo2.Lines.Add(usu.ToJSON);
  FreeAndNil(usu);
end;

end.
