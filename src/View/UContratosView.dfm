object FrmContratos: TFrmContratos
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Gest'#227'o de Contratos'
  ClientHeight = 481
  ClientWidth = 762
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
    Width = 762
    Height = 481
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 760
      Height = 479
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Contratos'
        object GroupBox1: TGroupBox
          Left = 3
          Top = 3
          Width = 334
          Height = 62
          Caption = 'Op'#231#245'es'
          TabOrder = 0
          object Button1: TButton
            Left = 16
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Novo'
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button3: TButton
            Left = 97
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 1
            OnClick = Button3Click
          end
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 71
          Width = 566
          Height = 377
          Caption = 'Pesquisar'
          TabOrder = 1
          object RadioButton2: TRadioButton
            Left = 24
            Top = 24
            Width = 89
            Height = 17
            Caption = 'CNPJ Produtor'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RadioButton3: TRadioButton
            Left = 119
            Top = 24
            Width = 86
            Height = 17
            Caption = 'Nome Trade'
            TabOrder = 1
          end
          object Edit1: TEdit
            Left = 24
            Top = 47
            Width = 329
            Height = 21
            TabOrder = 2
            Text = 'Edit1'
            OnChange = Edit1Change
          end
          object Button4: TButton
            Left = 24
            Top = 74
            Width = 75
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 3
            OnClick = Button4Click
          end
          object DBGrid1: TDBGrid
            Left = 24
            Top = 112
            Width = 529
            Height = 249
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'idContrato'
                Title.Alignment = taCenter
                Title.Caption = 'Contrato'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nome'
                Title.Alignment = taCenter
                Title.Caption = 'Produtor'
                Width = 200
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
                FieldName = 'nometrade'
                Title.Alignment = taCenter
                Title.Caption = 'Trade'
                Visible = True
              end>
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Cadastro Contratos'
        ImageIndex = 1
        object GroupBox3: TGroupBox
          Left = 3
          Top = 3
          Width = 454
          Height = 262
          Caption = 'Informa'#231#245'es'
          TabOrder = 0
          object Label1: TLabel
            Left = 24
            Top = 24
            Width = 11
            Height = 13
            Caption = 'ID'
          end
          object Label2: TLabel
            Left = 24
            Top = 72
            Width = 42
            Height = 13
            Caption = 'Produtor'
          end
          object Label3: TLabel
            Left = 24
            Top = 119
            Width = 23
            Height = 13
            Caption = 'Gr'#227'o'
          end
          object Label4: TLabel
            Left = 24
            Top = 165
            Width = 28
            Height = 13
            Caption = 'Trade'
          end
          object Label5: TLabel
            Left = 24
            Top = 208
            Width = 80
            Height = 13
            Caption = 'Quantidade (KG)'
          end
          object SpeedButton1: TSpeedButton
            Left = 375
            Top = 91
            Width = 23
            Height = 22
            OnClick = SpeedButton1Click
          end
          object SpeedButton2: TSpeedButton
            Left = 375
            Top = 138
            Width = 23
            Height = 22
            OnClick = SpeedButton2Click
          end
          object SpeedButton3: TSpeedButton
            Left = 72
            Top = 180
            Width = 23
            Height = 22
            OnClick = SpeedButton3Click
          end
          object Edit2: TEdit
            Left = 24
            Top = 43
            Width = 42
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = 'Edit2'
          end
          object Edit3: TEdit
            Left = 24
            Top = 91
            Width = 42
            Height = 21
            TabOrder = 1
            Text = 'Edit3'
          end
          object Edit4: TEdit
            Left = 24
            Top = 138
            Width = 42
            Height = 21
            TabOrder = 2
            Text = 'Edit4'
          end
          object Edit5: TEdit
            Left = 24
            Top = 181
            Width = 42
            Height = 21
            TabOrder = 3
            Text = 'Edit5'
          end
          object Edit6: TEdit
            Left = 24
            Top = 227
            Width = 121
            Height = 21
            TabOrder = 4
            Text = 'Edit6'
            OnExit = Edit6Exit
            OnKeyPress = Edit6KeyPress
          end
          object Edit7: TEdit
            Left = 72
            Top = 91
            Width = 297
            Height = 21
            Enabled = False
            TabOrder = 5
            Text = 'Edit7'
          end
          object Edit8: TEdit
            Left = 72
            Top = 138
            Width = 297
            Height = 21
            Enabled = False
            TabOrder = 6
            Text = 'Edit8'
          end
        end
        object Button5: TButton
          Left = 3
          Top = 271
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 84
          Top = 271
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = Button6Click
        end
      end
    end
  end
end
