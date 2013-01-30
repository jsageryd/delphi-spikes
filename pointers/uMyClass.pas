unit uMyClass;

interface

type
  TMyClass = class
  private
    FValue: string;
  public
    constructor Create; overload;
    constructor Create(Value: string); overload;
    property Value: string read FValue;
  end;

  PMyClass = ^TMyClass;
  PPMyClass = ^PMyClass;

implementation

{ TMyClass }

constructor TMyClass.Create;
begin
  Self.Create('Value');
end;

constructor TMyClass.Create(Value: string);
begin
  FValue := Value;
end;

end.
