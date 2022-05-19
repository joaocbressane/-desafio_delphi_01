unit UContratosModel;

interface
type
  TContratos = class
  private
    FIDGrao: integer;
    FIDProdutor: integer;
    FQuantidade: double;
    FID: integer;
    FIDTrade: integer;
  public
      property idContrato : integer read FID write FID;
      property idProdutor : integer read FIDProdutor write FIDProdutor;
      property idGrao : integer read FIDGrao write FIDGrao;
      property idTrade : integer read FIDTrade write FIDTrade;
      property Quantidade : double read FQuantidade write FQuantidade;

  end;
implementation

end.
