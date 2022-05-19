unit UDMRelatorios;

interface

uses
  System.SysUtils, System.Classes, UDMConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  Datasnap.Provider;

type
  TDMRelatorios = class(TDataModule)
    FDQRelatorio: TFDQuery;
    DSPRelatorio: TDataSetProvider;
    CDSRelatorio: TClientDataSet;
    FDQRelatorioPRODUTOR: TStringField;
    FDQRelatorioTRADE: TStringField;
    FDQRelatorioGRAO: TStringField;
    FDQRelatorioQUANTIDADE: TIntegerField;
    CDSRelatorioPRODUTOR: TStringField;
    CDSRelatorioTRADE: TStringField;
    CDSRelatorioGRAO: TStringField;
    CDSRelatorioQUANTIDADE: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RelatorioGeral;
  end;

var
  DMRelatorios: TDMRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRelatorios }

procedure TDMRelatorios.RelatorioGeral;
var
  sql: string;
begin
  if CDSRelatorio.Active then
      CDSRelatorio.Close;


  FDQRelatorio.SQL.Clear;
  sql :=  'SELECT  p.nome produtor, t.nome trade, g.descricao as grao, c.quantidade '+
          'FROM contratos c '+
          'INNER JOIN produtores p on p.idprodutor = c.idprodutor '+
          'INNER JOIN graos g on g.idgrao = c.idgrao '+
          'INNER JOIN traders t on t.idtrade = c.idtrade '+
          'ORDER BY c.idcontrato; ';


  FDQRelatorio.SQL.Add(sql);
  FDQRelatorio.Active := true;
  FDQRelatorio.Open;
  CDSRelatorio.Open;
  CDSRelatorio.First;
end;


end.
