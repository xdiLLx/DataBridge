unit DataBridge.View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, DataBridge.Controller.Factory.Query,
  DataBridge.Controller.Factory.Conexao;

type
  TFormPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  DataBridge.Model.Conexao.Interfaces, DataBridge.Model.Conexao.Configuracao;

{$R *.fmx}

procedure TFormPrincipal.Button1Click(Sender: TObject);
begin
  ShowMessage('');
end;

procedure TFormPrincipal.Button2Click(Sender: TObject);
var
lConfigBanco: iConfiguracaoBancoDados;
begin
  lConfigBanco := TConfiguracaoBancoDados.New;
  lConfigBanco.DriverName('FB')
              .Server('E:\Sparta\Dados\Galvao2.0.FDB')
              .Usuario('SYSDBA')
              .Senha('masterkey');

   SHOWMESSAGE(TControllerFactoryQuery
              .New
              .Query(TControllerConexaoFactory.New.FireDAC(lConfigBanco))
              .SQL('SELECT CLI_NOME FROM CLIENTE WHERE CLI_CODIGO=2')
              .DataSet
              .FieldByName('CLI_NOME').AsString);
end;

end.
