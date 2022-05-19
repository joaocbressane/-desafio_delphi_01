unit UContratosController;

interface

uses UContratosModel, UDMContratos, System.SysUtils;
type
  TContratosController = class
  public
    constructor Create;
    destructor Destroy; override;

    function Inserir(contrato : TContratos; var sErro:string):boolean;
    function Alterar(contrato : TContratos; var sErro:string):boolean;
    function Excluir(pIdContrato : integer; var sErro:string):boolean;

    function GerarID : Integer;
    procedure pesquisar(CNPJ, nomeTrade:String);

  end;
implementation

{ TContratosController }

function TContratosController.Alterar(contrato: TContratos;
  var sErro: string): boolean;
begin
   result := DMContratos.Alterar(contrato, serro);
end;

constructor TContratosController.Create;
begin
  DMContratos:=  TDMContratos.Create(nil);
end;

destructor TContratosController.Destroy;
begin
   FreeAndNil(DMContratos);
  inherited;
end;

function TContratosController.Excluir(pIdContrato: integer;
  var sErro: string): boolean;
begin
 result := DMContratos.Excluir(pIDContrato, serro);
end;

function TContratosController.GerarID: Integer;
begin
  Result := DMContratos.GerarID;
end;

function TContratosController.Inserir(contrato: TContratos;
  var sErro: string): boolean;
begin
  result := DMContratos.Inserir(contrato, sErro);
end;

procedure TContratosController.pesquisar(CNPJ, nomeTrade:String);
begin
  DMContratos.pesquisar(CNPJ, nomeTrade);
end;

end.
