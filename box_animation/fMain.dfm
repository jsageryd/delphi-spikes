object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Box animation'
  ClientHeight = 300
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pbCanvas: TPaintBox
    Left = 128
    Top = 64
    Width = 128
    Height = 128
    OnPaint = pbCanvasPaint
  end
  object tStepper: TTimer
    Enabled = False
    Interval = 15
    OnTimer = tStepperTimer
    Left = 44
    Top = 232
  end
end
