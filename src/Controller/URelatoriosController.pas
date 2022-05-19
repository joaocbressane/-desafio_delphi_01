unit URelatoriosController;

interface

uses UDMRelatorios;
type
  TRelatoriosController = class
  public
    procedure RelatorioGeral;
  end;
implementation

{ TRelatorioController }

procedure TRelatoriosController.RelatorioGeral;
begin
  DMRelatorios.RelatorioGeral;
end;

end.
