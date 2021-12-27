object frmZeraNegativo: TfrmZeraNegativo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Zera Estoque Negativo'
  ClientHeight = 95
  ClientWidth = 773
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
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 0
    Width = 773
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 304
    Top = 56
    Width = 123
    Height = 25
    Caption = 'Executar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object qrySaldoR: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select codigo, qtd_atual from produto'
      'where'
      'qtd_atual<0'
      'order by codigo'
      '')
    Left = 184
    Top = 40
    object qrySaldoRCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySaldoRQTD_ATUAL: TFMTBCDField
      FieldName = 'QTD_ATUAL'
      Origin = 'QTD_ATUAL'
      Required = True
      Precision = 18
      Size = 6
    end
  end
  object qryAcerta: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select * from acerta_estoque'
      'WHERE'
      'fkproduto=:id')
    Left = 121
    Top = 40
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryAcertaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAcertaFKPRODUTO: TIntegerField
      FieldName = 'FKPRODUTO'
      Origin = 'FKPRODUTO'
    end
    object qryAcertaE_S: TStringField
      FieldName = 'E_S'
      Origin = 'E_S'
      Size = 1
    end
    object qryAcertaDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      EditMask = '!99/99/0000;1;_'
    end
    object qryAcertaQTD_F: TFMTBCDField
      FieldName = 'QTD_F'
      Origin = 'QTD_F'
      Precision = 18
      Size = 3
    end
    object qryAcertaQTD_A: TFMTBCDField
      FieldName = 'QTD_A'
      Origin = 'QTD_A'
      Precision = 18
      Size = 3
    end
  end
  object qrySaldo: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'SELECT CODIGO,  sum(QTDRENTRADA-QTDRSAIDA) QTDR FROM('
      ''
      
        'select ci.fk_produto as codigo, coalesce(ci.qtd,0) qtdrentrada, ' +
        '0 as qtdrsaida from compra_itens ci'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'left join compra co on co.id=ci.fk_compra'
      'where'
      'co.STATUS<>'#39'C'#39
      '/*where*/'
      'union all'
      ''
      
        'select ci.fk_produto as codigo, coalesce(ci.qtd,0) qtdrentrada, ' +
        ' coalesce(ci.qtd,0) as qtdrsaida from compra_itens ci'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'left join compra co on co.id=ci.fk_compra'
      'where'
      'co.STATUS='#39'C'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  vd.id_produto as codigo, 0 as qtdrentrada, coalesce(vd.q' +
        'td,0) qtdrsaida   from vendas_detalhe vd'
      'left join produto pro on pro.codigo=vd.id_produto'
      'left join vendas_master vm on vm.codigo=vd.fkvenda'
      'where'
      'vm.situacao<>'#39'C'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  vd.id_produto as codigo, coalesce(vd.qtd,0) as qtdrentra' +
        'da, coalesce(vd.qtd,0) as qtdrsaida  from vendas_detalhe vd'
      'left join produto pro on pro.codigo=vd.id_produto'
      'left join vendas_master vm on vm.codigo=vd.fkvenda'
      'where'
      'vm.situacao='#39'C'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  vc.id_produto as codigo, 0 as qtdrentrada, coalesce(vc.q' +
        'td,0) qtdrsaida   from vendas_composicao vc'
      'left join produto pro on pro.codigo=vc.id_produto'
      'left join vendas_detalhe vd on vd.codigo=vc.fk_venda_detalhe'
      'left join vendas_master vm on vm.codigo=vd.fkvenda'
      'where'
      'vm.situacao<>'#39'C'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  vc.id_produto as codigo, coalesce(vc.qtd,0) as qtdrentra' +
        'da, coalesce(vc.qtd,0) as qtdrsaida   from vendas_composicao vc'
      'left join produto pro on pro.codigo=vc.id_produto'
      'left join vendas_detalhe vd on vd.codigo=vc.fk_venda_detalhe'
      'left join vendas_master vm on vm.codigo=vd.fkvenda'
      'where'
      'vm.situacao='#39'C'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  DD.fk_produto as codigo,0 as qtdrentrada, coalesce(dd.qt' +
        'd,0) qtdrsaida   from devolucao_detalhe DD'
      'left join produto pro on pro.codigo=DD.fk_produto'
      'left join devolucao_master dm on dm.codigo=dd.fk_devolucao'
      'where'
      'dm.situacao='#39'C'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select DD.fk_produto as codigo, coalesce(dd.qtd,0) as qtdrentrad' +
        'a, 0 as qtdrsaida   from devolucao_detalhe DD'
      'left join produto pro on pro.codigo=DD.fk_produto'
      'left join devolucao_master dm on dm.codigo=dd.fk_devolucao'
      'where'
      'dm.situacao<>'#39'C'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  DCD.id_produto as codigo,0 as qtdrentrada, coalesce(dcd.' +
        'qtd_devolvida,0) qtdrsaida   from devolucao_compra_d DCD'
      'left join produto pro on pro.codigo=DCD.id_produto'
      
        'left join devoluca_compra_m dcm on dcm.codigo=dcd.fk_devolucao_c' +
        'ompra_m'
      'where'
      'dcm.situacao<>'#39'C'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select DCD.id_produto as codigo, coalesce(dcd.qtd_devolvida,0) a' +
        's qtdrentrada, 0 as qtdrsaida   from devolucao_compra_d DCD'
      'left join produto pro on pro.codigo=DCD.id_produto'
      
        'left join devoluca_compra_m dcm on dcm.codigo=dcd.fk_devolucao_c' +
        'ompra_m'
      ''
      'where'
      'dcm.situacao='#39'C'#39
      ''
      ''
      ''
      'union all'
      ''
      ''
      
        'select  ac.fkproduto as codigo, 0 as qtdrentrada, coalesce(ac.qt' +
        'd_a,0) as qtdrsaida  from acerta_estoque ac'
      'left join produto pro on pro.codigo=ac.fkproduto'
      'where'
      'ac.e_s='#39'S'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  ac.fkproduto as codigo,  coalesce(ac.qtd_a,0) as qtdrent' +
        'rada,0 as qtdrsaida  from acerta_estoque ac'
      'left join produto pro on pro.codigo=ac.fkproduto'
      'where'
      'ac.e_s='#39'E'#39
      '/*where*/'
      ''
      ')'
      'group by 1'
      'ORDER BY CODIGO')
    Left = 240
    Top = 40
    object qrySaldoCODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qrySaldoQTDR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDR'
      Origin = 'QTDR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
  end
end
