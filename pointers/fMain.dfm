object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 290
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    554
    290)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 554
    Height = 290
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Button1: TButton
    Left = 452
    Top = 257
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Go'
    TabOrder = 0
    OnClick = Button1Click
  end
end
