unit UProdutoresController;

interface

uses UProdutoresModel, UDMProdutores, System.SysUtils;

type
  TProdutoresController = class
  public
    constructor Create;
    destructor Destroy; override;

    function Inserir(produtor : TProdutores; var sErro:string):boolean;
    function Alterar(produtor : TProdutores; var sErro:string):boolean;
    function Excluir(pIdprodutor : integer; var serro:string):boolean;

    procedure CarregarProdutor(produtor:TProdutores; pIdProdutor:integer);
    procedure Pesquisar(sNome:string);




  end;

implementation

{ TProdutoresController }


function TProdutoresController.Alterar(produtor: TProdutores;
  var sErro: string): boolean;
begin
  result := DMProdutores.Alterar(produtor, serro);
end;

procedure TProdutoresController.CarregarProdutor(produtor: TProdutores;
  pIdProdutor: integer);
begin
  DMProdutores.CarregarProdutor(produtor,pidprodutor);
end;

constructor TProdutoresController.Create;
begin
  DMProdutores := TDMProdutores.Create(nil);
end;

destructor TProdutoresController.Destroy;
begin
  FreeAndNil(DMProdutores);
  inherited;
end;

function TProdutoresController.Excluir(pIdprodutor: integer;
  var serro: string): boolean;
begin
  result := DMProdutores.Excluir(pIdprodutor, serro);
end;

function TProdutoresController.Inserir(produtor: TProdutores;
  var sErro: string): boolean;
begin
  result := DMProdutores.Inserir(produtor, serro);
end;

procedure TProdutoresController.Pesquisar(sNome: string);
begin
  DMProdutores.Pesquisar(sNome);
end;

end.
