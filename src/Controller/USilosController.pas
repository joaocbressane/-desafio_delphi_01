unit USilosController;

interface

uses UDMSilos,USilosModel, System.SysUtils;
type
  TSilosController = class
     constructor Create;
     destructor Destroy; override;

     procedure Pesquisar(pIDTrade:Integer);
     function Inserir(silo : TSilos; var sErro:string):boolean;
     function Alterar(silo : TSilos; var sErro:string):boolean;
     function Excluir(IdSilo, IdTrade : integer; var serro:string):boolean;

  end;

implementation

{ TSilosController }

constructor TSilosController.Create;
begin
  DMSilos := TDMSilos.Create(nil);
end;

destructor TSilosController.Destroy;
begin
  FreeAndNil(DMSilos);
  inherited;
end;

function TSilosController.Excluir(IdSilo, IdTrade: integer;
  var serro: string): boolean;
begin
  result := DMSilos.Excluir(IdSilo, IdTrade,serro);
end;

function TSilosController.Inserir(silo: TSilos; var sErro: string): boolean;
begin
  result := DMSilos.Inserir(silo, serro);
end;

procedure TSilosController.Pesquisar(pIDTrade: Integer);
begin
  DMSilos.Pesquisar(pIDTrade);
end;

function TSilosController.Alterar(silo: TSilos; var sErro: string): boolean;
begin
   result := DMSilos.Alterar(silo, serro);
end;

end.
