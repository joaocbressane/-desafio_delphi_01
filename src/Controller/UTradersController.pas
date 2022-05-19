unit UTradersController;

interface

uses UDMTraders, UTradersModel, System.SysUtils;
type
  TTradersController = class
  public
    constructor Create;
    destructor Destroy; override;

    function Inserir(trader : TTraders; var sErro:string):boolean;
    function Alterar(trader : TTraders; var sErro:string):boolean;
    function Excluir(pIdTrader : integer; var serro:string):boolean;

    procedure Pesquisar(pNome:string);

  end;
implementation

{ TTradersController }

function TTradersController.Alterar(trader: TTraders;
  var sErro: string): boolean;
begin
  result := DMTraders.Alterar(trader, serro);
end;

constructor TTradersController.Create;
begin
  DMTraders := TDMTraders.Create(nil);
end;

destructor TTradersController.Destroy;
begin
   FreeAndNil(DMTraders);
  inherited;
end;

function TTradersController.Excluir(pIdTrader: integer;
  var serro: string): boolean;
begin
  result := DMTraders.Excluir(pIDTrader, serro);
end;

function TTradersController.Inserir(trader: TTraders;
  var sErro: string): boolean;
begin
  result := DMTraders.Inserir(trader, serro);
end;

procedure TTradersController.Pesquisar(pNome: string);
begin
  DMTraders.Pesquisar(pNome);
end;

end.
