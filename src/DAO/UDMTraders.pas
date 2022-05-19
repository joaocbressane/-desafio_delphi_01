unit UDMTraders;

interface

uses
  System.SysUtils, System.Classes, UDMConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UTradersModel,
  Datasnap.DBClient, Datasnap.Provider;

type
  TDMTraders = class(TDataModule)
    FDQInserir: TFDQuery;
    FDQAlterar: TFDQuery;
    FDQExcluir: TFDQuery;
    FDQPesquisar: TFDQuery;
    FDQPesquisarIDTRADE: TIntegerField;
    FDQPesquisarNOME: TStringField;
    DSPPesquisar: TDataSetProvider;
    CDSPesquisar: TClientDataSet;
    CDSPesquisarIDTRADE: TIntegerField;
    CDSPesquisarNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  function GerarID : Integer;
  function Inserir(trader:TTraders; out sErro:string):boolean;
  function Alterar(trader:TTraders; out sErro:string):boolean;
  function Excluir(IdTrader:Integer; out sErro:string):boolean;

  procedure Pesquisar(pNome:string);

  end;

var
  DMTraders: TDMTraders;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMTraders }

function TDMTraders.Alterar(trader: TTraders; out sErro: string): boolean;
begin
 with FDQAlterar, trader do
  begin
    ParamByName('idtrade').AsInteger := idtrade;
    ParamByName('nome').AsString := nome;

    try
      ExecSQL;
      Result := true;
    except on E : Exception do
      begin
        sErro := 'Ocorreu um erro ao alterar Trade: '+sLineBreak + E.Message;
        result := false;
      end;
    end;


  end;
end;

function TDMTraders.Excluir(IdTrader: Integer; out sErro: string): boolean;
begin
 with FDQExcluir do
    begin
      ParamByName('idtrade').AsInteger := Idtrader ;
      try
        ExecSQL;
        Result := true;
      except on E : Exception do
        begin
          sErro := 'Ocorreu um erro ao excluir trader: '+sLineBreak + E.Message;
          result := false;
        end;
      end;


    end;
end;

function TDMTraders.GerarID: Integer;
var
  sqlAux :  TFDQuery;
begin
  sqlAux :=  TFDQuery.Create(nil);
  try
    with sqlaux do
    begin
      Connection := DMConexao.FDConexao;
      SQL.Text := 'SELECT COALESCE(MAX(idtrade),0)+1 AS seq FROM traders; ';
      Open;
      result := FieldByName('seq').AsInteger;
    end;
  finally
    freeandnil(sqlaux);
  end;

end;

function TDMTraders.Inserir(trader: TTraders; out sErro: string): boolean;
begin
 with FDQInserir, trader do
  begin
    ParamByName('idtrade').AsInteger := GerarID;
    ParamByName('nome').AsString := nome;

    try
      ExecSQL;
      Result := true;
    except on E : Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir traders: '+sLineBreak + E.Message;
        result := false;
      end;
    end;
  end;

end;

procedure TDMTraders.Pesquisar(pNome: string);
var
  sql: string;
begin
  if CDSPesquisar.Active then
    CDSPesquisar.Close;

  FDQPesquisar.SQL.Clear;
  sql := 'SELECT * FROM traders WHERE nome LIKE '+QuotedStr('%'+pnome+'%');
  FDQPesquisar.SQL.Add(sql);
  FDQPesquisar.Active :=true;
  FDQPesquisar.Open;
  CDSPesquisar.Open;
  CDSPesquisar.First;
end;

end.
