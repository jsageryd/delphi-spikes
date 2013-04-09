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
  ,Vcl.ExtCtrls
  ,uBoxAnimation
  ;

type
  TForm1 = class(TForm)
    tStepper: TTimer;
    pbCanvas: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure tStepperTimer(Sender: TObject);
    procedure pbCanvasPaint(Sender: TObject);
  private
    FBoxAnimation: TBoxAnimation;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uMovingBlocksBoxAnimation
  ;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FBoxAnimation := TMovingBlocksBoxAnimation.Create;
  tStepper.Enabled := true;
end;

procedure TForm1.pbCanvasPaint(Sender: TObject);
begin
  FBoxAnimation.Paint(pbCanvas.Canvas, Rect(0, 0, pbCanvas.Width, pbCanvas.Height));
end;

procedure TForm1.tStepperTimer(Sender: TObject);
begin
  FBoxAnimation.Step;
  pbCanvas.Repaint;
end;

end.
