object FrmRelatorio: TFrmRelatorio
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Relat'#243'rio Geral Contratos'
  ClientHeight = 638
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 696
    Height = 638
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 224
    ExplicitTop = 216
    ExplicitWidth = 185
    ExplicitHeight = 41
    object GroupBox1: TGroupBox
      Left = 16
      Top = 16
      Width = 665
      Height = 601
      Caption = 'Contratos'
      TabOrder = 0
      object DBGrid1: TDBGrid
        Left = 16
        Top = 24
        Width = 633
        Height = 561
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'produtor'
            Title.Alignment = taCenter
            Title.Caption = 'Produtor'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'trade'
            Title.Alignment = taCenter
            Title.Caption = 'Trade'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'grao'
            Title.Alignment = taCenter
            Title.Caption = 'Gr'#227'o'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Width = 100
            Visible = True
          end>
      end
    end
  end
end
