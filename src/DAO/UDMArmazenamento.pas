unit UDMArmazenamento;

interface

uses
  System.SysUtils, System.Classes, UDMConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  Datasnap.Provider, VCL.Dialogs;

type
  TDMArmazenamento = class(TDataModule)
    FDQInserir: TFDQuery;
    FDQAlterar: TFDQuery;
    FDQExcluir: TFDQuery;
    FDQSilos: TFDQuery;
    FDQtdArmazenada: TFDQuery;
    DSPQtdArmazenada: TDataSetProvider;
    CDSQtdArmazenada: TClientDataSet;
    FDQtdArmazenadaIDTRADE: TIntegerField;
    FDQtdArmazenadaIDSILO: TIntegerField;
    FDQtdArmazenadaQUANTIDADE: TLargeintField;
    CDSQtdArmazenadaIDTRADE: TIntegerField;
    CDSQtdArmazenadaIDSILO: TIntegerField;
    CDSQtdArmazenadaQUANTIDADE: TLargeintField;
    DSPSilos: TDataSetProvider;
    CDSSilos: TClientDataSet;
    FDQSilosIDSILO: TIntegerField;
    FDQSilosIDTRADE: TIntegerField;
    FDQSilosCAPACIDADE: TIntegerField;
    CDSSilosIDSILO: TIntegerField;
    CDSSilosIDTRADE: TIntegerField;
    CDSSilosCAPACIDADE: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }

    function gerarID:Integer;
    function VerificarCapacidadeSiloLivre(idTrade:Integer):double;
    function Armazenar(idTrade, idContrato:Integer; qtdContrato: Double):boolean;
    function Excluir(IdContrato:Integer; out sErro:string):boolean;


  end;

var
  DMArmazenamento: TDMArmazenamento;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

function TDMArmazenamento.Excluir(IdContrato: Integer;
  out sErro: string): boolean;
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

function TDMArmazenamento.gerarID: Integer;
var
  sqlAux :  TFDQuery;
begin
  sqlAux :=  TFDQuery.Create(nil);
  try
    with sqlaux do
    begin
      Connection := DMConexao.FDConexao;
      SQL.Text := 'SELECT COALESCE(MAX(idarmazenamento),0)+1 as seq from armazenamento; ';
      Open;
      result := FieldByName('seq').AsInteger;
    end;
  finally
    freeandnil(sqlaux);
  end;


end;

function TDMArmazenamento.Armazenar(idTrade, idContrato:Integer; qtdContrato: Double): boolean;
var
  sql: string;
  capacidade, armazenado,  qtdAux : double;
  sqlAux : TFDQuery;

