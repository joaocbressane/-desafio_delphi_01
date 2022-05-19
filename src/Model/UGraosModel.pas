unit UGraosModel;

interface
type
  TGraos = class
  private
    FID: integer;
    FDescricao: string;
    procedure SetDescricao(const Value: string);

  public
      property idGrao : integer read FID write FID;
      property descricao : string read FDescricao write SetDescricao; //regra de negocio - devera ter um nome, nao pode ser em branco

  end;

implementation

{ TGraos }

procedure TGraos.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

end.
