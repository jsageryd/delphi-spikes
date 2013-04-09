unit uBoxAnimation;

interface

uses
  Vcl.Graphics
  ,System.Types
  ;

type
  TBoxAnimation = class abstract
  public
    procedure Step(Steps: integer = 1); virtual; abstract;
    procedure Reset; virtual; abstract;
    procedure Paint(Canvas: TCanvas; Bounds: TRect); virtual; abstract;
  end;

implementation

end.
