unit UProdutoresModel;

interface
uses System.SysUtils;
type
  TProdutores = class
  private
    FCNPJ: string;
    FID: integer;
    Fnome: string;
    procedure Setnome(const Value: string);
  public
      property idProdutor : integer read FID write FID;
      property nome : string read Fnome write Setnome; //regra de negocio - devera ter um nome, nao pode ser em branco
      property cnpj : string read FCNPJ write FCNPJ;
  end;


implementation

{ TProdutores }

procedure TProdutores.Setnome(const Value: string);
begin
 if value = emptystr then
    raise Exception.Create('Informe um nome');     //lança uma excepção

  Fnome := Value;
end;

end.
