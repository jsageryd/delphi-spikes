unit fMain;

interface

uses
  Winapi.Windows
  ,Winapi.Messages
  ,System.SysUtils
  ,System.Variants
  ,System.Classes
  ,Vcl.Graphics
  ,Vcl.Controls
  ,Vcl.Forms
  ,Vcl.Dialogs
  ,Vcl.StdCtrls
  ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    procedure Log(Text: string);
    procedure Test1;
    procedure Test2;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uMyClass
  ,Generics.Collections
  ;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Test1;
  Test2;
end;

procedure TForm1.Log(Text: string);
begin
  Memo1.Lines.Add(Format('[%s] %s', [FormatDateTime('yyyy-mm-dd hh:nn:ss', Now), Text]));
end;

procedure TForm1.Test1;
var
  myObject: TMyClass;
  p_myObject: PMyClass;
  pp_myObject: PPMyClass;
begin
  myObject := TMyClass.Create;
  p_myObject := Addr(myObject);
  pp_myObject := Addr(p_myObject);
  Log('--------------------------------');
  Log(Format('myObject.Value = "%s"', [myObject.Value]));
  Log(Format('p_myObject.Value = "%s"', [p_myObject.Value]));
  Log(Format('p_myObject^.Value = "%s"', [p_myObject^.Value]));
  Log(Format('pp_myObject^.Value = "%s"', [pp_myObject^.Value]));
  Log(Format('pp_myObject^^.Value = "%s"', [pp_myObject^^.Value]));
  Log('--------------------------------');
  myObject.Free;
end;

procedure TForm1.Test2;
var
  myObjectList: TList<TMyClass>;
  p_myObjectList: TList<PMyClass>;
  pp_myObjectList: TList<PPMyClass>;
  myObject: TMyClass;
  p_myObject: PMyClass;
  pp_myObject: PPMyClass;
  i: integer;
begin
  myObjectList := TList<TMyClass>.Create;
  p_myObjectList := TList<PMyClass>.Create;
  pp_myObjectList := TList<PPMyClass>.Create;
  for i := 0 to 2 do myObjectList.Add(TMyClass.Create(Format('Value %d', [i])));
  for myObject in myObjectList do p_myObjectList.Add(@myObject); // <- as if this would work...
  for p_myObject in p_myObjectList do pp_myObjectList.Add(@p_myObject);
  Log('--------------------------------');
  i := 0;
  for myObject in myObjectList do begin
    Log(Format('(%d) myObject.Value = "%s"', [i, myObject.Value]));
    Inc(i);
  end;
  i := 0;
  for p_myObject in p_myObjectList do begin
    Log(Format('(%d) p_myObject.Value = "%s"', [i, p_myObject.Value]));
    Inc(i);
  end;
  i := 0;
  for p_myObject in p_myObjectList do begin
    Log(Format('(%d) p_myObject^.Value = "%s"', [i, p_myObject^.Value]));
    Inc(i);
  end;
  i := 0;
  for pp_myObject in pp_myObjectList do begin
    Log(Format('(%d) pp_myObject^.Value = "%s"', [i, pp_myObject^.Value]));
    Inc(i);
  end;
  i := 0;
  for pp_myObject in pp_myObjectList do begin
    Log(Format('(%d) pp_myObject^^.Value = "%s"', [i, pp_myObject^^.Value]));
    Inc(i);
  end;
  Log('--------------------------------');
  for myObject in myObjectList do myObject.Free;
  myObjectList.Free;
  p_myObjectList.Free;
  pp_myObjectList.Free;
end;

end.
