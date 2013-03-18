unit uMyClassWithMethod;

interface

type
  TMyClassWithMethod = class
  public
    function MyMethod: string;
  end;

implementation

{ TMyClassWithMethod }

function TMyClassWithMethod.MyMethod: string;
begin
  Result := 'MyMethod says hi!';
end;

end.
