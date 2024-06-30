unit DataBridge.Controller.Factory.Conexao;

interface

uses

 DataBridge.Controller.Factory.Interfaces, DataBridge.Model.Conexao.Interfaces,
  Data.DB, DataBridge.Model.Conexao.Firedac ;

type
  TControllerConexaoFactory = class(TInterfacedObject,
    iControllerConexaoFactory)
  private
    { Campos privados }
    function FireDAC(Parametros: iConfiguracaoBancoDados): iConexao;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerConexaoFactory;
  end;

implementation

{ TControllerConexaoFactory }

constructor TControllerConexaoFactory.Create;
begin

end;

destructor TControllerConexaoFactory.Destroy;
begin

  inherited;
end;

function TControllerConexaoFactory.FireDAC(Parametros: iConfiguracaoBancoDados)
  : iConexao;
begin
  Result := TModelConexaoFiredac.New(Parametros);
end;

class function TControllerConexaoFactory.New: iControllerConexaoFactory;
begin
  Result := Self.Create;
end;

end.
