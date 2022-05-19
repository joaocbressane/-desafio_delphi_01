unit USilosModel;

interface
  type
    TSilos = class
  private
    FIdTrade: integer;
    FCapacidade: double;
    FID: integer;
    public
      property idSilo : integer read FID write FID;
      property idTrade : integer read FIdTrade write FIdTrade;
      property capacidade : double read FCapacidade write FCapacidade;
    end;
implementation

end.
