program pointers;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form1},
  uMyClass in 'uMyClass.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
