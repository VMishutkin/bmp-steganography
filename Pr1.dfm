object Form1: TForm1
  Left = 191
  Top = 114
  Width = 518
  Height = 304
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 12
    Width = 112
    Height = 13
    Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080':'
  end
  object Label2: TLabel
    Left = 240
    Top = 96
    Width = 155
    Height = 13
    Caption = #1055#1091#1090#1100' '#1076#1083#1103' '#1080#1079#1074#1083#1077#1095#1077#1085#1085#1099#1093' '#1092#1072#1081#1083#1086#1074
  end
  object Button1: TButton
    Left = 34
    Top = 8
    Width = 175
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1048#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 32
    Top = 42
    Width = 175
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1079#1072#1087#1080#1089#1080
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 32
    Top = 114
    Width = 175
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1077
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 32
    Top = 78
    Width = 175
    Height = 25
    Caption = #1048#1079#1074#1083#1077#1095#1100' '#1092#1072#1081#1083#1099
    TabOrder = 3
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 240
    Top = 116
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'c:\'
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmap|*.Bmp'
    Left = 224
    Top = 150
  end
  object OpenDialog1: TOpenDialog
    Left = 264
    Top = 188
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = 'Bitmap|*.Bmp'
    Left = 352
    Top = 176
  end
end
