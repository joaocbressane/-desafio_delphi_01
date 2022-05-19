object FrmGraos: TFrmGraos
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Gest'#227'o de Gr'#227'os'
  ClientHeight = 484
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 484
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 8
      Width = 457
      Height = 449
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Pesquisar Gr'#227'os'
        object GroupBox1: TGroupBox
          Left = 3
          Top = 3
          Width = 206
          Height = 54
          Caption = 'Op'#231#245'es'
          TabOrder = 0
          object Button1: TButton
            Left = 15
            Top = 16
            Width = 54
            Height = 25
            Caption = 'Novo'
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 75
            Top = 16
            Width = 54
            Height = 25
            Caption = 'Alterar'
            TabOrder = 1
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 135
            Top = 16
            Width = 54
            Height = 25
            Caption = 'Excluir'
            TabOrder = 2
            OnClick = Button3Click
          end
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 63
          Width = 430
          Height = 354
          Caption = 'Pesquisar'
          TabOrder = 1
          object RadioButton1: TRadioButton
            Left = 16
            Top = 24
            Width = 75
            Height = 17
            Caption = 'Descri'#231#227'o'
            TabOrder = 0
          end
          object Edit1: TEdit
            Left = 16
            Top = 47
            Width = 401
            Height = 21
            TabOrder = 1
            Text = 'Edit1'
            OnChange = Edit1Change
          end
          object Button4: TButton
            Left = 15
            Top = 74
            Width = 75
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 2
            OnClick = Button4Click
          end
          object DBGrid1: TDBGrid
            Left = 16
            Top = 112
            Width = 401
            Height = 233
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = DBGrid1DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'IDGRAO'
                Title.Alignment = taCenter
                Title.Caption = 'ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Alignment = taCenter
                Title.Caption = 'Descri'#231#227'o'
                Width = 300
                Visible = True
              end>
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Cadastro Gr'#227'os'
        ImageIndex = 1
        object Button5: TButton
          Left = 3
          Top = 127
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 0
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 84
          Top = 127
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = Button6Click
        end
        object GroupBox3: TGroupBox
          Left = 3
          Top = 0
          Width = 401
          Height = 121
          Caption = 'Informa'#231#245'es'
          TabOrder = 2
          object Label2: TLabel
            Left = 16
            Top = 65
            Width = 46
            Height = 13
            Caption = 'Descri'#231#227'o'
          end
          object Label1: TLabel
            Left = 16
            Top = 17
            Width = 11
            Height = 13
            Caption = 'ID'
          end
          object Edit2: TEdit
            Left = 16
            Top = 84
            Width = 369
            Height = 21
            TabOrder = 0
            Text = 'Edit2'
            OnExit = Edit2Exit
          end
          object Edit3: TEdit
            Left = 16
            Top = 36
            Width = 46
            Height = 21
            Enabled = False
            TabOrder = 1
            Text = 'Edit3'
          end
        end
      end
    end
  end
end
