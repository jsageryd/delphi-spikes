object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Regex'
  ClientHeight = 307
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    315
    307)
  PixelsPerInch = 96
  TextHeight = 13
  object edPattern: TLabeledEdit
    Left = 16
    Top = 28
    Width = 285
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Pattern'
    TabOrder = 0
    Text = '^([\w\d_\-\.]+)@([\w\d_\-\.]+)\.(\w+)$'
    OnChange = editChange
  end
  object edInput: TLabeledEdit
    Left = 16
    Top = 68
    Width = 285
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Input string'
    TabOrder = 1
    Text = 'user@domain.tld'
    OnChange = editChange
  end
  object mResult: TMemo
    Left = 16
    Top = 100
    Width = 285
    Height = 191
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
end
