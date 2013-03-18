unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnGo: TButton;
    mOutput: TMemo;
    procedure btnGoClick(Sender: TObject);
  private
    procedure RTTIMagic(AObject: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uMyClassWithMethod
  ,uMyClassWithoutMethod
  ,System.Rtti
  ;

{$R *.dfm}

procedure TForm1.btnGoClick(Sender: TObject);
var
  object1: TObject;
  object2: TObject;
begin
  mOutput.Clear;
  object1 := TMyClassWithMethod.Create;
  object2 := TMyClassWithoutMethod.Create;
  Self.RTTIMagic(object1);
  mOutput.Lines.Add('');
  Self.RTTIMagic(object2);
  object1.Free;
  object2.Free;
end;

procedure TForm1.RTTIMagic(AObject: TObject);
var
  _context: TRTTIContext;
  _type: TRTTIType;
  _method: TRTTIMethod;
begin
  if AObject.ClassInfo = nil then begin
    mOutput.Lines.Add(Format('%s instance has no class info', [AObject.ClassName]));
    Exit;
  end;
  _context := TRTTIContext.Create;
  _type := _context.GetType(AObject.ClassInfo);
  _method := _type.GetMethod('MyMethod');
  if Assigned(_method) then begin
    mOutput.Lines.Add(Format('%s instance has MyMethod', [AObject.ClassName]));
    mOutput.Lines.Add(Format('Result of method: %s', [_method.Invoke(AObject, []).AsString]));
  end else begin
    mOutput.Lines.Add(Format('%s instance does not have MyMethod', [AObject.ClassName]));
  end;
end;

end.
