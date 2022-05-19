unit UGraosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, UDMGraos,UGraosModel;

type
  TOpcoes = (OpNovo, OpAlterar, OpExcluir, OpPesquisar);

  TFrmGraos = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    Button4: TButton;
    TabSheet2: TTabSheet;
    Button5: TButton;
    Button6: TButton;
    GroupBox3: TGroupBox;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;

    procedure Operacao(op:TOpcoes);
    procedure Gravar;


    procedure Pesquisar;
    procedure DetalharDados;

   public
    { Public declarations }
    opcao : TOpcoes;
    function Selecionar:TGraos;

  end;

var
  FrmGraos: TFrmGraos;
  ds : TDataSource;

implementation

{$R *.dfm}

uses UGraosController ;

{ TFrmGraos }

procedure TFrmGraos.Alterar;
var
  graosModel : TGraos;
  graosController : TGraosController;
  sErro:string;
begin
  graosModel := TGraos.Create;
  graosController := TGraosController.Create;

  try
    with graosModel do
    begin
      idGrao := StrToIntDef(Edit3.Text,0);
      descricao := Edit2.Text;
    end;

    if graosController.Alterar(graosModel, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('Alteração realizada!');

  finally
    freeandnil(graosModel);
    freeandnil(graosController);
  end;



end;

procedure TFrmGraos.Button1Click(Sender: TObject);
begin
  Operacao(OpNovo);
end;

procedure TFrmGraos.Button2Click(Sender: TObject);
begin
  Operacao(OpAlterar);
end;

procedure TFrmGraos.Button3Click(Sender: TObject);
begin
  Operacao(OpExcluir);
end;

procedure TFrmGraos.Button4Click(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFrmGraos.Button5Click(Sender: TObject);
begin
  Gravar;
end;

procedure TFrmGraos.Button6Click(Sender: TObject);
begin
  Operacao(OpPesquisar);
end;

procedure TFrmGraos.DBGrid1DblClick(Sender: TObject);
begin
  Selecionar;
  Close;
end;

procedure TFrmGraos.DetalharDados;
begin
  Edit3.Text := DMGraos.CDSPesquisarIDGRAO.AsString;
  Edit2.Text := DMGraos.CDSPesquisarDESCRICAO.AsString;

end;

procedure TFrmGraos.Edit1Change(Sender: TObject);
begin
  Pesquisar;
end;

procedure TFrmGraos.Edit2Exit(Sender: TObject);
begin
  Button5.SetFocus;
end;

procedure TFrmGraos.Excluir;
var
  graosC : TGraosController;
  sErro:string;
begin

  try
    if (DMGraos.CDSPesquisar.Active) and (DMGraos.CDSPesquisar.RecordCount > 0) then
       begin
         if MessageDlg('Deseja excluir?', TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = idyes then
            begin
             if graosC.Excluir(DMGraos.CDSPesquisarIDGrao.AsInteger, serro) = false then
                raise Exception.Create(serro);
            end;

       end
       else
       raise Exception.Create('Não tem registro para ser excluido');

  finally
  end;

end;

procedure TFrmGraos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ds);
end;

procedure TFrmGraos.FormShow(Sender: TObject);
begin
  ds := TDataSource.Create(nil);
  Operacao(OpPesquisar);
end;

procedure TFrmGraos.Gravar;
begin
  case opcao of
        OpNovo: begin
          Inserir;
        end;

        OpAlterar:begin
          Alterar;
        end ;

        OpExcluir:begin
          Excluir;
        end ;
  end;

  Operacao(OpPesquisar);
end;

procedure TFrmGraos.Inserir;
var
  graosModel : TGraos;
  graosController : TGraosController;
  sErro:string;
begin
  graosModel := TGraos.Create;
  graosController := TGraosController.Create;

  try
    with graosModel do
    begin
      descricao := Edit2.Text;
    end;

    if graosController.Inserir(graosModel, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('Novo grão gravado!');

  finally
    freeandnil(graosModel);
    freeandnil(graosController);
  end;

end;

procedure TFrmGraos.Operacao(op: TOpcoes);
begin
  case op of
      OpNovo: begin
        opcao := OpNovo;
        PageControl1.ActivePageIndex:=1;
        Edit2.Clear;
        Edit3.Clear;
        TabSheet2.TabVisible := true;
        TabSheet1.TabVisible := false;
        Edit2.SetFocus;
      end;

      OpAlterar:begin
        opcao := OpAlterar;
        DetalharDados;
        PageControl1.ActivePageIndex:=1;
        TabSheet2.TabVisible := true;
        TabSheet1.TabVisible := false;
        Edit2.SetFocus;
      end ;

      OpExcluir:begin
        Excluir;
        Pesquisar;
      end ;

      OpPesquisar:begin
        opcao := OpPesquisar;
        PageControl1.ActivePageIndex:=0;
        TabSheet2.TabVisible := false;
        TabSheet1.TabVisible := true;
        Edit1.Clear;
        RadioButton1.Checked := true;
        Pesquisar;
      end ;

      else begin

      end;
  end;


end;

procedure TFrmGraos.Pesquisar;
var
   p : TGraosController;
begin
  p := TGraosController.Create;

  p.Pesquisar(Edit1.Text);
  ds.DataSet := DMGraos.CDSPesquisar;
  DBGrid1.DataSource := ds;
  DBGrid1.DataSource.Enabled :=true;
  DBGrid1.Refresh;

end;

function TFrmGraos.Selecionar: TGraos;
var
  grao : TGraos;
begin
  grao := TGraos.Create;
  with grao do
  begin
    idGrao := DMGraos.CDSPesquisarIDGRAO.AsInteger;
    descricao := DMGraos.CDSPesquisarDESCRICAO.AsString;
  end;

  result := grao;
end;

end.
