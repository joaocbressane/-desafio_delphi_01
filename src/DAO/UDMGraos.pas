unit UDMGraos;

interface

uses
  System.SysUtils, System.Classes, UDMConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UGraosModel,
  Datasnap.Provider, Datasnap.DBClient;

type
  TDMGraos = class(TDataModule)
    FDQInserir: TFDQuery;
    FDQAlterar: TFDQuery;
    FDQExcluir: TFDQuery;
    FDQPesquisar: TFDQuery;
    DSTPesquisar: TDataSetProvider;
    CDSPesquisar: TClientDataSet;
    FDQPesquisarIDGRAO: TIntegerField;
    FDQPesquisarDESCRICAO: TStringField;
    CDSPesquisarIDGRAO: TIntegerField;
    CDSPesquisarDESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  function GerarID : Integer;
  function Inserir(grao:TGraos; out sErro:string):boolean;
  function Alterar(grao:TGraos; out sErro:string):boolean;
  function Excluir(IdGrao:Integer; out sErro:string):boolean;

  procedure Pesquisar(pDescricao:string);


  end;

var
  DMGraos: TDMGraos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TDMGraos.Alterar(grao: TGraos; out sErro: string): boolean;
begin
 with FDQAlterar, grao do
  begin
    ParamByName('idgrao').AsInteger := idGrao;
    ParamByName('descricao').AsString := descricao;

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

function TDMGraos.Excluir(IdGrao: Integer; out sErro: string): boolean;
begin
  with FDQExcluir do
    begin
      ParamByName('IDGRAO').AsInteger := IdGrao ;
      try
        ExecSQL;
        Result := true;
      except on E : Exception do
        begin
          sErro := 'Ocorreu um erro ao excluir grao: '+sLineBreak + E.Message;
          result := false;
        end;
      end;


    end;
end;

function TDMGraos.GerarID: Integer;
var
  sqlAux :  TFDQuery;
begin
  sqlAux :=  TFDQuery.Create(nil);
  try
    with sqlaux do
    begin
      Connection := DMConexao.FDConexao;
      SQL.Text := 'SELECT COALESCE(MAX(idgrao),0)+1 as seq from graos; ';
      Open;
      result := FieldByName('seq').AsInteger;
    end;
  finally
    freeandnil(sqlaux);
  end;


end;

function TDMGraos.Inserir(grao: TGraos; out sErro: string): boolean;
begin
  with FDQInserir, grao do
  begin
    ParamByName('idgrao').AsInteger := GerarID;
    ParamByName('descricao').AsString := descricao;

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

procedure TDMGraos.Pesquisar(pDescricao: string);
var
  sql: string;
begin
  if CDSPesquisar.Active then
    CDSPesquisar.Close;

  FDQPesquisar.SQL.Clear;
  sql := 'SELECT * FROM graos WHERE descricao LIKE '+QuotedStr('%'+pDescricao+'%');
  FDQPesquisar.SQL.Add(sql);
  FDQPesquisar.Active := true;
  FDQPesquisar.Open;
  CDSPesquisar.Open;
  CDSPesquisar.First;

end;

end.

