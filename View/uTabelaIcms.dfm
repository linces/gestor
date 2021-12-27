object FrmTabela: TFrmTabela
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Informa'#231#245'es ICMS'
  ClientHeight = 344
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 551
    Height = 344
    TabStop = False
    Align = alClient
    Color = clBtnFace
    Lines.Strings = (
      'TABELA A'
      ''
      '0 - Nacional, exceto as indicadas nos c'#243'digos 3 a 5;'
      
        '1 - Estrangeira - Importa'#231#227'o direta, exceto a indicada no c'#243'digo' +
        ' 6;'
      
        '2 - Estrangeira - Adquirida no mercado interno, exceto a indicad' +
        'a no c'#243'digo 7;'
      
        '3 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o super' +
        'ior a 40;'
      
        '4 - Nacional, cuja produ'#231#227'o tenha sido feita em conformidade com' +
        ' os Processos Produtivos B'#225'sicos, de que '
      'tratam o Decreto-Lei n'#186' 288/67, e as Leis '
      'n'#186's 8.248/91, 8.387/91, 10.176/01 e 11.484/ 07;'
      
        '5 - Nacional, mercadoria ou bem com Conte'#250'do de Importa'#231#227'o infer' +
        'ior ou igual a 40% (quarenta por cento);'
      
        '6 - Estrangeira - Importa'#231#227'o direta, sem similar nacional, const' +
        'ante em lista de Resolu'#231#227'o CAMEX;'
      
        '7 - Estrangeira - Adquirida no mercado interno, sem similar naci' +
        'onal, constante em lista de Resolu'#231#227'o CAMEX.'
      ''
      'TABELA B'
      ''
      '00 - tributada integralmente'
      
        '10 - tributada e com cobran'#231'a do ICMS por substitui'#231#227'o tribut'#225'ri' +
        'a'
      '20 - com redu'#231#227'o de base de c'#225'lculo'
      
        '30 - isenta ou n'#227'o tributada e com cobran'#231'a do ICMS por substitu' +
        'i'#231#227'o tribut'#225'ria'
      '40 - isenta'
      '41 - n'#227'o tributada'
      '50 - com suspens'#227'o'
      '51 - com diferimento'
      '60 - ICMS cobrado anteriormente por substitui'#231#227'o tribut'#225'ria'
      
        '70 - com redu'#231#227'o da base de c'#225'lculo e cobran'#231'a do ICMS por subst' +
        'itui'#231#227'o tribut'#225'ria'
      '90 - outras')
    ReadOnly = True
    TabOrder = 0
  end
end
