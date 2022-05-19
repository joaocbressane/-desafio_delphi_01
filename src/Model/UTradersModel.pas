unit UTradersModel;

interface
type
  TTraders = class
  private
    FID: integer;
    FNome: string;
    procedure SetNome(const Value: string);

    public
      property idTrade : integer read FID write FID;
      property nome : string read FNome write SetNome; //regra de negocio - devera ter um nome, nao pode ser em branco

  end;


implementation

{ TTraders }

procedure TTraders.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
