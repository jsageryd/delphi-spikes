unit fMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edPattern: TLabeledEdit;
    edInput: TLabeledEdit;
    mResult: TMemo;
    procedure EditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.RegularExpressions
  ,System.RegularExpressionsCore
  ,System.UITypes
  ;

{$R *.dfm}

procedure TForm1.EditChange(Sender: TObject);
var
  r: TRegEx;
  m: TMatch;
  g: TGroup;
  i: integer;
begin
  try
    mResult.Clear;
    r := TRegEx.Create(edPattern.Text, [roCompiled]);

    { Colour fields }
    if r.IsMatch(edInput.Text) then begin
      edInput.Color := TColors.Greenyellow;
    end else begin
      edInput.Color := TColors.Orangered;
    end;
    edPattern.Color := TColors.Greenyellow;

    { Get matches }
    for m in r.Matches(edInput.Text) do begin
      mResult.Lines.Add(Format('Match: %s', [m.Value]));
      i := 0;
      for g in m.Groups do begin
        mResult.Lines.Add(Format('  Group %s: %s', [IntToStr(i), g.Value]));
        Inc(i);
      end;
      mResult.Lines.Add('');
    end;
  except
    on E: ERegularExpressionError do begin
      edPattern.Color := TColors.Orangered;
    end else begin
      raise;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Self.EditChange(nil);
end;

end.
