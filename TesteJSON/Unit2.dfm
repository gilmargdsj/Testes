object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 559
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 0
    Top = 313
    Width = 632
    Height = 9
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 249
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 313
    Align = alTop
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 137
      Width = 630
      Height = 9
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 57
    end
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 630
      Height = 136
      Align = alTop
      Lines.Strings = (
        
          '{"result":["{\"type\":\"clsTUsuarioDTO.TUsuarioDTO\",\"id\":1,\"' +
          'fields\":{\"FNasc\":28793,\"FNome\":\"Gilmar\",\"FID\":1,'
        '\"FEmail\":\"gilmargdsj@gmail.com\",\"FAlterado\":true}}"]}')
      TabOrder = 0
    end
    object Memo2: TMemo
      Left = 1
      Top = 146
      Width = 630
      Height = 166
      Align = alClient
      Lines.Strings = (
        'Memo2')
      TabOrder = 1
      ExplicitLeft = 48
      ExplicitTop = 79
      ExplicitWidth = 154
      ExplicitHeight = 55
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 322
    Width = 632
    Height = 237
    Align = alClient
    TabOrder = 1
    ExplicitTop = 320
    ExplicitHeight = 239
    object SpeedButton2: TSpeedButton
      Left = 145
      Top = 6
      Width = 89
      Height = 22
      Caption = '/\'
      OnClick = SpeedButton2Click
    end
    object SpeedButton1: TSpeedButton
      Left = 17
      Top = 6
      Width = 97
      Height = 25
      Caption = 'V'
      OnClick = SpeedButton1Click
    end
    object Edit1: TEdit
      Left = 56
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 56
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 56
      Top = 136
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 56
      Top = 176
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit4'
    end
    object BuscarNoBanco: TCheckBox
      Left = 208
      Top = 56
      Width = 97
      Height = 17
      Caption = 'Buscar No Banco'
      TabOrder = 4
    end
  end
end
