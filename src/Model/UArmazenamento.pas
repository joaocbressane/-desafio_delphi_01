unit UArmazenamento;

interface
type
  TContratos = class
  private
    FQuantidade: double;
    FID: integer;
    FIDTrade: integer;
    FIDSilo: integer;
    FIDContrato: integer;
  public
      property idArmazenamento : integer read FID write FID;
      property idContrato : integer read FIDContrato write FIDContrato;
      property idTrade : integer read FIDTrade write FIDTrade;
      property idSilo : integer read FIDSilo write FIDSilo;
      property Quantidade : double read FQuantidade write FQuantidade;

  end;
implementation

end.
