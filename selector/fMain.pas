unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    mInput: TMemo;
    mOutput: TMemo;
    edFilter: TLabeledEdit;
    procedure edFilterChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uSelectorList
  ;

{$R *.dfm}

procedure TForm1.edFilterChange(Sender: TObject);
var
  item: string;
  list: TSelectorList<string>;
begin
  list := TSelectorList<string>.Create;
  for item in mInput.Lines do list.Add(item);
  mOutput.Clear;

  for item in list.Where(
    function(Value: string): boolean
    begin
      Result := Pos(LowerCase(edFilter.Text), LowerCase(Value)) > 0;
    end
  ) do begin
    mOutput.Lines.Add(item);
  end;

  list.Free;
end;

end.
