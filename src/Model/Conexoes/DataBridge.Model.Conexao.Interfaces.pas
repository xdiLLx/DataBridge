unit DataBridge.Model.Conexao.Interfaces;

interface

uses
  Data.DB;

type

  iConfiguracaoBancoDados = interface;

  iConexao = interface
    ['{1B20BDCF-C58B-40C5-9CBD-823CD9C36BEA}']
    function Connection : TCustomConnection;
  end;

  iQuery = interface
    ['{2D5D9E34-1316-4ECB-A66B-585729D2F2C5}']
    function SQL(Value : String) : iQuery;
    function DataSet : TDataSet;
  end;

  iConfiguracaoBancoDados = interface
    ['{367A041E-2975-4E8A-857B-A6A09749D3EB}']
    function DriverName(Value: string): iConfiguracaoBancoDados; overload;
    function Server(Value: string): iConfiguracaoBancoDados; overload;
    function Usuario(Value: string): iConfiguracaoBancoDados; overload;
    function Senha(Value: string): iConfiguracaoBancoDados; overload;
    function Porta(Value: integer): iConfiguracaoBancoDados; overload;
    function DriverName: string; overload;
    function Server: string; overload;
    function Usuario: string; overload;
    function Senha: string; overload;
    function Porta: Integer; overload;
    function Parametros: iConfiguracaoBancoDados;
  end;


implementation

end.