unit UContratosView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons ;

type
  TOpcoes = (OpNovo, OpAlterar, OpExcluir, OpPesquisar);

  TFrmContratos = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button3: TButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Edit1: TEdit;
    Button4: TButton;
    DBGrid1: TDBGrid;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button5: TButton;
    Button6: TButton;
    Edit7: TEdit;
    Edit8: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }

    procedure Inserir;
    procedure Alterar;
    procedure Excluir;

    procedure pesquisar;

    procedure Operacao(op:TOpcoes);
    procedure Gravar;

    procedure DetalharDados;

  public
    { Public declarations }
    opcao : TOpcoes;
  end;

var
  FrmContratos: TFrmContratos;

implementation

{$R *.dfm}

uses UProdutoresView, UGraosView, UTradersView, UContratosModel,   UContratosController,
  UDMContratos , UDMArmazenamento, UArmazenamentoController;

procedure TFrmContratos.Alterar;
var
  contratoModel : TContratos;
  contratosController : TContratosController;
  sErro:string;
begin
  contratoModel := TContratos.Create;
  contratosController := TContratosController.Create;

  try
    with contratoModel do
    begin
      idContrato := StrToInt(Edit2.Text);
      idProdutor := StrToInt(Edit3.Text);
      idGrao := StrToInt(Edit4.Text);
      idTrade := StrToInt(Edit5.Text);
      Quantidade := StrToFloat(Edit6.Text);

    end;

    if contratosController.Alterar(contratoModel, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('Alteração realizada!');

  finally
    freeandnil(contratoModel);
    freeandnil(contratosController);
  end;


end;

procedure TFrmContratos.Button1Click(Sender: TObject);
begin
  Operacao(OpNovo);
end;

procedure TFrmContratos.Button2Click(Sender: TObject);
begin
  Operacao(OpAlterar);
end;

procedure TFrmContratos.Button3Click(Sender: TObject);
begin
  Operacao(OpExcluir);
end;

procedure TFrmContratos.Button4Click(Sender: TObject);
begin
  pesquisar;
end;

procedure TFrmContratos.Button5Click(Sender: TObject);
begin
  Gravar;
end;

procedure TFrmContratos.Button6Click(Sender: TObject);
begin
  Operacao(OpPesquisar);
end;

procedure TFrmContratos.DetalharDados;
begin
  Edit2.Text := DMContratos.CDSPesquisarIDContrato.AsString;
  Edit3.Text := DMContratos.CDSPesquisarIDProdutor.AsString;
  Edit4.Text := DMContratos.CDSPesquisarIDGrao.AsString;
  Edit5.Text := DMContratos.CDSPesquisarIDTrade.AsString;
  Edit6.Text := FormatFloat('#0.00',DMContratos.CDSPesquisarQuantidade.AsFloat);
  Edit7.Text := DMContratos.CDSPesquisarNome.AsString;
  Edit8.Text := DMContratos.CDSPesquisarGrao.AsString;


end;

procedure TFrmContratos.Edit1Change(Sender: TObject);
begin
  pesquisar;
end;

procedure TFrmContratos.Edit6Exit(Sender: TObject);
begin
  Edit6.Text := FormatFloat('#0.00',StrToFloat(Edit6.Text));
  Button5.SetFocus;
end;

procedure TFrmContratos.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;

end;

procedure TFrmContratos.Excluir;
var
  contratosC : TContratosController;
  armazenamentoC : TArmazenamentoController;
  sErro:string;
begin
  armazenamentoC := TArmazenamentoController.Create;


  try
    if (DMContratos.CDSPesquisar.Active) and (DMContratos.CDSPesquisar.RecordCount > 0) then
       begin
         if MessageDlg('Deseja excluir?', TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = idyes then
            begin
             if armazenamentoC.Excluir(DMContratos.CDSPesquisarIDContrato.AsInteger, serro) =false then
                raise Exception.Create(serro)
             else
             begin
               if contratosC.Excluir(DMContratos.CDSPesquisarIDContrato.AsInteger, serro) = false then
                  raise Exception.Create(serro);
             end;

            end;

       end
       else
       raise Exception.Create('Não tem registro para ser excluido');

  finally

  end;



end;

procedure TFrmContratos.FormShow(Sender: TObject);
begin
  Operacao(OpPesquisar);
end;

procedure TFrmContratos.Gravar;
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

procedure TFrmContratos.Inserir;
var
  contratoModel : TContratos;
  contratosController : TContratosController;
  armazenamentoC :  TArmazenamentoController;
  sErro:string;
begin
  contratoModel := TContratos.Create;
  contratosController := TCOntratosController.Create;
  armazenamentoC :=  TArmazenamentoController.Create;

  try
    with contratoModel do
    begin
      idContrato := contratosController.GerarID;
      idProdutor := StrToInt(Edit3.Text);
      idGrao := StrToInt(Edit4.Text);
      idTrade := StrToInt(Edit5.Text);
      quantidade := StrToFloat(Edit6.Text);

    //verificar armazenamento-espaço livre nos silos
    if (armazenamentoC.VerificarCapacidadeSiloLivre(idTrade) >= quantidade) then
       begin
        if contratosController.Inserir(contratoModel, serro) = false then
            raise Exception.Create(sErro)
        else
          begin
            armazenamentoC.Armazenar(idTrade, idContrato, quantidade);
            showmessage('Novo contrato gravado!');
          end;
       end;
    end;


  finally
    freeandnil(contratoModel);
    freeandnil(contratosController);
  end;

end;

procedure TFrmContratos.Operacao(op: TOpcoes);
begin
    case op of
      OpNovo: begin
        opcao := OpNovo;
        PageControl1.ActivePageIndex:=1;
        Edit2.Clear;
        Edit3.Clear;
        Edit4.Clear;
        Edit5.Clear;
        Edit6.Clear;
        Edit7.Clear;
        Edit8.Clear;
        TabSheet2.TabVisible := true;
        TabSheet1.TabVisible := false;
        Edit3.SetFocus;
        Edit6.Text := '0,00';
      end;

     
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
        Pesquisar;
      end ;

      else begin

      end;
  end;

end;

procedure TFrmContratos.pesquisar;
var
   t : TContratosController;
   ds : TDataSource;

begin

  t := TContratosController.Create;

  try

    if RadioButton2.Checked then
        t.Pesquisar(Edit1.Text,'')
    else
        t.Pesquisar('', Edit1.Text);

    Ds := TDataSource.Create(self);
    ds.DataSet := DMContratos.CDSPesquisar;
    DBGrid1.DataSource := ds;
    DBGrid1.DataSource.Enabled :=true;
    DBGrid1.Refresh;

  finally
  end;

end;

procedure TFrmContratos.SpeedButton1Click(Sender: TObject);
begin
   try
     FrmProdutores := tfrmprodutores.create(nil);
     FrmProdutores.opcao := UProdutoresView.opnovo;

     FrmProdutores.ShowModal;
     Edit3.Text := inttostr(FrmProdutores.selecionar.idProdutor);
     Edit7.Text := FrmProdutores.selecionar.nome;

   finally
     FreeAndNil(FrmProdutores);
   end;

end;

procedure TFrmContratos.SpeedButton2Click(Sender: TObject);
begin
 try
     FrmGraos := tfrmgraos.create(nil);
     FrmGraos.opcao := UGraosView.opnovo;

     FrmGraos.ShowModal;
     Edit4.Text := inttostr(FrmGraos.selecionar.idGrao);
     Edit8.Text := FrmGraos.selecionar.descricao;

   finally
     FreeAndNil(FrmGraos);
   end;
end;

procedure TFrmContratos.SpeedButton3Click(Sender: TObject);
begin
 try
     FrmTraders := TFrmTraders.create(nil);
     FrmTraders.opcao := UTradersView.opnovoTrade;
     FrmTraders.ShowModal;
     Edit5.Text := inttostr(FrmTraders.selecionar.idTrade);

   finally
     FreeAndNil(FrmGraos);
   end;

end;

end.
