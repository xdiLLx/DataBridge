program DataBridge;

uses
  System.StartUpCopy,
  FMX.Forms,
  DataBridge.View.Principal in 'src\View\DataBridge.View.Principal.pas' {FormPrincipal},
  DataBridge.Model.Conexao.Configuracao in 'src\Model\Conexoes\DataBridge.Model.Conexao.Configuracao.pas',
  DataBridge.Model.Conexao.Firedac in 'src\Model\Conexoes\DataBridge.Model.Conexao.Firedac.pas',
  DataBridge.Model.Conexao.Interfaces in 'src\Model\Conexoes\DataBridge.Model.Conexao.Interfaces.pas',
  DataBridge.Model.Conexao.Query.Firedac in 'src\Model\Conexoes\DataBridge.Model.Conexao.Query.Firedac.pas',
  DataBridge.Controller.Factory.Conexao in 'src\Controller\Factory\DataBridge.Controller.Factory.Conexao.pas',
  DataBridge.Controller.Interfaces in 'src\Controller\DataBridge.Controller.Interfaces.pas',
  DataBridge.Controller.Factory.Interfaces in 'src\Controller\Factory\DataBridge.Controller.Factory.Interfaces.pas',
  DataBridge.Controller.Factory.Query in 'src\Controller\Factory\DataBridge.Controller.Factory.Query.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.