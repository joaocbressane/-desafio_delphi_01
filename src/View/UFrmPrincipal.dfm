object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Gest'#227'o de Contratos e Produdores'
  ClientHeight = 422
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 422
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    object Button2: TButton
      Left = 184
      Top = 137
      Width = 105
      Height = 104
      Caption = 'Gr'#227'os'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 305
      Top = 137
      Width = 105
      Height = 104
      Caption = 'Traders'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 424
      Top = 137
      Width = 105
      Height = 104
      Caption = 'Contratos'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button1: TButton
      Left = 56
      Top = 137
      Width = 105
      Height = 104
      Caption = 'Produtores'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button5: TButton
      Left = 552
      Top = 137
      Width = 105
      Height = 104
      Caption = 'Relat'#243'rio'
      TabOrder = 4
      OnClick = Button5Click
    end
  end
end
