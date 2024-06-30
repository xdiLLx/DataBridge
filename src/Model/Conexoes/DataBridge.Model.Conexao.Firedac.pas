unit DataBridge.Model.Conexao.Firedac;

interface

uses
  DataBridge.Model.Conexao.Interfaces,
  Data.DB,
  Firedac.Stan.Intf,
  Firedac.Stan.Option,
  Firedac.Stan.Error,
  Firedac.UI.Intf,
  Firedac.Phys.Intf,
  Firedac.Stan.Def,
  Firedac.Stan.Pool,
  Firedac.Stan.Async,
  Firedac.Phys,
  Firedac.Phys.FB,
  Firedac.Phys.FBDef,
  Firedac.Stan.Param,
  Firedac.DatS,
  Firedac.DApt.Intf,
  Firedac.DApt,
  Firedac.Comp.DataSet,
  Firedac.Comp.Client,
  Firedac.Phys.SQLite,
  Firedac.FMXUI.Wait,
  Firedac.Comp.UI,
  Firedac.Phys.SQLiteWrapper.Stat,
  DataBridge.Model.Conexao.Configuracao,
  Firedac.Phys.MySQL,
  Firedac.Phys.PG;

Type
  TModelConexaoFiredac = class(TInterfacedObject, iConexao)
  strict private
    procedure AplicarParametros(Parametros: iConfiguracaoBancoDados);
  private
    FConexao: TFDConnection;
    FSQLiteDriverlink: TFDPhysSQLiteDriverLink;
    FFirebirdDriverLink: TFDPhysFBDriverLink;
    FMySQLDriverLink: TFDPhysMySQLDriverLink;
    FPostgreSQLDriverLink: TFDPhysPgDriverLink;
    FGUIWaitCursor: TFDGUIxWaitCursor;
    FConfiguracaoBancoDados: iConfiguracaoBancoDados;
  public
    constructor Create(Param: iConfiguracaoBancoDados);
    destructor Destroy; override;
    class function New(Param: iConfiguracaoBancoDados): iConexao;
    function Connection: TCustomConnection;
  end;

implementation

uses
  System.SysUtils;

{ TModelConexaoFiredac }

procedure TModelConexaoFiredac.AplicarParametros
  (Parametros: iConfiguracaoBancoDados);
begin
  FConexao.DriverName := Parametros.DriverName;
  FConexao.Params.Database := Parametros.Server;
  FConexao.Params.UserName := Parametros.Usuario;
  FConexao.Params.Password := Parametros.Senha;
  FConexao.Params.Values['Port'] := IntToStr(Parametros.Porta);
end;

function TModelConexaoFiredac.Connection()
  : TCustomConnection;
begin
  Result := FConexao;
end;

constructor TModelConexaoFiredac.Create(Param: iConfiguracaoBancoDados);
begin
  FSQLiteDriverlink := TFDPhysSQLiteDriverLink.Create(NIL);
  FFirebirdDriverLink := TFDPhysFBDriverLink.Create(nil);
  FMySQLDriverLink := TFDPhysMySQLDriverLink.Create(nil);
  FPostgreSQLDriverLink := TFDPhysPgDriverLink.Create(nil);
  FGUIWaitCursor := TFDGUIxWaitCursor.Create(nil);
  FConexao := TFDConnection.Create(nil);
  AplicarParametros(Param);
  FConexao.Connected := True;
end;

destructor TModelConexaoFiredac.Destroy;
begin
  FreeAndNil(FConexao);
  FreeAndNil(FSQLiteDriverlink);
  FreeAndNil(FFirebirdDriverLink);
  FreeAndNil(FMySQLDriverLink);
  FreeAndNil(FPostgreSQLDriverLink);
  FreeAndNil(FGUIWaitCursor);
  inherited;
end;

class function TModelConexaoFiredac.New(Param: iConfiguracaoBancoDados): iConexao;
begin
  Result := Self.Create(Param);
end;

end.
