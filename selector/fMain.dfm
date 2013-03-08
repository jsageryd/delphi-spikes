object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Selector demo'
  ClientHeight = 267
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    548
    267)
  PixelsPerInch = 96
  TextHeight = 13
  object mInput: TMemo
    Left = 8
    Top = 8
    Width = 185
    Height = 250
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      'red'
      'blue'
      'green'
      'yellow'
      'purple'
      'magenta'
      'cyan')
    ParentFont = False
    TabOrder = 1
  end
  object mOutput: TMemo
    Left = 354
    Top = 8
    Width = 185
    Height = 250
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object edFilter: TLabeledEdit
    Left = 199
    Top = 100
    Width = 149
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Filter'
    TabOrder = 0
    OnChange = edFilterChange
  end
end
