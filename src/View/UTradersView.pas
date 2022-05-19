unit UTradersView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, UDMTraders, UTradersModel, Vcl.ExtCtrls, Vcl.Mask ;

type
  TOpcoes = (OpNovoTrade, OpAlterarTrade, OpExcluirTrade, OpPesquisar,
             OpNovoSilo, OpAlterarSilo, OpExcluirSilo);

  TFrmTraders = class(TForm)
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
    DBGrid1: TDBGrid;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    Button7: TButton;
    Button9: TButton;
    TabSheet2: TTabSheet;
    Button5: TButton;
    Button6: TButton;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    TabSheet3: TTabSheet;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button10: TButton;
    Button11: TButton;
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button11Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    //TRADE
    procedure InserirTrade;
    procedure AlterarTrade;
    procedure ExcluirTrade;

    //SILOS
    procedure InserirSilo;
    procedure AlterarSilo;
    procedure ExcluirSilo;


    procedure Operacao(op:TOpcoes);
    procedure Gravar;

    procedure PesquisarTraders;
    procedure PesquisarSilos;

    procedure DetalharDadosTrade;
    procedure DetalharDadosSilo;

  public
    { Public declarations }
     opcao : TOpcoes;
     function Selecionar:TTraders;


  end;

var
  FrmTraders: TFrmTraders;

implementation

{$R *.dfm}

uses UTradersController,  USilosController, UDMSilos,
  USilosModel;

{ TFrmTraders }

procedure TFrmTraders.AlterarSilo;
var
  siloModel : TSilos;
  silosController : TSilosController;
  sErro:string;
