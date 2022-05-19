object FrmTraders: TFrmTraders
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Gest'#227'o de Traders'
  ClientHeight = 482
  ClientWidth = 889
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
    Width = 889
    Height = 482
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 857
      Height = 441
      ActivePage = TabSheet3
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Pesquisar Traders'
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
            Width = 49
            Height = 17
            Caption = 'Nome'
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
            Left = 16
            Top = 74
            Width = 75
            Height = 25
            Caption = 'Pesquisar'
            TabOrder = 2
            OnClick = Button4Click
          end
          object DBGrid1: TDBGrid
            Left = 16
            Top = 105
            Width = 401
            Height = 232
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = DBGrid1CellClick
            OnDblClick = DBGrid1DblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'IDTRADE'
                Title.Alignment = taCenter
                Title.Caption = 'ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME'
                Title.Alignment = taCenter
                Width = 300
                Visible = True
              end>
          end
        end
        object GroupBox4: TGroupBox
          Left = 456
          Top = 64
          Width = 385
          Height = 345
          Caption = 'Silos'
          TabOrder = 2
          object DBGrid2: TDBGrid
            Left = 24
            Top = 64
            Width = 337
            Height = 265
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
                FieldName = 'IDSILO'
                Title.Alignment = taCenter
                Title.Caption = 'ID'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CAPACIDADE'
                Title.Alignment = taCenter
                Width = 100
                Visible = True
              end>
          end
          object Button7: TButton
            Left = 32
            Top = 19
            Width = 75
            Height = 25
            Caption = 'Novo'
            TabOrder = 1
            OnClick = Button7Click
          end
          object Button9: TButton
            Left = 113
            Top = 19
            Width = 75
            Height = 25
            Caption = 'Excluir'
            TabOrder = 2
            OnClick = Button9Click
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Cadastro Traders'
        ImageIndex = 1
        object Button5: TButton
          Left = 16
          Top = 136
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 0
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 97
          Top = 136
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = Button6Click
        end
        object GroupBox3: TGroupBox
          Left = 16
          Top = 9
          Width = 417
          Height = 121
          Caption = 'Informa'#231#245'es'
          TabOrder = 2
          object Label2: TLabel
            Left = 16
            Top = 13
            Width = 11
            Height = 13
            Caption = 'ID'
          end
          object Label1: TLabel
            Left = 16
            Top = 61
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object Edit2: TEdit
            Left = 16
            Top = 32
            Width = 59
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = 'Edit2'
          end
          object Edit3: TEdit
            Left = 16
            Top = 80
            Width = 385
            Height = 21
            TabOrder = 1
            Text = 'Edit2'
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Cadastro de Silos'
        ImageIndex = 2
        object GroupBox5: TGroupBox
          Left = 16
          Top = 3
          Width = 369
          Height = 174
          Caption = 'Informa'#231#245'es'
          TabOrder = 0
          object Label3: TLabel
            Left = 16
            Top = 24
            Width = 42
            Height = 13
            Caption = 'ID Trade'
          end
          object Label4: TLabel
            Left = 16
            Top = 69
            Width = 35
            Height = 13
            Caption = 'ID Silos'
          end
          object Label5: TLabel
            Left = 16
            Top = 115
            Width = 80
            Height = 13
            Caption = 'Capacidade (KG)'
          end
          object Edit4: TEdit
            Left = 16
            Top = 43
            Width = 56
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = 'Edit4'
          end
          object Edit5: TEdit
            Left = 16
            Top = 88
            Width = 56
            Height = 21
            Enabled = False
            TabOrder = 1
            Text = 'Edit5'
          end
          object Edit6: TEdit
            Left = 16
            Top = 134
            Width = 121
            Height = 21
            TabOrder = 2
            Text = 'Edit6'
            OnKeyPress = Edit6KeyPress
          end
        end
        object Button10: TButton
          Left = 16
          Top = 183
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = Button10Click
        end
        object Button11: TButton
          Left = 104
          Top = 183
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = Button11Click
        end
      end
    end
  end
end
