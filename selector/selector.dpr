program selector;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form1},
  uSelectorList in 'uSelectorList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
