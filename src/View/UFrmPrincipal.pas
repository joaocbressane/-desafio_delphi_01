unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, UProdutoresView,
  Vcl.StdCtrls, UGraosView, UTradersView, Vcl.ExtCtrls, URelatorioView;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UContratosView;

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
 try
      FrmProdutores := tfrmprodutores.create(nil);
      FrmProdutores.ShowModal;
  finally
     FreeAndNil(FrmProdutores);
  end;
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
 try
      FrmGraos := tfrmgraos.create(nil);
      FrmGraos.ShowModal;
  finally
      FreeAndNil(FrmGraos);
  end;
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
begin
  try
    FrmTraders := tfrmtraders.create(nil);
    FrmTraders.ShowModal;
  finally
    FreeAndNil(FrmTraders);
  end;
end;

procedure TFrmPrincipal.Button4Click(Sender: TObject);
begin
 try
      FrmContratos := TFrmContratos.create(nil);
      FrmContratos.ShowModal;
  finally
      FreeAndNil(FrmContratos);
  end;
end;

procedure TFrmPrincipal.Button5Click(Sender: TObject);
begin
 try
      FrmRelatorio := TFrmRelatorio.create(nil);
      FrmRelatorio.ShowModal;
  finally
      FreeAndNil(FrmRelatorio);
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  Button1.SetFocus;
end;

end.
