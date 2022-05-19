unit UDMContratos;

interface

uses
  System.SysUtils, System.Classes, UDMConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UContratosModel,
  Datasnap.DBClient, Datasnap.Provider;

type
  TDMContratos = class(TDataModule)
    FDQInserir: TFDQuery;
    FDQAlterar: TFDQuery;
    FDQExcluir: TFDQuery;
    FDQPesquisar: TFDQuery;
    DSPPesquisar: TDataSetProvider;
    CDSPesquisar: TClientDataSet;
    FDQPesquisarIDCONTRATO: TIntegerField;
    FDQPesquisarIDPRODUTOR: TIntegerField;
    FDQPesquisarNOME: TStringField;
    FDQPesquisarIDGRAO: TIntegerField;
    FDQPesquisarGRAO: TStringField;
    FDQPesquisarIDTRADE: TIntegerField;
    CDSPesquisarIDCONTRATO: TIntegerField;
    CDSPesquisarIDPRODUTOR: TIntegerField;
    CDSPesquisarNOME: TStringField;
    CDSPesquisarIDGRAO: TIntegerField;
    CDSPesquisarGRAO: TStringField;
    CDSPesquisarIDTRADE: TIntegerField;
    FDQPesquisarQUANTIDADE: TIntegerField;
    CDSPesquisarQUANTIDADE: TIntegerField;
    FDQPesquisarNOMETRADE: TStringField;
    CDSPesquisarNOMETRADE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
     function GerarID : Integer;
     function Inserir(contrato:TContratos; out sErro:string):boolean;
     function Alterar(contrato:TContratos; out sErro:string):boolean;
     function Excluir(IdContrato:Integer; out sErro:string):boolean;



     procedure pesquisar(CNPJ, nomeTrade:String);

  end;

var
  DMContratos: TDMContratos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMContratos }

function TDMContratos.Alterar(contrato: TContratos; out sErro: string): boolean;
begin
 with FDQAlterar, contrato do
  begin
    ParamByName('idContrato').AsInteger := idContrato;
    ParamByName('idprodutor').AsInteger := idProdutor;
    ParamByName('idgrao').AsInteger := idGrao;
    ParamByName('idtrade').AsInteger := idTrade;
    ParamByName('quantidade').AsFloat := Quantidade;

    try
      ExecSQL;
      Result := true;
    except on E : Exception do
      begin
        sErro := 'Ocorreu um erro ao alterar contrato: '+sLineBreak + E.Message;
        result := false;
      end;
    end;

  end;
end;

function TDMContratos.Excluir(IdContrato: Integer; out sErro: string): boolean;
begin
  with FDQExcluir do
    begin
      ParamByName('idcontrato').AsInteger := IdContrato;
      try
        ExecSQL;
        Result := true;
      except on E : Exception do
        begin
          sErro := 'Ocorreu um erro ao excluir contrato: '+sLineBreak + E.Message;
          result := false;
        end;
      end;

    end;
end;

function TDMContratos.GerarID: Integer;
var
  sqlAux :  TFDQuery;
begin
  sqlAux :=  TFDQuery.Create(nil);
  try
    with sqlaux do
    begin
      Connection := DMConexao.FDConexao;
      SQL.Text := 'SELECT COALESCE(MAX(idcontrato),0)+1 as seq from contratos; ';
      Open;
      result := FieldByName('seq').AsInteger;
    end;
  finally
    freeandnil(sqlaux);
  end;


end;

function TDMContratos.Inserir(contrato: TContratos; out sErro: string): boolean;
begin
  with FDQInserir, contrato do
  begin
    ParamByName('pidcontrato').AsInteger := idContrato;
    ParamByName('pidprodutor').AsInteger := idProdutor;
    ParamByName('pidgrao').AsInteger := idGrao;
    ParamByName('pidtrade').AsInteger :=  idTrade;
    ParamByName('pquantidade').AsFloat := Quantidade;

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

procedure TDMContratos.pesquisar(CNPJ, nomeTrade:String);
var
  sql: string;
begin
  if CDSPesquisar.Active then
    CDSPesquisar.Close;


  FDQPesquisar.SQL.Clear;
    sql := 'SELECT c.idcontrato, p.idprodutor, p.nome, '+
           'g.idgrao, g.descricao as grao, t.idtrade, t.nome nometrade, '+
           'c.quantidade '+
           'FROM contratos c '+
           'INNER JOIN produtores p on p.idprodutor = c.idprodutor '+
           'INNER JOIN graos g on g.idgrao = c.idgrao '+
           'INNER JOIN traders t on t.idtrade = c.idtrade ';

           if not cnpj.IsEmpty then
              sql := sql + 'WHERE  p.cnpj like ''%'+CNPJ+ '%'' '
           else
              sql := sql + 'WHERE  t.nome like ''%'+nomeTrade+ '%''';
     sql := sql + 'ORDER BY c.idcontrato;';

  FDQPesquisar.SQL.Add(sql);
  FDQPesquisar.Open;
  CDSPesquisar.Open;
  CDSPesquisar.First;
end;



end.
