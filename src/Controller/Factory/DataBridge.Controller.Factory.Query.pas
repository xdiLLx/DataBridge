unit DataBridge.Controller.Factory.Query;

interface

uses
  DataBridge.Controller.Factory.Interfaces,
  DataBridge.Model.Conexao.Interfaces, DataBridge.Model.Conexao.Query.Firedac;


Type
  TControllerFactoryQuery = class(TInterfacedObject, iFactoryQuery)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFactoryQuery;
      function Query(Connection : iConexao) : iQuery;
  end;

implementation

{ TControllerFactoryQuery }

constructor TControllerFactoryQuery.Create;
begin

end;

destructor TControllerFactoryQuery.Destroy;
begin

  inherited;
end;

class function TControllerFactoryQuery.New: iFactoryQuery;
begin
  Result := Self.Create;
end;

function TControllerFactoryQuery.Query(Connection : iConexao) : iQuery;
begin
  Result := TModelQueryFiredac.New(Connection);
end;

end.