begin
   if VerificarCapacidadeSiloLivre(idTrade) >= qtdcontrato then
      begin

        sqlAux := TFDQuery.Create(nil);
        sqlAux.Connection := DMConexao.FDConexao;

        if CDSQtdArmazenada.Active then
            CDSQtdArmazenada.Close;

          FDQtdArmazenada.SQL.Clear;
          sql := 'select idtrade,idsilo, sum(quantidade) quantidade '+
                 'from armazenamento '+
                 'where idtrade = '+IntToStr(idTrade)+' group by idsilo, idtrade ';

          FDQtdArmazenada.SQL.Add(sql);
          FDQtdArmazenada.Open;
          CDSQtdArmazenada.Open;
          CDSQtdArmazenada.First;
          if CDSQtdArmazenada.RecordCount = 0 then
             begin
                sql := 'select * from silos '+
                        'where idtrade = '+IntToStr(idTrade)+' ; ';

                  FDQSilos.SQL.clear;
                  FDQSilos.SQL.Add(sql);
                  FDQSilos.Open;

                  CDSSilos.Active := true;
                  CDSSilos.Open;
                  CDSSilos.First;

                  while not CDSSilos.eof do
                  begin
                    capacidade := CDSSilosCAPACIDADE.Value;
                    if capacidade <= qtdcontrato then
                    begin
                      qtdaux := capacidade;
                      sql := 'insert into armazenamento (idarmazenamento, idtrade, idsilo, idcontrato, quantidade)'+
                      'values ('+inttostr(gerarID)+','+
                      ''+IntToStr(idTrade)+','+(CDSSilosIDSILO.AsString)+','+ //trade, silo
                      ''+IntToStr(idContrato)+','+floattostr(qtdaux)+')'; //idcontrato, qtd
                       sqlAux.SQL.Clear;
                       sqlAux.SQL.Add(sql);
                       sqlAux.ExecSQL;

                      qtdcontrato := qtdcontrato - qtdaux;
                    end
                    else
                    begin
                      qtdaux :=  qtdcontrato;
                       sql := 'insert into armazenamento (idarmazenamento, idtrade, idsilo, idcontrato, quantidade)'+
                      'values ('+inttostr(gerarID)+','+
                      ''+IntToStr(idTrade)+','+(CDSSilosIDSILO.AsString)+','+
                      ''+IntToStr(idContrato)+','+floattostr(qtdaux)+')';
                       sqlAux.SQL.Clear;
                       sqlAux.SQL.Add(sql);
                       sqlAux.ExecSQL;
                       qtdcontrato := qtdcontrato - qtdaux;
                    end;

                    if qtdcontrato = 0 then
                      exit;

                    CDSSilos.next;
                  end;


             end
             else
             begin
                while not CDSQtdArmazenada.Eof do
                begin
                  sql := 'select * from silos '+
                         'where idtrade = '+CDSQtdArmazenadaIDTRADE.AsString+' '+
                         'and idsilo = '+CDSQtdArmazenadaIDsilo.AsString+' ; ';

                  FDQSilos.SQL.clear;
                  FDQSilos.SQL.Add(sql);
                  FDQSilos.Open;

                  CDSSilos.Active := true;
                  CDSSilos.Open;
                  CDSSilos.First;

                  armazenado := CDSQtdArmazenadaQUANTIDADE.Value;
                  capacidade := CDSSilosCAPACIDADE.Value;
                  qtdAux := capacidade - armazenado;

                  if qtdAux > 0 then
                  begin
                     sql := 'insert into armazenamento (idarmazenamento, idtrade, idsilo, idcontrato, quantidade)'+
                      'values ('+inttostr(gerarID)+','+
                      ''+IntToStr(idTrade)+','+(CDSQtdArmazenadaIDsilo.AsString)+','+
                      ''+IntToStr(idContrato)+','+floattostr(qtdaux)+')';
                       sqlAux.SQL.Clear;
                       sqlAux.SQL.Add(sql);
                       sqlAux.ExecSQL;
                       qtdcontrato := qtdcontrato - qtdaux;
                  end;
                  CDSQtdArmazenada.Next;
                end;

                  sql := 'select * from silos '+
                         'where idtrade = 1 and  '+
                         'idsilo not in(  '+
                         'select idsilo '+
                         'from armazenamento '+
                         'where idtrade = '+IntToStr(idTrade)+' group by idsilo, idtrade)  ';

                  FDQSilos.Close;
                  FDQSilos.SQL.clear;
                  FDQSilos.SQL.Add(sql);
                  FDQSilos.Open;

                  CDSSilos.Close;
                  CDSSilos.Active := true;
                  CDSSilos.Open;
                  CDSSilos.First;

                  while not CDSSilos.eof do
                  begin
                    capacidade := CDSSilosCAPACIDADE.Value;
                    if capacidade <= qtdcontrato then
                    begin
                      qtdaux := capacidade;
                      sql := 'insert into armazenamento (idarmazenamento, idtrade, idsilo, idcontrato, quantidade)'+
                      'values ('+inttostr(gerarID)+','+
                      ''+IntToStr(idTrade)+','+(CDSSilosIDSILO.AsString)+','+
                      ''+IntToStr(idContrato)+','+floattostr(qtdaux)+')';
                       sqlAux.SQL.Clear;
                       sqlAux.SQL.Add(sql);
                       sqlAux.ExecSQL;

                      qtdcontrato := qtdcontrato - qtdaux;
                    end
                    else
                    begin
                      qtdaux :=  qtdcontrato;
                       sql := 'insert into armazenamento (idarmazenamento, idtrade, idsilo, idcontrato, quantidade)'+
                      'values ('+inttostr(gerarID)+','+
                      ''+IntToStr(idTrade)+','+(CDSSilosIDSILO.AsString)+','+
                      ''+IntToStr(idContrato)+','+floattostr(qtdaux)+')';
                       sqlAux.SQL.Clear;
                       sqlAux.SQL.Add(sql);
                       sqlAux.ExecSQL;

                       qtdcontrato := qtdcontrato - qtdaux;

                    end;

                    if qtdcontrato = 0 then
                      exit;

                    CDSSilos.next;
                  end;

             end;
      result := true;
    end
    else
    begin
      showmessage('A quantidade do contrato é maior do que as capacidade do silos do trade');
      result := false;
    end;


end;

function TDMArmazenamento.VerificarCapacidadeSiloLivre(idTrade:Integer): double;
var
  totalArmazenado, totalCapacidade : double;
  sqlAux :  TFDQuery;
begin
  sqlAux :=  TFDQuery.Create(nil);
  try
    with sqlaux do
    begin
      Connection := DMConexao.FDConexao;
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT SUM(quantidade) as qtd FROM armazenamento WHERE idtrade = '+inttostr(idTrade)+'; ';
      Open;
      First;
      totalArmazenado := FieldByName('qtd').AsFloat;

      Close;
      SQL.Clear;
      SQL.Text := 'SELECT SUM(capacidade) as qtd FROM silos WHERE idtrade = '+inttostr(idTrade)+'; ';
      Open;
      First;
      totalCapacidade := FieldByName('qtd').AsFloat;

    end;
  finally
    freeandnil(sqlaux);
  end;

  result := totalCapacidade - totalArmazenado;

end;

end.

