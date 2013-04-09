program box_animation;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form1},
  uBoxAnimation in 'uBoxAnimation.pas',
  uMovingBlocksBoxAnimation in 'uMovingBlocksBoxAnimation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
