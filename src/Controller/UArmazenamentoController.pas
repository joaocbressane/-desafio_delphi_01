unit UArmazenamentoController;

interface
uses UDMArmazenamento, System.SysUtils;

type
  TArmazenamentoController = class
    public
    constructor Create;
    destructor Destroy; override;
    function VerificarCapacidadeSiloLivre(idTrade:Integer):double;
    function Armazenar(idTrade, idContrato:Integer; qtdContrato: Double):boolean;
    function Excluir(pIdContrato : integer; var sErro:string):boolean;

  end;
implementation

{ TArmazenamentoController }

function TArmazenamentoController.Armazenar(idTrade, idContrato: Integer;
  qtdContrato: Double): boolean;
begin
  Result := DMArmazenamento.Armazenar(idTrade, idContrato, qtdContrato);
end;

constructor TArmazenamentoController.Create;
begin
  DMArmazenamento := TDMArmazenamento.Create(nil);
end;

destructor TArmazenamentoController.Destroy;
begin
  FreeAndNil(DMArmazenamento);
  inherited;
end;

function TArmazenamentoController.Excluir(pIdContrato: integer;
  var sErro: string): boolean;
begin
  Result := DMArmazenamento.Excluir(pIdContrato, sErro);
end;

function TArmazenamentoController.VerificarCapacidadeSiloLivre(
  idTrade: Integer): double;
begin
  Result := DMArmazenamento.VerificarCapacidadeSiloLivre(idTrade);
end;

end.
