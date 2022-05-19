unit UDMSilos;

interface

uses
  System.SysUtils, System.Classes, UDMConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, USilosModel,
  Datasnap.DBClient, Datasnap.Provider;

type
  TDMSilos = class(TDataModule)
    FDQInserir: TFDQuery;
    FDQAlterar: TFDQuery;
    FDQExcluir: TFDQuery;
    FDQPesquisar: TFDQuery;
    FDQPesquisarIDSILO: TIntegerField;
    FDQPesquisarIDTRADE: TIntegerField;
    FDQPesquisarCAPACIDADE: TIntegerField;
    DSPPesquisar: TDataSetProvider;
    CDSPesquisar: TClientDataSet;
    CDSPesquisarIDSILO: TIntegerField;
    CDSPesquisarIDTRADE: TIntegerField;
    CDSPesquisarCAPACIDADE: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID(idTrade:Integer): Integer;
    function Inserir(silo:TSilos; out sErro:string):boolean;
    function Alterar(silo:TSilos; out sErro:string):boolean;
    function Excluir(IdSilo, idTrade:Integer; out sErro:string):boolean;

   procedure Pesquisar(pIDTrade:integer);


  end;

var
  DMSilos: TDMSilos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMSilos }

function TDMSilos.Alterar(silo: TSilos; out sErro: string): boolean;
begin
 with FDQAlterar, silo do
  begin
    ParamByName('pidSilo').AsInteger := idSilo;
    ParamByName('pidTrade').AsInteger := idtrade;
    ParamByName('pcapacidade').AsFloat := capacidade;

    try
      ExecSQL;
      Result := true;
    except on E : Exception do
      begin
        sErro := 'Ocorreu um erro ao alterar grao: '+sLineBreak + E.Message;
        result := false;
      end;
    end;


  end;
end;

function TDMSilos.Excluir(IdSilo, idTrade: Integer; out sErro: string): boolean;
begin
 with FDQExcluir do
    begin
      ParamByName('pidtrade').AsInteger := idTrade;
      ParamByName('pidsilo').AsInteger := IdSilo;
      try
        ExecSQL;
        Result := true;
      except on E : Exception do
        begin
          sErro := 'Ocorreu um erro ao excluir silo: '+sLineBreak + E.Message;
          result := false;
        end;
      end;


    end;
end;

function TDMSilos.GerarID(idTrade:Integer): Integer;
var
  sqlAux :  TFDQuery;
begin
  sqlAux :=  TFDQuery.Create(nil);
  try
    with sqlaux do
    begin
      Connection := DMConexao.FDConexao;
      SQL.Text := 'SELECT COALESCE(MAX(idsilo),0)+1 as seq'
                 +' from silos WHERE idtrade = '+inttostr(idTrade)+'; ';
      Open;
      result := FieldByName('seq').AsInteger;
    end;
  finally
    freeandnil(sqlaux);
  end;


end;

function TDMSilos.Inserir(silo: TSilos; out sErro: string): boolean;
begin
  with FDQInserir, silo do
  begin
    ParamByName('pidsilo').AsInteger := GerarID(idtrade);
    ParamByName('pidtrade').AsInteger := idtrade;
    ParamByName('pcapacidade').AsFloat := capacidade;

    try
      ExecSQL;
      Result := true;
    except on E : Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir grao: '+sLineBreak + E.Message;
        result := false;
      end;
    end;
  end;
end;

procedure TDMSilos.Pesquisar(pIDTrade: integer);
var
  sql: string;
begin
  if CDSPesquisar.Active then
    CDSPesquisar.Close;

  FDQPesquisar.SQL.Clear;
  sql := 'SELECT * FROM silos WHERE idtrade = '+inttostr(pIDTrade)+' ;';
  FDQPesquisar.SQL.Add(sql);
  FDQPesquisar.Active :=true;
  FDQPesquisar.Open;
  CDSPesquisar.Active := true;
  CDSPesquisar.Open;
  CDSPesquisar.First;

end;

end.
