object frmAcertaSaldo: TfrmAcertaSaldo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Estoque - Ajusta Saldo'
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
  OnShow = FormShow
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
  object qrySaldoA: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      
        'SELECT CODIGO,  coalesce(sum(QTDRENTRADA-QTDRSAIDA),0) QTDR FROM' +
        '('
      ''
      
        'select ci.fk_produto as codigo, coalesce(ci.qtd,0) qtdrentrada, ' +
        '0 as qtdrsaida from compra_itens ci'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'left join compra co on co.id=ci.fk_compra'
      'where'
      'co.STATUS='#39'F'#39' and ci.fk_produto=:produto'
      '/*where*/'
      'union all'
      ''
      
        'select ci.fk_produto as codigo, coalesce(ci.qtd,0) qtdrentrada, ' +
        ' coalesce(ci.qtd,0) as qtdrsaida from compra_itens ci'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'left join compra co on co.id=ci.fk_compra'
      'where'
      'co.STATUS='#39'C'#39' and ci.fk_produto=:produto'
      '/*where*/'
      ''
      'union all'
      ''
      
        'select os.fk_produto as codigo, coalesce(os.qtd,0) qtdrentrada, ' +
        '0 as qtdrsaida from os_detalhe os'
      'left join produto pro on pro.codigo=os.fk_produto'
      'left join os_master om on om.codigo=os.fk_os_master'
      'where'
      'om.situacao='#39'F'#39' and os.fk_produto=:produto'
      '/*where*/'
      'union all'
      ''
      
        'select os.fk_produto as codigo, coalesce(os.qtd,0) qtdrentrada, ' +
        ' coalesce(os.qtd,0) as qtdrsaida from os_detalhe os'
      'left join produto pro on pro.codigo=os.fk_produto'
      'left join os_master om on om.codigo=os.fk_os_master'
      'where'
      'om.situacao='#39'C'#39' and os.fk_produto=:produto'
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  vd.id_produto as codigo, 0 as qtdrentrada, coalesce(vd.q' +
        'td,0) qtdrsaida   from vendas_detalhe vd'
      'left join produto pro on pro.codigo=vd.id_produto'
      'left join vendas_master vm on vm.codigo=vd.fkvenda'
      'where'
      
        '(vm.situacao<>'#39'C'#39') and (vd.os is null) and (vd.id_produto=:produ' +
        'to)'
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  vd.id_produto as codigo, coalesce(vd.qtd,0) as qtdrentra' +
        'da, coalesce(vd.qtd,0) as qtdrsaida  from vendas_detalhe vd'
      'left join produto pro on pro.codigo=vd.id_produto'
      'left join vendas_master vm on vm.codigo=vd.fkvenda'
      'where'
      
        '(vm.situacao='#39'C'#39') and (vd.id_produto=:produto) and (vd.os is nul' +
        'l)'
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
      'vm.situacao<>'#39'C'#39'  and vc.id_produto=:produto'
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
      'vm.situacao='#39'C'#39'  and vc.id_produto=:produto'
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  nfe.id_produto as codigo, coalesce(nfe.qtd,0) as qtdrent' +
        'rada, 0 as qtdrsaida   from nfe_detalhe nfe'
      'left join produto pro on pro.codigo=NFE.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfe.fknfe'
      'where'
      
        'not(nfm.situacao in ('#39'3,5,6'#39'))  and nfe.id_produto=:produto and ' +
        'nfM.movimento='#39'E'#39' and nfe.evenda='#39'S'#39
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  nfe.id_produto as codigo, 0 as qtdrentrada, coalesce(nfe' +
        '.qtd,0) as qtdrsaida   from nfe_detalhe nfe'
      'left join produto pro on pro.codigo=NFE.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfe.fknfe'
      'where'
      
        'not(nfm.situacao in ('#39'3,5,6'#39'))  and nfe.id_produto=:produto and ' +
        'nfM.movimento='#39'S'#39' and nfe.evenda='#39'S'#39
      '/*where*/'
      ''
      'union all'
      ''
      ''
      
        'select  DD.fk_produto as codigo,0 as qtdrentrada, coalesce(dd.qt' +
        'd,0) qtdrsaida   from devolucao_detalhe DD'
      'left join produto pro on pro.codigo=DD.fk_produto'
      'left join devolucao_master dm on dm.codigo=dd.fk_devolucao'
      'where'
      'dm.situacao='#39'C'#39' and  dd.fk_produto=:produto'
      '/*where*/'
      ''
      'union all'
      ''
      
        'select DD.fk_produto as codigo, coalesce(dd.qtd,0) as qtdrentrad' +
        'a, 0 as qtdrsaida   from devolucao_detalhe DD'
      'left join produto pro on pro.codigo=DD.fk_produto'
      'left join devolucao_master dm on dm.codigo=dd.fk_devolucao'
      'where'
      'dm.situacao<>'#39'C'#39'  and dd.fk_produto=:produto'
      '/*where*/'
      ''
      ''
      'union all'
      ''
      
        'select  DCD.id_produto as codigo,0 as qtdrentrada, coalesce(dcd.' +
        'qtd_devolvida,0) qtdrsaida   from devolucao_compra_d DCD'
      'left join produto pro on pro.codigo=DCD.id_produto'
      
        'left join devoluca_compra_m dcm on dcm.codigo=dcd.fk_devolucao_c' +
        'ompra_m'
      'where'
      'dcm.situacao<>'#39'C'#39' and dcd.id_produto=:produto'
      '/*where*/'
      ''
      'union all'
      ''
      
        'select DCD.id_produto as codigo, coalesce(dcd.qtd_devolvida,0) a' +
        's qtdrentrada, 0 as qtdrsaida   from devolucao_compra_d DCD'
      'left join produto pro on pro.codigo=DCD.id_produto'
      
        'left join devoluca_compra_m dcm on dcm.codigo=dcd.fk_devolucao_c' +
        'ompra_m'
      'where'
      'dcm.situacao='#39'C'#39' and  dcd.id_produto=:produto'
      '/*where*/'
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
      'ac.e_s='#39'S'#39' and ac.fkproduto=:produto'
      '/*where*/'
      ''
      'union all'
      ''
      
        'select  ac.fkproduto as codigo,  coalesce(ac.qtd_a,0) as qtdrent' +
        'rada,0 as qtdrsaida  from acerta_estoque ac'
      'left join produto pro on pro.codigo=ac.fkproduto'
      'where'
      'ac.e_s='#39'E'#39' and ac.fkproduto=:produto'
      '/*where*/'
      ''
      ')'
      'group by 1'
      'ORDER BY CODIGO')
    Left = 72
    Top = 48
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrySaldoACODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qrySaldoAQTDR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'QTDR'
      Origin = 'QTDR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
  end
  object QrySaldoF: TFDQuery
    Connection = Dados.Conexao
    SQL.Strings = (
      'select fk_produto, sum(qtde-efiscals) saldo from('
      ''
      
        'select ci.fk_produto, ci.qtd qtde, 0 as efiscals  from compra_it' +
        'ens ci'
      'left join produto pro on pro.codigo=ci.fk_produto'
      'left join compra co on co.id=ci.fk_compra'
      'where'
      'ci.fk_produto like :produto and'
      'co.status='#39'F'#39' and'
      'co.ehfiscal='#39'S'#39' and'
      '(ci.bloqueado is null)'
      ''
      'union all'
      ''
      
        'select ae.fkproduto, 0 as qtde, ae.qtd_f as efiscals   from acer' +
        'ta_estoque ae'
      'left join produto pro on pro.codigo=ae.fkproduto'
      'where'
      'ae.fkproduto like :produto and'
      'ae.e_s='#39'S'#39' and'
      'ae.qtd_f>0'
      ''
      'union all'
      ''
      
        'select ae.fkproduto, ae.qtd_f as qtde, 0 as efiscals   from acer' +
        'ta_estoque ae'
      'left join produto pro on pro.codigo=ae.fkproduto'
      'where'
      'ae.fkproduto like :produto and'
      'ae.e_s='#39'E'#39' and'
      'ae.qtd_f>0'
      ''
      'union all'
      ''
      
        'select nfcd.id_produto, 0 as qtde,  nfcd.qtd as efiscals   from ' +
        'nfce_detalhe nfcd'
      'left join produto pro on pro.codigo=nfcd.id_produto'
      'left join nfce_master nfcm on nfcm.codigo=nfcd.fkvenda'
      'where'
      'nfcd.id_produto like :produto and'
      '(nfcm.situacao in('#39'T'#39','#39'D'#39','#39'O'#39')) and'
      '(nfcd.bloqueado is null)'
      'union all'
      ''
      
        'select nfd.id_produto, 0 as qtde,  nfd.qtd as efiscals   from nf' +
        'e_detalhe nfd'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfd.fknfe'
      'left join cfop on cfop.codigo=nfd.cfop'
      'where'
      'nfd.id_produto like :produto and'
      '(nfm.situacao in ('#39'2'#39','#39'4'#39','#39'7'#39')   )and'
      'cfop.tipo='#39'S'#39' and'
      '(nfd.bloqueado is null)'
      ''
      'union all'
      ''
      
        'select nfd.id_produto, nfd.qtd as qtde,  0 as efiscals   from nf' +
        'e_detalhe nfd'
      'left join produto pro on pro.codigo=nfd.id_produto'
      'left join nfe_master nfm on nfm.codigo=nfd.fknfe'
      'left join cfop on cfop.codigo=nfd.cfop'
      'where'
      'nfd.id_produto like :produto and'
      '(nfm.situacao in ('#39'2'#39','#39'4'#39','#39'7'#39')   )and'
      'cfop.tipo='#39'E'#39' and'
      '(nfd.bloqueado is null)'
      ')'
      'group by 1'
      'order by 2')
    Left = 140
    Top = 48
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 30
        Value = Null
      end>
    object QrySaldoFFK_PRODUTO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'FK_PRODUTO'
      Origin = 'FK_PRODUTO'
      ProviderFlags = []
      ReadOnly = True
    end
    object QrySaldoFSALDO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SALDO'
      Origin = 'SALDO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 3
    end
  end
end
