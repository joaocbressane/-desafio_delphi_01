unit UGraosController;

interface

uses UGraosModel, UDMGraos, System.SysUtils;

type
  TGraosController = class
    public
    constructor Create;
    destructor Destroy; override;

    function Inserir(grao : TGraos; var sErro:string):boolean;
    function Alterar(grao : TGraos; var sErro:string):boolean;
    function Excluir(pIdGrao : integer; var serro:string):boolean;

    procedure Pesquisar(pDescricao:string);


end;


implementation

{ TGraosController }

function TGraosController.Alterar(grao: TGraos; var sErro: string): boolean;
begin
   result := DMGraos.Alterar(grao, serro);
end;

constructor TGraosController.Create;
begin
  DMGraos := TDMGraos.Create(nil);
end;

destructor TGraosController.Destroy;
begin
  FreeAndNil(DMGraos);
  inherited;
end;

function TGraosController.Excluir(pIdGrao: integer;
  var serro: string): boolean;
begin
 result := DMGraos.Excluir(pIDGrao, serro);
end;

function TGraosController.Inserir(grao: TGraos; var sErro: string): boolean;
begin
  result := DMGraos.Inserir(grao, serro);
end;


procedure TGraosController.Pesquisar(pDescricao: string);
begin
  DMGraos.Pesquisar(pDescricao);
end;

end.
