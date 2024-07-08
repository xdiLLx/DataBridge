unit DataBridge.Controller.Database;

interface

uses
  DataBridge.Controller.Interfaces,
  DataBridge.Model.Conexao.Interfaces,
  DataBridge.Controller.Factory.Interfaces,
  DataBridge.Controller.Factory.Query,
  DataBridge.Controller.Factory.Conexao,
  System.Generics.Collections,
  FMX.Dialogs;

type
  TControllerDatabase = class(TInterfacedObject, iControllerDatabase)
  private
    FQuery: iQuery;
    FParametros: iConfiguracaoBancoDados;
    FConexao: iConexao;
    FTabelas: TList<string>;
    FCampos: TList<string>;
    FTabelaSelecionada: string;

    function Query: iQuery;
    function Tabelas: TList<String>;
    function SelecionarTabela(aNomeTabela: string):iControllerDatabase;
    function TabelaSelecionada:string;
    function Campos(aNomeTabela:string): TList<String>;

  public
    constructor Create(Parametros: iConfiguracaoBancoDados);
    destructor Destroy; override;
    class function New(Parametros: iConfiguracaoBancoDados)
      : iControllerDatabase;
  end;

implementation

{ TControllerDatabase }

function TControllerDatabase.Campos(aNomeTabela: string): TList<String>;
begin

  FCampos.Clear;

  case FParametros.DriverName of
    MySQL: FQuery := FQuery.SQL('SELECT COLUMN_NAME as name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '''+ FParametros.Database +''' AND TABLE_NAME = '''+ aNomeTabela +'''');
    Firebird: FQuery.SQL('SELECT rdb$field_name AS name FROM rdb$relation_fields WHERE rdb$relation_name = '''+ aNomeTabela +'''');
    SQLite: FQuery.SQL('PRAGMA table_info('+aNomeTabela+')');
    PostgreSQL: FQuery.SQL('SELECT column_name as name FROM information_schema.columns WHERE table_name = '''+ aNomeTabela +'''');
  end;

  FQuery.DataSet.First;
  while not FQuery.Dataset.Eof do
  begin
    FCampos.Add(FQuery.Dataset.FieldByName('name').AsString);
    FQuery.Dataset.Next;
  end;

  Result := FCampos;
end;

constructor TControllerDatabase.Create(Parametros: iConfiguracaoBancoDados);
begin
  FParametros := Parametros;
  FConexao := TControllerConexaoFactory.New.FireDAC(FParametros);
  FQuery := TControllerFactoryQuery.New.Query(FConexao);
  FTabelas := TList<string>.Create;
  FCampos := TList<string>.Create;
end;

destructor TControllerDatabase.Destroy;
begin
  FTabelas.Free;
  FCampos.Free;
  inherited;
end;

class function TControllerDatabase.New(Parametros: iConfiguracaoBancoDados)
  : iControllerDatabase;
begin
  Result := Self.Create(Parametros);
end;

function TControllerDatabase.Query: iQuery;
begin
  Result := FQuery;
end;

function TControllerDatabase.SelecionarTabela(
  aNomeTabela: string): iControllerDatabase;
begin
  FTabelaSelecionada := aNomeTabela;
end;

function TControllerDatabase.Tabelas: TList<String>;
begin
  if FTabelas.Count > 0 then
  begin
    Result := FTabelas;
    Exit
  end;

  case FParametros.DriverName of
    MySQL: FQuery := FQuery.SQL('SELECT table_name as name FROM information_schema.tables WHERE table_schema = '''+ FParametros.Database + ''' AND table_type = ''BASE TABLE''');
    Firebird: FQuery.SQL('SELECT rdb$relation_name AS NAME FROM rdb$relations WHERE rdb$view_blr IS NULL AND (rdb$system_flag IS NULL OR rdb$system_flag = 0) ORDER BY  NAME');
    SQLite: FQuery.SQL('SELECT name FROM sqlite_master WHERE type ="table" AND name NOT LIKE "sqlite_%";');
    PostgreSQL: FQuery.SQL('SELECT tablename as name FROM pg_catalog.pg_tables WHERE schemaname != ''pg_catalog'' AND schemaname != ''information_schema''');
  end;

  FQuery.DataSet.First;
  while not FQuery.Dataset.Eof do
  begin
    FTabelas.Add(FQuery.Dataset.FieldByName('name').AsString);
    FQuery.Dataset.Next;
  end;

  Result := FTabelas;

end;

function TControllerDatabase.TabelaSelecionada: string;
begin
  Result := FTabelaSelecionada;
end;

end.
