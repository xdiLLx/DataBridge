unit DataBridge.Model.Conexao.Query.Firedac;

interface

uses
  DataBridge.Model.Conexao.Interfaces,
  Data.DB, Firedac.Stan.Intf,
  Firedac.Stan.Option, Firedac.Stan.Error, Firedac.UI.Intf, Firedac.Phys.Intf,
  Firedac.Stan.Def, Firedac.Stan.Pool, Firedac.Stan.Async, Firedac.Phys,
  Firedac.Phys.FB, Firedac.Phys.FBDef, Firedac.Stan.Param,
  Firedac.DatS, Firedac.DApt.Intf, Firedac.DApt, Firedac.Comp.DataSet,
  Firedac.Comp.Client;

Type
  TModelQueryFiredac = class(TInterfacedObject, iQuery)
  strict private
    function IdentificarSelect: Boolean;
  private
    FParent: iConexao;
    FQuery: TFDQuery;
  public
    constructor Create(Parent: iConexao);
    destructor Destroy; override;
    class function New(Parent: iConexao): iQuery;
    function SQL(Value: String): iQuery;
    function DataSet: TDataSet;
  end;

implementation

uses
  System.SysUtils, DataBridge.Model.Conexao.Firedac;

{ TModelQueryFiredac }

constructor TModelQueryFiredac.Create(Parent: iConexao);
begin
  FParent := Parent;
  FQuery := TFDQuery.Create(nil);

  if not Assigned(FParent) then
    raise Exception.Create('Erro Interno: Conex�o n�o instanciada na mem�ria');

  FQuery.Connection := TFDConnection(FParent.Connection);
end;

function TModelQueryFiredac.IdentificarSelect: Boolean;
begin
  Result := Pos('SELECT', Trim(UpperCase(FQuery.SQL.Text))) = 1;
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelQueryFiredac.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelQueryFiredac.New(Parent: iConexao): iQuery;
begin
  Result := Self.Create(Parent);
end;

function TModelQueryFiredac.SQL(Value: String): iQuery;
begin
  Result := Self;
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);

  if IdentificarSelect then
    FQuery.Active := true
  else
    FQuery.ExecSQL;
end;

end.