begin
  siloModel := TSilos.Create;
  silosController := TSilosController.Create;

  try
    with siloModel do
    begin
      idTrade := StrToIntDef(Edit4.Text,0);//caso nao conseguir converter passa 0
      idSilo := StrToIntDef(Edit5.Text,0);
      capacidade := strtofloat(Edit6.Text);
    end;

    if silosController.Alterar(siloModel, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('Alteração realizada!');

  finally
    freeandnil(siloModel);
    freeandnil(silosController);
  end;


end;

procedure TFrmTraders.AlterarTrade;
var
  tradeModel : TTraders;
  tradersController : TTradersController;
  sErro:string;
begin
  tradeModel := TTraders.Create;
  tradersController := TTradersController.Create;

  try
    with tradeModel do
    begin
      idTrade := StrToIntDef(Edit2.Text,0);//caso nao conseguir converter passa 0
      nome := Edit3.Text;
    end;

    if tradersController.Alterar(tradeModel, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('Alteração realizada!');

  finally
    freeandnil(tradeModel);
    freeandnil(tradersController);
  end;



end;

procedure TFrmTraders.Button10Click(Sender: TObject);
begin
  Gravar;
end;

procedure TFrmTraders.Button11Click(Sender: TObject);
begin
  Operacao(OpPesquisar);
end;

procedure TFrmTraders.Button1Click(Sender: TObject);
begin
  Operacao(OpNovoTrade);
end;

procedure TFrmTraders.Button2Click(Sender: TObject);
begin
    Operacao(OpAlterarTrade);
end;

procedure TFrmTraders.Button3Click(Sender: TObject);
begin
  Operacao(OpExcluirTrade);
end;

procedure TFrmTraders.Button4Click(Sender: TObject);
begin
  PesquisarTraders;
end;

procedure TFrmTraders.Button5Click(Sender: TObject);
begin
  Gravar;
end;

procedure TFrmTraders.Button6Click(Sender: TObject);
begin
  Operacao(OpPesquisar);
end;

procedure TFrmTraders.Button7Click(Sender: TObject);
begin
  Operacao(OpNovoSilo);
end;

procedure TFrmTraders.Button8Click(Sender: TObject);
begin
  Operacao(OpAlterarSilo);
end;

procedure TFrmTraders.Button9Click(Sender: TObject);
begin
  Operacao(OpExcluirSilo);
end;

procedure TFrmTraders.DBGrid1CellClick(Column: TColumn);
begin
  PesquisarSilos;
end;

procedure TFrmTraders.DBGrid1DblClick(Sender: TObject);
begin
  Selecionar;
  Close;
end;

procedure TFrmTraders.DetalharDadosSilo;
begin
  Edit4.Text := DMSilos.CDSPesquisarIDTRADE.AsString;
  Edit5.Text := DMSilos.CDSPesquisarIDSILO.AsString;
  Edit6.Text := FormatFloat('#0.00',DMSilos.CDSPesquisarCAPACIDADE.AsFloat);
end;

procedure TFrmTraders.DetalharDadosTrade;
begin
 Edit2.Text := DMTraders.CDSPesquisarIDTrade.AsString;
 Edit3.Text := DMTraders.CDSPesquisarNome.AsString;
end;

procedure TFrmTraders.Edit1Change(Sender: TObject);
begin
  PesquisarTraders;
end;

procedure TFrmTraders.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;
end;

procedure TFrmTraders.ExcluirSilo;
var
  silosC : TSilosController;
  sErro:string;
begin

  try
    if (DMSilos.CDSPesquisar.Active) and (DMSilos.CDSPesquisar.RecordCount > 0) then
       begin
         if MessageDlg('Deseja excluir?', TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = idyes then
            begin
             if silosC.Excluir(DMSilos.CDSPesquisarIDSILO.AsInteger, DMSilos.CDSPesquisarIDTrade.AsInteger,serro) = false then
                raise Exception.Create(serro);

            end;

       end
       else
       raise Exception.Create('Não tem registro para ser excluido');

  finally

  end;


end;

procedure TFrmTraders.ExcluirTrade;
var
  tradersC : TTradersController;
  sErro:string;
begin
  try
    if (DMTraders.CDSPesquisar.Active) and (DMTraders.CDSPesquisar.RecordCount > 0) then
       begin
         if MessageDlg('Deseja excluir?', TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = idyes then
            begin
             if tradersC.Excluir(DMTraders.CDSPesquisarIDTrade.AsInteger, serro) = false then
                raise Exception.Create(serro);

            end;

       end
       else
       raise Exception.Create('Não tem registro para ser excluido');

  finally

  end;



end;

procedure TFrmTraders.FormShow(Sender: TObject);
begin
  Operacao(OpPesquisar);
end;

procedure TFrmTraders.Gravar;
begin
  case opcao of
        OpNovoTrade: begin
          InserirTrade;
        end;

        OpAlterarTrade:begin
          AlterarTrade;
        end ;

        OpExcluirTrade:begin
          ExcluirTrade;
        end ;

        OpNovoSilo:begin
          InserirSilo;
        end;

        OpAlterarSilo:begin
          AlterarSilo;
        end;

  end;

  Operacao(OpPesquisar);
end;

procedure TFrmTraders.InserirSilo;
var
  silosModel : TSilos;
  silosController : TSilosController;
  sErro:string;
begin
  silosModel := TSilos.Create;
  silosController := TSilosController.Create;

  try
    with silosModel do
    begin
       idtrade := DMTraders.CDSPesquisarIDTRADE.AsInteger;
       idSilo := 0;
       capacidade := strtofloat(edit6.Text);
    end;

    if silosController.Inserir(silosModel, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('Novo silo gravado!');

  finally
    freeandnil(silosModel);
    freeandnil(silosController);
  end;
end;

procedure TFrmTraders.InserirTrade;
var
  traderModel : TTraders;
  tradersController : TTradersController;
  sErro:string;
begin
  traderModel := TTraders.Create;
  tradersController := TTradersController.Create;

  try
    with traderModel do
    begin
      nome := Edit3.Text;
    end;

    if tradersController.Inserir(traderModel, serro) = false then
        raise Exception.Create(sErro)
    else
      showmessage('Novo trader gravado!');

  finally
    freeandnil(traderModel);
    freeandnil(tradersController);
  end;


end;

procedure TFrmTraders.Operacao(op: TOpcoes);
begin
  case op of
      OpNovoTrade: begin
        opcao := OpNovoTrade;
        PageControl1.ActivePageIndex:=1;
        Edit2.Clear;
        Edit3.Clear;
        TabSheet1.TabVisible := false;
        TabSheet2.TabVisible := true;
        TabSheet3.TabVisible := true;
        Edit3.SetFocus;
      end;

      OpAlterarTrade:begin
        opcao := OpAlterarTrade;
        DetalharDadosTrade;
        PageControl1.ActivePageIndex:=1;
        TabSheet1.TabVisible := false;
        TabSheet2.TabVisible := true;
        TabSheet3.TabVisible := false;
        Edit3.SetFocus;
      end ;

      OpExcluirTrade:begin
        ExcluirTrade;
        PesquisarTraders;
      end ;

      OpPesquisar:begin
        opcao := OpPesquisar;
        PageControl1.ActivePageIndex:=0;
        TabSheet1.TabVisible := true;
        TabSheet2.TabVisible := false;
        TabSheet3.TabVisible := false;
        Edit1.Clear;
        RadioButton1.Checked := true;
        PesquisarTraders;
      end ;

      OpNovoSilo:begin
        opcao := OpNovoSilo;
        PageControl1.ActivePageIndex:=2;
        TabSheet1.TabVisible := false;
        TabSheet2.TabVisible := false;
        TabSheet3.TabVisible := true;
        Edit4.Text := DMTraders.CDSPesquisarIDTRADE.AsString;
        Edit6.SetFocus;
        Edit6.Text := '0,00';
      end;


      OpAlterarSilo:begin
        opcao := OpAlterarSilo;
        PageControl1.ActivePageIndex:=2;
        TabSheet1.TabVisible := false;
        TabSheet2.TabVisible := false;
        TabSheet3.TabVisible := true;
        DetalharDadosSilo;
      end;

      OpExcluirSilo:begin
        ExcluirSilo;
        PesquisarSilos;

      end;


      else begin

      end;
  end;

end;


procedure TFrmTraders.PesquisarSilos;
var
   p : TSilosController;
   ds : TDataSource;

begin
  p := TSilosController.Create;

  try
    p.Pesquisar(DMTraders.CDSPesquisarIDTRADE.AsInteger);
    Ds := TDataSource.Create(self);
    ds.DataSet := DMSilos.CDSPesquisar;
    DBGrid2.DataSource := ds;
    DBGrid2.DataSource.Enabled :=true;
    DBGrid2.Refresh;
  finally
  end;

end;

procedure TFrmTraders.PesquisarTraders;
var
   p : TTradersController;
   ds : TDataSource;

begin
  p := TTradersController.Create;

  try
    p.Pesquisar(Edit1.Text);
    Ds := TDataSource.Create(self);
    ds.DataSet := DMTraders.CDSPesquisar;
    DBGrid1.DataSource := ds;
    DBGrid1.DataSource.Enabled :=true;
    DBGrid1.Refresh;
  finally

  end;

  PesquisarSilos;
end;

function TFrmTraders.Selecionar: TTraders;
var
  trade : TTraders;
begin
  trade := TTraders.Create;
  with trade do
  begin
    idTrade := DMTraders.CDSPesquisarIDTrade.AsInteger;
  end;

  result := trade;
end;

end.
