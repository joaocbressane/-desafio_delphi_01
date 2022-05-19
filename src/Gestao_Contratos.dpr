program Gestao_Contratos;

uses
  Vcl.Forms,
  UFrmPrincipal in 'View\UFrmPrincipal.pas' {FrmPrincipal},
  UProdutoresModel in 'Model\UProdutoresModel.pas',
  UGraosModel in 'Model\UGraosModel.pas',
  UProdutoresView in 'View\UProdutoresView.pas' {FrmProdutores},
  UDMConexao in 'DAO\UDMConexao.pas' {DMConexao: TDataModule},
  UDMProdutores in 'DAO\UDMProdutores.pas' {DMProdutores: TDataModule},
  UProdutoresController in 'Controller\UProdutoresController.pas',
  UGraosController in 'Controller\UGraosController.pas',
  UDMGraos in 'DAO\UDMGraos.pas' {DMGraos: TDataModule},
  UGraosView in 'View\UGraosView.pas' {FrmGraos},
  UContratosModel in 'Model\UContratosModel.pas',
  UTradersModel in 'Model\UTradersModel.pas',
  USilosModel in 'Model\USilosModel.pas',
  UContratosController in 'Controller\UContratosController.pas',
  UTradersController in 'Controller\UTradersController.pas',
  USilosController in 'Controller\USilosController.pas',
  UDMContratos in 'DAO\UDMContratos.pas' {DMContratos: TDataModule},
  UDMTraders in 'DAO\UDMTraders.pas' {DMTraders: TDataModule},
  UDMSilos in 'DAO\UDMSilos.pas' {DMSilos: TDataModule},
  UTradersView in 'View\UTradersView.pas' {FrmTraders},
  UContratosView in 'View\UContratosView.pas' {FrmContratos},
  UArmazenamento in 'Model\UArmazenamento.pas',
  UDMArmazenamento in 'DAO\UDMArmazenamento.pas' {DMArmazenamento: TDataModule},
  UArmazenamentoController in 'Controller\UArmazenamentoController.pas',
  URelatorioView in 'View\URelatorioView.pas' {FrmRelatorio},
  UDMRelatorios in 'DAO\UDMRelatorios.pas' {DMRelatorios: TDataModule},
  URelatoriosController in 'Controller\URelatoriosController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TFrmRelatorio, FrmRelatorio);
  Application.CreateForm(TDMRelatorios, DMRelatorios);
  Application.Run;
end.
