unit URelatorioView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, UDMRelatorios;

type
  TFrmRelatorio = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorio: TFrmRelatorio;
  ds : TDataSource;

implementation

{$R *.dfm}


uses URelatoriosController;

procedure TFrmRelatorio.FormShow(Sender: TObject);
var
   p : TRelatoriosController;
begin
    ds := TDataSource.Create(nil);

  p := TRelatoriosController.Create;

  p.RelatorioGeral;
  ds.DataSet := DMRelatorios.CDSRelatorio;
  DBGrid1.DataSource := ds;
  DBGrid1.DataSource.Enabled :=true;
  DBGrid1.Refresh;

end;

end.
