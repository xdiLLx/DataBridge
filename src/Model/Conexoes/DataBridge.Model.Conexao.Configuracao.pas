unit DataBridge.Model.Conexao.Configuracao;

interface

uses
  DataBridge.Model.Conexao.Interfaces,
  System.IOUtils,
  System.SysUtils;

type
  TConfiguracaoBancoDados = class(TInterfacedObject, iConfiguracaoBancoDados)
  private
    { Campos privados }
    FDriverName: string;
    FServer: string;
    FUsuario: string;
    FSenha: string;
    FPorta: integer;
    FHostname: string;

    function DriverName(Value: string): iConfiguracaoBancoDados; overload;
    function Database(Value: string): iConfiguracaoBancoDados; overload;
    function Usuario(Value: string): iConfiguracaoBancoDados; overload;
    function Senha(Value: string): iConfiguracaoBancoDados; overload;
    function Hostname(Value: string): iConfiguracaoBancoDados; overload;
    function Porta(Value: integer): iConfiguracaoBancoDados; overload;
    function DriverName: string; overload;
    function Database: string; overload;
    function Usuario: string; overload;
    function Hostname: string; overload;
    function Senha: string; overload;
    function Porta: integer; overload;
    function Parametros: iConfiguracaoBancoDados;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConfiguracaoBancoDados;
  end;

implementation

{ TConfiguracaoBancoDados }

constructor TConfiguracaoBancoDados.Create;
begin

end;

destructor TConfiguracaoBancoDados.Destroy;
begin

  inherited;
end;

function TConfiguracaoBancoDados.DriverName: string;
begin
  Result := FDriverName;
end;

function TConfiguracaoBancoDados.Hostname: string;
begin
  Result := FHostname;
end;

function TConfiguracaoBancoDados.Hostname(Value: string)
  : iConfiguracaoBancoDados;
begin
  FHostname := Value;
  Result := SELF;
end;

function TConfiguracaoBancoDados.DriverName(Value: string)
  : iConfiguracaoBancoDados;
begin
  Result := SELF;
  FDriverName := Value;
end;

class function TConfiguracaoBancoDados.New: iConfiguracaoBancoDados;
begin
  Result := SELF.Create;
end;

function TConfiguracaoBancoDados.Parametros: iConfiguracaoBancoDados;
begin
  Result := SELF;
end;

function TConfiguracaoBancoDados.Porta: integer;
begin
  Result := FPorta;
end;

function TConfiguracaoBancoDados.Porta(Value: integer): iConfiguracaoBancoDados;
begin
  Result := SELF;
  FPorta := Value;
end;

function TConfiguracaoBancoDados.Senha(Value: string): iConfiguracaoBancoDados;
begin
  Result := SELF;
  FSenha := Value;
end;

function TConfiguracaoBancoDados.Database(Value: string)
  : iConfiguracaoBancoDados;
begin
  Result := SELF;
  FServer := Value;
end;

function TConfiguracaoBancoDados.Usuario(Value: string)
  : iConfiguracaoBancoDados;
begin
  Result := SELF;
  FUsuario := Value;
end;

function TConfiguracaoBancoDados.Senha: string;
begin
  Result := FSenha;
end;

function TConfiguracaoBancoDados.Database: string;
begin
  Result := FServer;
end;

function TConfiguracaoBancoDados.Usuario: string;
begin
  Result := FUsuario;
end;

end.
