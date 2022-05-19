unit UProdutoresView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, UDMProdutores, UProdutoresModel;

type
  TOpcoes = (OpNovo, OpAlterar, OpExcluir, OpPesquisar);



  TFrmProdutores = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    Edit1: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Edit4: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure novo;
    procedure inserir;
    procedure alterar;
    procedure excluir;
    procedure pesquisar;
    procedure detalhar;
    procedure Operacao(op:TOpcoes);
    procedure CarregarCliente;
    procedure Listar;
    procedure Gravar;

  public
    { Public declarations }
     opcao : TOpcoes;
     function selecionar():TProdutores;

  end;

var
  FrmProdutores: TFrmProdutores;
      ds : TDataSource;
implementation

{$R *.dfm}

uses uProdutoresController;





{ TFrmProdutores }

procedure TFrmProdutores.alterar;
var
  produtorM : TProdutores;
  produtorC : TProdutoresController;
  sErro:string;
begin
  opcao := OpAlterar;

  produtorM := TProdutores.Create;
  produtorC := TProdutoresController.Create;

  try
    with produtorM do
    begin
      idProdutor := StrToIntDef(Edit4.Text,0);
      nome := Edit2.Text;
    end;

    if produtorC.Alterar(produtorM, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('gravou!');

  finally
    freeandnil(produtorM);
    freeandnil(produtorC);
  end;


end;

procedure TFrmProdutores.Button1Click(Sender: TObject);
begin
  Operacao(opnovo);
end;

procedure TFrmProdutores.Button2Click(Sender: TObject);
begin
 Operacao(opAlterar);
end;

procedure TFrmProdutores.Button3Click(Sender: TObject);
begin
 Operacao(opExcluir);
end;

procedure TFrmProdutores.Button4Click(Sender: TObject);
begin
   pesquisar;
   
end;

procedure TFrmProdutores.Button5Click(Sender: TObject);
begin
  Gravar;
end;

procedure TFrmProdutores.Button6Click(Sender: TObject);
begin
  Operacao(opPesquisar);
end;

procedure TFrmProdutores.Button7Click(Sender: TObject);


begin
  DMProdutores := TDMProdutores.Create(nil);
  DMProdutores.ativarQry;
end;

procedure TFrmProdutores.CarregarCliente;
var
 produtorM : TProdutores;
 produtorC : TProdutoresController;
begin
  produtorM := TProdutores.Create;
  produtorC := TProdutoresController.Create;

  try
     produtorC.CarregarProdutor(produtorM, 1);

     with produtorM do
     begin
       Edit2.Text := inttostr(idProdutor);
       Edit3.Text := nome;
     end;

  finally
    freeandnil(produtorM);
    freeandnil(produtorC);
  end;

end;



procedure TFrmProdutores.DBGrid1DblClick(Sender: TObject);
begin
  selecionar();
  close;
end;

procedure TFrmProdutores.detalhar;
begin
  opcao :=  OpAlterar;
   Edit4.Text := DMProdutores.CDSPesquisarIDPRODUTOR.AsString;
   Edit2.Text := DMProdutores.CDSPesquisarNOME.AsString;
   PageControl1.ActivePageIndex:=1;

end;

procedure TFrmProdutores.Edit1Change(Sender: TObject);
begin
  pesquisar;
end;

procedure TFrmProdutores.Edit3Exit(Sender: TObject);
begin
  Button5.SetFocus;
end;

procedure TFrmProdutores.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['1','2','3','4','5','6','7','8','9','0']) then
    key :=#0;
end;

procedure TFrmProdutores.excluir;
var
  produtorC : TProdutoresController;
  sErro:string;
begin
  opcao := OpExcluir;

  try
    if (DMProdutores.CDSPesquisar.Active) and (DMProdutores.CDSPesquisar.RecordCount > 0) then
       begin
         if MessageDlg('Deseja excluir?', TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = idyes then
            begin
             if produtorC.Excluir(DMProdutores.CDSPesquisarIDPRODUTOR.AsInteger, serro) = false then
                raise Exception.Create(serro);

            end;
       end
       else
       raise Exception.Create('Não tem registro para ser excluido');

  finally
    freeandnil(produtorC);
  end;



end;

procedure TFrmProdutores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    freeandnil(ds);
end;

procedure TFrmProdutores.FormShow(Sender: TObject);
begin
  Ds := TDataSource.Create(nil);

  Operacao(OpPesquisar);
end;

procedure TFrmProdutores.Gravar;
var
  produtorC : TProdutoresController;
begin
  produtorC := TProdutoresController.Create;

  try
    case opcao  of
      OpNovo: begin
            inserir;
            PageControl1.ActivePageIndex:=0;
      end;

      OpAlterar: begin
            alterar;
            PageControl1.ActivePageIndex:=0;
      end;

      OpExcluir: begin
           excluir;
      end;

    end;

  finally
    FreeAndNil(produtorc);
  end;

  pesquisar;
end;

procedure TFrmProdutores.inserir;
var
  produtorM : TProdutores;
  produtorC : TProdutoresController;
  sErro:string;
begin
  produtorM := TProdutores.Create;
  produtorC := TProdutoresController.Create;

  try
    with produtorM do
    begin
      nome := Edit2.Text;
      cnpj := Edit3.Text;
    end;

    if produtorC.Inserir(produtorM, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('gravou Inserir!');

  finally
    freeandnil(produtorM);
    freeandnil(produtorC);
  end;



end;

procedure TFrmProdutores.Listar;
begin
  PageControl1.ActivePageIndex:=0;
end;

procedure TFrmProdutores.novo;
begin
  opcao := OpNovo;
  PageControl1.ActivePageIndex:=1;
end;

procedure TFrmProdutores.Operacao(op: TOpcoes);
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
        Detalhar;
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

procedure TFrmProdutores.pesquisar;
var
   p : TProdutoresController;
begin
  opcao := OpPesquisar;
  p := TProdutoresController.Create;

    p.Pesquisar(Edit1.Text);
    ds.DataSet := DMProdutores.CDSPesquisar;
    DBGrid1.DataSource := ds;
    DBGrid1.DataSource.Enabled :=true;
    DBGrid1.Refresh;


end;



function TFrmProdutores.selecionar: TProdutores;
var
  produtor : TProdutores;
begin
  produtor := TProdutores.Create;
  with produtor do begin
        idProdutor := DMProdutores.CDSPesquisarIDPRODUTOR.AsInteger;
        nome := DMProdutores.CDSPesquisarNOME.AsString;
  end;

  Result := produtor;
end;

end.
