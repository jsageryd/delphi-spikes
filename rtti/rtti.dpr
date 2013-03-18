program rtti;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form1},
  uMyClassWithMethod in 'uMyClassWithMethod.pas',
  uMyClassWithoutMethod in 'uMyClassWithoutMethod.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
