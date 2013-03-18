object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'RTTI'
  ClientHeight = 282
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    512
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object btnGo: TButton
    Left = 429
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Go'
    TabOrder = 0
    OnClick = btnGoClick
    ExplicitLeft = 308
  end
  object mOutput: TMemo
    Left = 4
    Top = 4
    Width = 415
    Height = 274
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    ExplicitWidth = 294
  end
end
