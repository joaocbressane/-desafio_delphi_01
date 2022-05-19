unit UDMProdutores;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UDMConexao, Datasnap.Provider,
  Datasnap.DBClient, UProdutoresModel, Vcl.Dialogs;

type
  TDMProdutores = class(TDataModule)
    FDQInserir: TFDQuery;
    FDQAlterar: TFDQuery;
    FDQExcluir: TFDQuery;
    FDQPesquisar: TFDQuery;
    DSPPesquisar: TDataSetProvider;
    CDSPesquisar: TClientDataSet;
    CDSPesquisarIDPRODUTOR: TIntegerField;
    CDSPesquisarNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarID : Integer;
    procedure Pesquisar(sNome:string);
    procedure CarregarProdutor(produtor:TProdutores; pProdutor:integer);

    function Inserir(produtor:TProdutores; out sErro:string): boolean;
    function Alterar(produtor:TProdutores; out sErro:string): boolean;
    function Excluir (pIDProdutor:Integer; out sErro:string): boolean;

    procedure ativarQry;
    procedure desativarQry;

  end;

var
  DMProdutores: TDMProdutores;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMProdutores }


function TDMProdutores.Alterar(produtor: TProdutores;
  out sErro: string): boolean;
begin
 with FDQAlterar, produtor do
  begin
    ParamByName('idprodutor').AsInteger := idProdutor;
    ParamByName('nome').AsString := nome;
    ParamByName('cnpj').AsString := cnpj;

    try
      ExecSQL;
      Result := true;
    except on E : Exception do
      begin
        sErro := 'Ocorreu um erro ao alterar produtor: '+sLineBreak + E.Message;
        result := false;
      end;
    end;


  end;
end;

procedure TDMProdutores.ativarQry;
begin


end;

procedure TDMProdutores.CarregarProdutor(produtor: TProdutores;
  pProdutor: integer);
var
  sqlAux :  TFDQuery;
begin
  sqlAux :=  TFDQuery.Create(nil);
  try
    with sqlaux do
    begin
      Connection := DMConexao.FDConexao;
      SQL.Text := 'SELECT idprodutor, nome from produtores where (idprodutor = '+IntToStr(pProdutor)+' ); ';
      Open;

      with produtor do
      begin
        idProdutor := FieldByName('idprodutor').AsInteger;
        nome := FieldByName('nome').AsString;
      end;

    end;
  finally
    freeandnil(sqlaux);
  end;

end;

procedure TDMProdutores.desativarQry;
begin

end;

function TDMProdutores.Excluir(pIDProdutor: Integer;
  out sErro: string): boolean;
begin
 with FDQExcluir do
  begin
    ParamByName('idprodutor').AsInteger := pIDProdutor;
    try
      ExecSQL;
      Result := true;
    except on E : Exception do
      begin
        sErro := 'Ocorreu um erro ao excluir produtor: '+sLineBreak + E.Message;
        result := false;
      end;
    end;


  end;
end;


function TDMProdutores.GerarID: Integer;
var
  sqlAux :  TFDQuery;
begin
  sqlAux :=  TFDQuery.Create(nil);
  try
    with sqlaux do
    begin
      Connection := DMConexao.FDConexao;
      SQL.Text := 'SELECT COALESCE(MAX(idprodutor),0)+1 as seq from produtores; ';
      Open;
      result := FieldByName('seq').AsInteger;
    end;
  finally
    freeandnil(sqlaux);
  end;


end;

function TDMProdutores.Inserir(produtor: TProdutores;
  out sErro: string): boolean;
begin
  with FDQInserir, produtor do
  begin
    ParamByName('idprodutor').AsInteger := GerarID;
    ParamByName('nome').AsString := nome;
    ParamByName('cnpj').AsString := cnpj;

    try
      ExecSQL;
      Result := true;
    except on E : Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir produtor: '+sLineBreak + E.Message;
        result := false;
      end;
    end;


  end;
end;

procedure TDMProdutores.Pesquisar(sNome: string);
var
  sql: string;
begin
  if CDSPesquisar.Active then
      CDSPesquisar.Close;

  FDQPesquisar.SQL.Clear;
  sql := 'SELECT * FROM PRODUTORES where nome like '+QuotedStr('%'+sNome+'%');
  FDQPesquisar.SQL.Add(sql);
  FDQPesquisar.Active :=true;
  FDQPesquisar.Open;

  CDSPesquisar.Open;
  CDSPesquisar.First;
end;

end.
