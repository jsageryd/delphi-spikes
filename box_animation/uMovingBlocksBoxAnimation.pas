unit uMovingBlocksBoxAnimation;

interface

uses
  uBoxAnimation
  ,Vcl.Graphics
  ,System.Types
  ;

type
  TMovingBlocksBoxAnimation = class(TBoxAnimation)
  protected
    FTime: double;
    FPosition: double;
    FForegroundColor: TColor;
    FBackgroundColor: TColor;
    function EaseInOutCubic(Time: double): double;
  public
    procedure Step(Steps: integer = 1); override;
    procedure Reset; override;
    procedure Paint(Canvas: TCanvas; Bounds: TRect); override;
    constructor Create(
      ForegroundColor: TColor = clDkGray;
      BackgroundColor: TColor = clLtGray
    );
  end;

implementation

uses
  Math
  ;

{ TMovingBlocksBoxAnimation }

constructor TMovingBlocksBoxAnimation.Create(ForegroundColor,
  BackgroundColor: TColor);
begin
  FTime := 0.0;
  FPosition := 0.0;
  FForegroundColor := ForegroundColor;
  FBackgroundColor := BackgroundColor;
end;

function TMovingBlocksBoxAnimation.EaseInOutCubic(Time: double): double;
var
  t: double;
begin
  t := Time * 2.0;
  if t < 1.0 then begin
    Result := Power(t, 3) / 2.0;
  end else begin
    t := t - 2.0;
    Result := (Power(t, 3) + 2.0) / 2.0;
  end;
end;

procedure TMovingBlocksBoxAnimation.Paint(Canvas: TCanvas; Bounds: TRect);
var
  boxWidth, boxHeight: integer;
  box1, box2: TRect;
begin
  inherited;
  boxWidth := Min(Bounds.Width, Bounds.Height) div 2;
  boxHeight := boxWidth;
  if FPosition < 0.5 then begin
    box1.Top := Bounds.Top;
    box1.Left := Bounds.Left + Round(FPosition * 2 * (Bounds.Width - BoxWidth));
    box2.Top := Bounds.Top + Bounds.Height - boxHeight;
    box2.Left := Bounds.Left + Round((1.0 - (FPosition * 2)) * (Bounds.Width - BoxWidth));
  end else begin
    box1.Top := Bounds.Top + Round((FPosition - 0.5) * 2 * (Bounds.Height - BoxHeight));
    box1.Left := Bounds.Left + Bounds.Width - boxWidth;
    box2.Top := Bounds.Top + Round((1.0 - ((FPosition - 0.5) * 2)) * (Bounds.Height - BoxHeight));
    box2.Left := Bounds.Left;
  end;
  box1.Width := boxWidth;
  box1.Height := boxHeight;
  box2.Width := boxWidth;
  box2.Height := boxHeight;
  Canvas.Brush.Color := FBackgroundColor;
  Canvas.FillRect(Bounds);
  Canvas.Brush.Color := FForegroundColor;
  Canvas.FillRect(box1);
  Canvas.FillRect(box2);
end;

procedure TMovingBlocksBoxAnimation.Reset;
begin
  inherited;
  FTime := 0.0;
end;

procedure TMovingBlocksBoxAnimation.Step(Steps: integer);
var
  i: integer;
begin
  inherited;
  FTime := FTime + 0.01 * Steps;
  if FTime < 0.5 then begin
    FPosition := EaseInOutCubic(FTime * 2) / 2;
  end else begin
    FPosition := EaseInOutCubic((FTime - 0.5) * 2) / 2 + 0.5;
  end;
  if FTime > 1.0 then Self.Reset;
end;

end.
