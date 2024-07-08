unit DataBridge.Controller.Interfaces;

interface

uses
  DataBridge.Model.Conexao.Interfaces,
  Data.DB, System.Generics.Collections;

 type
 iControllerDatabase = interface
   ['{95DE3FF7-46F2-465B-9651-031E2585AE85}']
   function Tabelas : TList<String>;
   function Campos(aNomeTabela:string): TList<String>;
   function Query: iQuery;
 end;

implementation
end.
