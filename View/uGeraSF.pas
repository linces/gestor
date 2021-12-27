unit uGeraSF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, DateUtils, ACBrUtil, ACBrEFDBlocos,
  ACBrTXTClass, ACBrBase, DBGridEh, Vcl.Mask, DBCtrlsEh,
  DBLookupEh, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrSpedFiscal;

type
  TFrmSpedSf = class(TForm)
    Panel2: TPanel;
    memoError: TMemo;
    btnExecute: TSpeedButton;
    btnSair: TSpeedButton;
    dsContador: TDataSource;
    dsEmpresa: TDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    cbEmpresa: TDBLookupComboboxEh;
    cbContador: TDBLookupComboboxEh;
    Label2: TLabel;
    dtIni: TDateTimePicker;
    Label3: TLabel;
    Label6: TLabel;
    edArq: TEdit;
    Label5: TLabel;
    dtFim: TDateTimePicker;
    ckSemMovimento: TCheckBox;
    ckInventario: TCheckBox;
    CbTipo: TComboBox;
    Label4: TLabel;
    ACBrSpedFiscal: TACBrSPEDFiscal;
    procedure btnExecuteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure dtFimExit(Sender: TObject);
    procedure dtIniExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbEmpresaExit(Sender: TObject);
    procedure cbContadorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure AbreTabelas;
    procedure Importa;

    { Private declarations }
  public
    procedure GeraBloco0;
    procedure GeraBlocoC;
    procedure GeraBlocoE;
    procedure GeraBlocoH;
    procedure GeraBlocoB1;

    procedure GeraSped;
    procedure NomeCaminho;
    { Public declarations }
  end;

var
  FrmSpedSf: TFrmSpedSf;

implementation

{$R *.dfm}

uses Udados, udadosSped, uEmail;

procedure TFrmSpedSf.NomeCaminho;
var
  dia, mes, ano: Word;
begin
  DecodeDate(dtIni.Date, ano, mes, dia);
  edArq.Text := tirapontos(Dados.qryEmpresacnpj.Value) + '_SPF_' + inttostr(mes)
    + inttostr(ano) + '.txt';
  ACBrSpedFiscal.Path := ExtractFilePath(Application.ExeName) + '\Sped';
  ACBrSpedFiscal.Arquivo := edArq.Text;
end;

procedure TFrmSpedSf.Importa;

begin
  // importa dados dos participantes
  DadosSped.ImportaParticipante(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue);
  Application.ProcessMessages;

  // importa unidades dos produtos
  DadosSped.ImportaUNidade(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue);
  Application.ProcessMessages;

  // importa produtos
  DadosSped.ImportaProduto(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue,'F');
  Application.ProcessMessages;

  // importa registros c100 - compra
  DadosSped.ImportaEntradaCompra(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue);
  Application.ProcessMessages;

  // importa registros c100 - nfe
  DadosSped.ImportaEntradaNFe(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue);
  Application.ProcessMessages;

  // importa registros saida nfce
  DadosSped.ImportaSaidaNCFe(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue);
  Application.ProcessMessages;

  // importa registros saida nfe
  DadosSped.ImportaSaidaNFe(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue);
  Application.ProcessMessages;

  // importa registros c190
  DadosSped.REGC190(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue);
  Application.ProcessMessages;

  // importa registros inventario
  if ckInventario.Checked then
    DadosSped.ImportaInventario(dtIni.Date, dtFim.Date, cbEmpresa.KeyValue);
  Application.ProcessMessages;

end;

procedure TFrmSpedSf.AbreTabelas;
begin
  ACBrSpedFiscal.DT_INI := dtIni.Date;
  ACBrSpedFiscal.DT_FIN := dtFim.Date;

  // Abre tabela Sped - cabeçalho do Sped

  Dados.qrySped.Close;
  Dados.qrySped.Params[0].Value := cbEmpresa.KeyValue;
  Dados.qrySped.Params[1].AsDate := dtIni.Date;
  Dados.qrySped.Params[2].AsDate := dtFim.Date;
  Dados.qrySped.Open;

  // Abre Tabela Participantes

  Dados.qrySped_Participante.Close;
  Dados.qrySped_Participante.Open;

  // Abre Tabela Unidadades

  Dados.qrySped_Unidade.Close;
  Dados.qrySped_Unidade.Open;

  // Abre Tabela Produtos

  Dados.qrySped_Produto.Close;
  Dados.qrySped_Produto.Open;

  // Abre Tabela C100 - Notas Ficais de Compra e Venda

  Dados.qrySped_C100.Close;
  Dados.qrySped_C100.Params[0].Value := Dados.qrySpedCODIGO.Value;
  Dados.qrySped_C100.Open;

  // Abre Tabela Sped Config

  DadosSped.qryConfig_Sped.Close;
  DadosSped.qryConfig_Sped.Params[0].Value := cbEmpresa.KeyValue;
  DadosSped.qryConfig_Sped.Open;

end;

procedure TFrmSpedSf.GeraSped;
begin
  // *** verifica se sped já existe na base de dados
  FormatSettings.DecimalSeparator := '.';
  AbreTabelas;

  if Dados.qrySped.IsEmpty then
  begin
    Dados.qrySped.Insert;
    Dados.qrySpeddata_ini.Value := dtIni.Date;
    Dados.qrySpeddata_fim.Value := dtFim.Date;
    Dados.qrySpedFK_EMPRESA.Value := cbEmpresa.KeyValue;
    Dados.qrySpedFK_CONTADOR.Value := cbContador.KeyValue;
    Dados.qrySpedFK_USUARIO.Value := Dados.idUsuario;
    Dados.qrySpedremessa.Value := 'O';
    if CbTipo.Text = 'SUBSTITUTO' then
    begin
      Dados.qrySpedremessa.Value := 'S';
      // Dados.qrySpedrecibo.Value := Edit1.Text;
    end;
    Dados.qrySpedsemmovimento.Value := 'F';
    if ckSemMovimento.Checked then
      Dados.qrySpedsemmovimento.Value := 'T';
    Dados.qrySpeddtemissao.Value := Date;
    Dados.qrySpedCODIGO.AsFloat := Dados.Numerador('SPED', 'CODIGO',
      'N', '', '');
    DadosSped.CodSped := Dados.qrySpedCODIGO.Value;
    Dados.qrySped.Post;
    Dados.Conexao.CommitRetaining;
  end
  else
  begin
    if MessageBox(0, 'O SPED Fiscal deste mês já foi gerado!' + #13 +
      'Deseja gerar o SPED Fiscal novamante?', 'Sped Fiscal', +mb_YesNo) = 6
    then
    begin
      Dados.qrySped.Edit;
      Dados.qrySpedFK_CONTADOR.Value := cbContador.KeyValue;

      Dados.qrySpeddtemissao.Value := Date;
      Dados.qrySpedremessa.Value := 'O';
      if CbTipo.Text = 'SUBSTITUTO' then
        Dados.qrySpedremessa.Value := 'S';

      Dados.qrySpedsemmovimento.Value := 'T';
      if ckSemMovimento.Checked then
        Dados.qrySpedsemmovimento.Value := 'F';
      Dados.qrySped.Post;

      DadosSped.CodSped := Dados.qrySpedCODIGO.Value;

      Dados.Conexao.CommitRetaining;

      DadosSped.ApagaRegistro;

    end
    else
      exit;
  end;
  // **** fim sped já existe

  // Inicio da importação do sped da base de dados
  if ckSemMovimento.Checked = false then
  begin
    Importa;
  end;

  GeraBloco0;
  GeraBlocoC;
  GeraBlocoE;
  GeraBlocoH;
  GeraBlocoB1;
  ACBrSpedFiscal.SaveFileTXT;
end;

procedure TFrmSpedSf.GeraBloco0;
begin
  with ACBrSpedFiscal.Bloco_0 do
  begin
    with Registro0000New do
    begin
      if (dtIni.Date <= strtodate('31/12/2008')) then
        COD_VER := vlVersao100;
      if (dtIni.Date <= strtodate('31/12/2009')) then
        COD_VER := vlVersao101;
      if (dtIni.Date <= strtodate('31/12/2010')) then
        COD_VER := vlVersao102;
      if (dtIni.Date <= strtodate('31/12/2011')) then
        COD_VER := vlVersao103;
      if (dtIni.Date <= strtodate('30/06/2012')) then
        COD_VER := vlVersao104;
      if (dtIni.Date <= strtodate('31/12/2012')) then
        COD_VER := vlVersao105;
      if (dtIni.Date <= strtodate('31/12/2013')) then
        COD_VER := vlVersao106;
      if (dtIni.Date <= strtodate('31/12/2014')) then
        COD_VER := vlVersao107;
      if (dtIni.Date <= strtodate('31/12/2015')) then
        COD_VER := vlVersao108;
      if (dtIni.Date <= strtodate('31/12/2016')) then
        COD_VER := vlVersao109;
      if (dtIni.Date <= strtodate('31/12/2017')) then
        COD_VER := vlVersao110;
      if (dtIni.Date <= strtodate('31/12/2018')) then
        COD_VER := vlVersao111;
      if (dtIni.Date <= strtodate('31/12/2019')) then
        COD_VER := vlVersao112;
      if (dtIni.Date <= strtodate('31/12/2020')) then
        COD_VER := vlVersao113;

      if CbTipo.Text = 'ORIGINAL' then
        COD_FIN := raOriginal
      else
        COD_FIN := raSubstituto;

      NOME := Dados.qryEmpresaRAZAO.Value;
      CNPJ := tirapontos(Dados.qryEmpresacnpj.Value);
      UF := Dados.qryEmpresauf.Value;
      IE := tirapontos(Dados.qryEmpresaie.Value);
      COD_MUN := Dados.qryEmpresaID_CIDADE.Value;
      IM := Dados.qryEmpresaim.Value;
      SUFRAMA := '';

      if DadosSped.qryConfig_SpedIND_PERFIL.Value = 'A' then
        IND_PERFIL := pfPerfilA;
      if DadosSped.qryConfig_SpedIND_PERFIL.Value = 'B' then
        IND_PERFIL := pfPerfilB;
      if DadosSped.qryConfig_SpedIND_PERFIL.Value = 'C' then
        IND_PERFIL := pfPerfilC;

      if DadosSped.qryConfig_SpedIND_ATIV.Value <> 'I' then
        IND_ATIV := atOutros;
      if DadosSped.qryConfig_SpedIND_ATIV.Value = 'I' then
        IND_ATIV := atIndustrial;
    end;

    with Registro0001New do
    begin

      IND_MOV := imComDados;

      with Registro0005New do
      begin
        IND_MOV := imComDados;

        FANTASIA := Dados.qryEmpresafantasia.Value;
        CEP := Dados.qryEmpresacep.Value;
        ENDERECO := Dados.qryEmpresaendereco.Value;
        NUM := Dados.qryEmpresanumero.Value;
        COMPL := Dados.qryEmpresacomplemento.Value;
        BAIRRO := Dados.qryEmpresabairro.Value;
        FONE := tirapontos(Dados.qryEmpresafone.Value);
        FAX := tirapontos(Dados.qryEmpresafax.Value);
        EMAIL := Dados.qryEmpresaemail.Value;
      end;

      // Dados do contador
      with Registro0100New do
      begin
        IND_MOV := imComDados;
        NOME := DadosSped.qryContadorNOME.Value;
        CPF := DadosSped.qryContadorcpf.Value;
        CRC := DadosSped.qryContadorcrc.Value;
        if length(tirapontos(DadosSped.qryContadorcnpj.Value)) = 11 then
          CPF := tirapontos(DadosSped.qryContadorcnpj.Value);
        if length(tirapontos(DadosSped.qryContadorcnpj.Value)) = 14 then
          CNPJ := tirapontos(DadosSped.qryContadorcnpj.Value);
        CEP := DadosSped.qryContadorcep.Value;
        ENDERECO := DadosSped.qryContadorendereco.Value;
        NUM := DadosSped.qryContadornumero.Value;
        COMPL := DadosSped.qryContadorcomplemento.Value;
        BAIRRO := DadosSped.qryContadorbairro.Value;
        FONE := tirapontos(DadosSped.qryContadorfone.Value);
        FAX := tirapontos(DadosSped.qryContadorfax.Value);
        EMAIL := DadosSped.qryContadoremail.Value;
        COD_MUN := DadosSped.qryContadorcod_mun.Value;
      end;


      // dados dos participantes

      Dados.qrySped_Participante.First;
      while not Dados.qrySped_Participante.Eof do
      begin
        with Registro0150New do
        begin
          if ckSemMovimento.Checked = false then
            IND_MOV := imComDados
          else
            IND_MOV := imSemDados;

          COD_PART := Dados.qrySped_Participantecod_part.AsString;
          NOME := TiraAcentos(Dados.qrySped_Participantenome.AsString);

          CNPJ := tirapontos(Dados.qrySped_Participantecnpj.Value);
          CPF := tirapontos(Dados.qrySped_Participantecpf.Value);
          COD_PAIS := '1058';
          IE := tirapontos(Dados.qrySped_Participanteie.Value);
          COD_MUN := Dados.qrySped_Participantecod_mun.Value;
          SUFRAMA := '';
          ENDERECO := trim(Dados.qrySped_Participanteendereco.Value);
          NUM := Dados.qrySped_Participantenumero.Value;
          COMPL := Dados.qrySped_Participantecomplemento.Value;
          BAIRRO := Dados.qrySped_Participantebairro.Value;
        end;
        Dados.qrySped_Participante.Next;
      end; // fim participantes

      // unidades de medidas
      Dados.qrySped_Unidade.First;
      while not Dados.qrySped_Unidade.Eof do
      begin
        with Registro0190New do
        begin
          if ckSemMovimento.Checked = false then
            IND_MOV := imComDados
          else
            IND_MOV := imSemDados;

          UNID := Dados.qrySped_UnidadeUNIDADE.AsString;
          DESCR := Dados.qrySped_UnidadeDESCRICAO.Value;
        end;
        Dados.qrySped_Unidade.Next;
      end;

      // Produtos
      Dados.qrySped_Produto.First;
      while not Dados.qrySped_Produto.Eof do
      begin
        with Registro0200New do
        begin
          if ckSemMovimento.Checked = false then
            IND_MOV := imComDados
          else
            IND_MOV := imSemDados;

          COD_ITEM := Dados.qrySped_ProdutoFK_PRODUTO.AsString;
          DESCR_ITEM := TiraAcentos(Dados.qrySped_Produtodescricao.AsString);
          COD_BARRA := trim(Dados.qrySped_Produtocod_barra.AsString);

          if Dados.qrySped_Unidade.Locate('codigo',
            Dados.qrySped_ProdutoFK_UNIDADE.Value, []) then
            UNID_INV := Dados.qrySped_UnidadeUNIDADE.Value;

          if Dados.qrySped_Produtotipo_item.Value = '00' then
            TIPO_ITEM := tiMercadoriaRevenda;
          if Dados.qrySped_Produtotipo_item.Value = '01' then
            TIPO_ITEM := tiMateriaPrima;
          if Dados.qrySped_Produtotipo_item.Value = '02' then
            TIPO_ITEM := tiEmbalagem;
          if Dados.qrySped_Produtotipo_item.Value = '03' then
            TIPO_ITEM := tiProdutoProcesso;
          if Dados.qrySped_Produtotipo_item.Value = '04' then
            TIPO_ITEM := tiProdutoAcabado;
          if Dados.qrySped_Produtotipo_item.Value = '05' then
            TIPO_ITEM := tiSubproduto;
          if Dados.qrySped_Produtotipo_item.Value = '06' then
            TIPO_ITEM := tiProdutoIntermediario;
          if Dados.qrySped_Produtotipo_item.Value = '07' then
            TIPO_ITEM := tiMaterialConsumo;
          if Dados.qrySped_Produtotipo_item.Value = '08' then
            TIPO_ITEM := tiAtivoImobilizado;
          if Dados.qrySped_Produtotipo_item.Value = '09' then
            TIPO_ITEM := tiServicos;
          if Dados.qrySped_Produtotipo_item.Value = '10' then
            TIPO_ITEM := tiOutrosInsumos;
          if Dados.qrySped_Produtotipo_item.Value = '11' then
            TIPO_ITEM := tiOutras;
          COD_NCM := Dados.qrySped_Produtocod_ncm.Value;
          // COD_GEN := '';
          // ALIQ_ICMS := '';
        end;
        Dados.qrySped_Produto.Next;
      end; // fim produtos
    end;
  end;
end;

procedure TFrmSpedSf.GeraBlocoC;
var
  codigo: Integer;
begin
  // Notas de compra e vendas

  with ACBrSpedFiscal.Bloco_C do
  begin
    with RegistroC001New do
    begin
      if ckSemMovimento.Checked = false then
        IND_MOV := imComDados;

      if ckSemMovimento.Checked = true then
      begin
        IND_MOV := imSemDados;
        exit;
      end;

      Dados.qrySped_C100.First;
      //
      while not Dados.qrySped_C100.Eof do
      begin
        if (Dados.qrySped_C100COD_MOD.Value = '55') or
          (Dados.qrySped_C100COD_MOD.Value = '65') then
        begin
          with RegistroC100New do
          begin

            IND_OPER := tpEntradaAquisicao;
            if Dados.qrySped_C100ind_oper.Value = '1' then
              IND_OPER := tpSaidaPrestacao;

            IND_EMIT := edEmissaoPropria;
            if Dados.qrySped_C100ind_emit.Value = '1' then
              IND_EMIT := edTerceiros;
            if (Dados.qrySped_C100COD_MOD.Value = '55') then
              // só para nota fiscal eletronica
              COD_PART := Dados.qrySped_C100FK_PARTICIPANTES.AsString;
            if (Dados.qrySped_C100cod_sit.Value = '02') or
              (Dados.qrySped_C100cod_sit.Value = '04') then
              COD_PART := '';
            // Baseado no registro 0150
            COD_MOD := Dados.qrySped_C100COD_MOD.AsString;
            if Dados.qrySped_C100cod_sit.Value = '00' then
              COD_SIT := sdRegular;
            if Dados.qrySped_C100cod_sit.Value = '01' then
              COD_SIT := sdExtempRegular;
            if Dados.qrySped_C100cod_sit.Value = '02' then
              COD_SIT := sdCancelado;
            if Dados.qrySped_C100cod_sit.Value = '03' then
              COD_SIT := sdCanceladoExtemp;
            if Dados.qrySped_C100cod_sit.Value = '04' then
              COD_SIT := sdDoctoDenegado;
            if Dados.qrySped_C100cod_sit.Value = '05' then
              COD_SIT := sdDoctoNumInutilizada;
            if Dados.qrySped_C100cod_sit.Value = '06' then
              COD_SIT := sdFiscalCompl;
            if Dados.qrySped_C100cod_sit.Value = '07' then
              COD_SIT := sdExtempCompl;
            if Dados.qrySped_C100cod_sit.Value = '08' then
              COD_SIT := sdRegimeEspecNEsp;
            SER := Dados.qrySped_C100ser.Value;

            NUM_DOC := FormatFloat('00000000', Dados.qrySped_C100num_doc.Value);
            CHV_NFE := Dados.qrySped_C100chv_nfe.Value;
            DT_DOC := Dados.qrySped_C100dt_doc.Value;
            DT_E_S := Dados.qrySped_C100dt_e_s.Value;

            if (Dados.qrySped_C100cod_sit.Value <> '02') and
              (Dados.qrySped_C100cod_sit.Value <> '04') then
            begin
              VL_DOC := Dados.qrySped_C100vl_doc.AsFloat;
              IND_PGTO := tpOutros;
              VL_DESC := Dados.qrySped_C100vl_desc.AsFloat;
              VL_ABAT_NT := Dados.qrySped_C100vl_abat_nt.AsFloat;
              VL_MERC := Dados.qrySped_C100vl_merc.AsFloat +
                Dados.qrySped_C100vl_desc.AsFloat;

              if Dados.qrySped_C100ind_frt.Value = 0 then
                IND_FRT := tfPorContaEmitente;
              if Dados.qrySped_C100ind_frt.Value = 1 then
                IND_FRT := tfPorContaDestinatario;
              if Dados.qrySped_C100ind_frt.Value = 2 then
                IND_FRT := tfPorContaTerceiros;
              if Dados.qrySped_C100ind_frt.Value = 3 then
                IND_FRT := tfSemCobrancaFrete;
              if Dados.qrySped_C100ind_frt.Value = 4 then
                IND_FRT := tfNenhum;
              VL_SEG := Dados.qrySped_C100vl_seguro.AsFloat;
              VL_FRT := Dados.qrySped_C100vl_frete.AsFloat;
              VL_OUT_DA := Dados.qrySped_C100vl_out_da.AsFloat;
              VL_BC_ICMS := Dados.qrySped_C100vl_bc_icms.AsFloat;
              VL_ICMS := Dados.qrySped_C100vl_icms.AsFloat;
              VL_BC_ICMS_ST := Dados.qrySped_C100vl_bc_icms_st.AsFloat;
              VL_ICMS_ST := Dados.qrySped_C100vl_icms_st.asFloat;
              VL_IPI := Dados.qrySped_C100vl_ipi.AsFloat;
              VL_PIS := Dados.qrySped_C100vl_pis.AsFloat;
              VL_COFINS := Dados.qrySped_C100vl_cofins.AsFloat;
              VL_PIS_ST := Dados.qrySped_C100vl_pis_st.AsFloat;
              VL_COFINS_ST := Dados.qrySped_C100VL_COFINS_ST.AsFloat;

            end;


            // regitros c170 é filho de c100. A cada c100 no minimo um c170

            FormatSettings.DecimalSeparator := '.';

            Dados.qrySped_C170.Close;
            Dados.qrySped_C170.Params[0].Value :=
              Dados.qrySped_C100CODIGO.Value;
            Dados.qrySped_C170.Open;

            FormatSettings.DecimalSeparator := ',';
            codigo := 1;
            if Dados.qrySped_C100ind_oper.Value = '0' then
            begin // só gera c170 de NFe Emitida por Terceiros
              while not Dados.qrySped_C170.Eof do
              begin
                with RegistroC170New do // Inicio Adicionar os Itens:
                begin

                  NUM_ITEM := inttostr(codigo);
                  COD_ITEM := Dados.qrySped_C170fk_produto.AsString;
                  DESCR_COMPL := Dados.qrySped_C170DESCRICAO.AsString;
                  QTD := Dados.qrySped_C170qtd.AsFloat;
                  Dados.qrySped_Unidade.Locate('CODIGO',
                    Dados.qrySped_C170fk_unidade.Value, []);
                  UNID := Dados.qrySped_UnidadeUNIDADE.Value;
                  VL_ITEM := Dados.qrySped_C170vl_item.AsFloat;
                  VL_DESC := Dados.qrySped_C170vl_desc.AsFloat;
                  IND_MOV := mfNao;

                  CST_ICMS := Dados.qrySped_C170cst_icms.Value;
                  CFOP := Dados.qrySped_C170cfop.AsString;
                  VL_BC_ICMS := Dados.qrySped_C170vl_bc_icms.AsFloat;
                  ALIQ_ICMS := Dados.qrySped_C170aliq_icm.AsFloat;
                  VL_ICMS := Dados.qrySped_C170vl_icms.AsFloat;
                  VL_BC_ICMS_ST := Dados.qrySped_C170vl_bc_icms_st.AsFloat;
                  ALIQ_ST := Dados.qrySped_C170aliq_st.AsFloat;
                  VL_ICMS_ST := Dados.qrySped_C170vl_icms_st.AsFloat;
                  IND_APUR := iaNenhum;
                  if (Dados.qrySped_C170CST_IPI.Value = '01') or
                    (Dados.qrySped_C170CST_IPI.Value = '02') or
                    (Dados.qrySped_C170CST_IPI.Value = '03') or
                    (Dados.qrySped_C170CST_IPI.Value = '04') or
                    (Dados.qrySped_C170CST_IPI.Value = '05') or
                    (Dados.qrySped_C170CST_IPI.Value = '49') then
                    CST_IPI := Dados.qrySped_C170CST_IPI.AsString
                  else
                    CST_IPI := '49';

                  VL_BC_IPI := Dados.qrySped_C170vl_bc_ipi.AsFloat;
                  ALIQ_IPI := Dados.qrySped_C170aliq_ipi.AsFloat;
                  VL_IPI := Dados.qrySped_C170vl_ipi.AsFloat;

                  CST_PIS := Dados.qrySped_C170CST_PIS.AsString;
                  VL_BC_PIS := Dados.qrySped_C170VL_BC_PIS.AsFloat;
                  ALIQ_PIS_PERC := Dados.qrySped_C170ALIQ_PIS_PERC.AsFloat;
                  VL_PIS := Dados.qrySped_C170vl_pis.AsFloat;
                  VL_ABAT_NT := 0;
                  COD_CTA := '';

                  if Dados.qrySped_C170ALIQ_PIS_PERC.AsFloat <= 0 then
                  begin
                    ALIQ_PIS_PERC := 0.00;
                    VL_BC_PIS := 0.00;
                    VL_PIS := 0.00;
                  end;

                  CST_COFINS := Dados.qrySped_C170CST_COFINS.AsString;

                  VL_BC_COFINS := Dados.qrySped_C170vl_bc_cofins.AsFloat;
                  ALIQ_COFINS_PERC :=
                    Dados.qrySped_C170aliq_cofins_perc.AsFloat;
                  VL_COFINS := Dados.qrySped_C170VL_COFINS.AsFloat;

                  if Dados.qrySped_C170aliq_cofins_perc.AsFloat <= 0 then
                  begin
                    ALIQ_COFINS_PERC := 0.00;
                    VL_BC_COFINS := 0.00;
                    VL_COFINS := 0.00;
                  end;
                end; // fim bloco c170
                Dados.qrySped_C170.Next;
                codigo := codigo + 1;
              end;
              // fim do while c170
            end;
            // registro c190 REGISTRO ANALÍTICO DO DOCUMENTO (CÓDIGO 01, 1B, 04, 55 e 65)

            FormatSettings.DecimalSeparator := '.';
            Dados.qrySped_C190.Close;
            Dados.qrySped_C190.Params[0].Value :=
              Dados.qrySped_C100CODIGO.Value;
            Dados.qrySped_C190.Open;
            FormatSettings.DecimalSeparator := ',';

            while not Dados.qrySped_C190.Eof do
            begin
              with RegistroC190New do
              begin
                CST_ICMS := Dados.qrySped_C190cst_icms.AsString;
                CFOP := Dados.qrySped_C190cfop.AsString;
                ALIQ_ICMS := Dados.qrySped_C190aliq_icms.AsFloat;
                VL_OPR := Dados.qrySped_C190vl_opr.AsFloat;
                VL_BC_ICMS := Dados.qrySped_C190vl_bc_icms.AsFloat;
                VL_ICMS := Dados.qrySped_C190vl_icms.AsFloat;
                VL_BC_ICMS_ST := Dados.qrySped_C190vl_bc_icms_st.AsFloat;
                VL_ICMS_ST := Dados.qrySped_C190vl_icms_st.AsFloat;
                VL_RED_BC := Dados.qrySped_C190vl_opr.AsFloat;
                VL_IPI := Dados.qrySped_C190vl_ipi.AsFloat;
              end;
              // Fim do bloco c190
              Dados.qrySped_C190.Next;
            end; // fim do while c190
          end; // fim do boco c100
        end; // fim modelo 57
        Dados.qrySped_C100.Next;
      end; // fim do while c100
    end;
  end;
end;

procedure TFrmSpedSf.GeraBlocoE;
begin
  // Alimenta gerar todos os registros do Bloco E.

  with ACBrSpedFiscal.Bloco_E do
  begin
    with RegistroE001New do
    begin

      with RegistroE100New do
      begin
        IND_MOV := imComDados;

        DT_INI := dtIni.Date;
        DT_FIN := dtFim.Date;

        with RegistroE110New do
        begin

          IND_MOV := imComDados;

          VL_TOT_DEBITOS := 0;
          VL_AJ_DEBITOS := 0;
          VL_TOT_AJ_DEBITOS := 0;
          VL_ESTORNOS_CRED := 0;
          VL_TOT_CREDITOS := 0;
          VL_AJ_CREDITOS := 0;
          VL_TOT_AJ_CREDITOS := 0;
          VL_ESTORNOS_DEB := 0;
          VL_SLD_CREDOR_ANT := 0;
          VL_SLD_APURADO := 0;
          VL_TOT_DED := 0;
          VL_ICMS_RECOLHER := 0;
          VL_SLD_CREDOR_TRANSPORTAR := 0;
          DEB_ESP := 0;

        end;
      end;
      if Dados.qrySped_ConfigIND_ATIV.Value = 'I' then
      begin

        with RegistroE500New do
        begin

          if ckSemMovimento.Checked = false then
            IND_MOV := imComDados
          else
            IND_MOV := imSemDados;

          DT_INI := dtIni.Date;
          DT_FIN := dtFim.Date;
          IND_APUR := iaMensal;

          with RegistroE520New do
          begin
            if ckSemMovimento.Checked = false then
              IND_MOV := imComDados
            else
              IND_MOV := imSemDados;

            VL_SD_ANT_IPI := 00;
            VL_DEB_IPI := 0.00;
            VL_CRED_IPI := 0.00;
            VL_OD_IPI := 0;
            VL_OC_IPI := 0;
            VL_SC_IPI := 0;
            VL_SD_IPI := 0;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmSpedSf.GeraBlocoH;
begin

  Dados.qrySped_H005.Close;
  Dados.qrySped_H005.Open;

  if ckInventario.Checked = false then
    exit;
  if Dados.qrySped_H005.IsEmpty then
    exit;


  // inventário

  with ACBrSpedFiscal.Bloco_H do
  begin
    with RegistroH001New do
    begin
      if ckSemMovimento.Checked = false then
        IND_MOV := imComDados
      else
      begin
        IND_MOV := imSemDados;
        exit;
      end;

      with RegistroH005New do
      begin
        if ckSemMovimento.Checked = false then
          IND_MOV := imComDados
        else
        begin
          IND_MOV := imSemDados;
        end;

        DT_INV := Dados.qrySped_H005dt_inv.AsDateTime;
        // o valor informado no campo deve ser menor ou igual ao valor no campo DT_FIN do registro 0000
        VL_INV := Dados.qrySped_H005vl_inv.AsFloat;

        // inicio bloco h010
        Dados.qrySped_H010.Close;
        Dados.qrySped_H010.Params[0].Value := Dados.qrySped_H005CODIGO.Value;
        Dados.qrySped_H010.Open;
        Dados.qrySped_H010.First;
        while not Dados.qrySped_H010.Eof do
        begin
          with RegistroH010New do
          begin
            if ckSemMovimento.Checked = false then
              IND_MOV := imComDados
            else
            begin
              IND_MOV := imSemDados;
            end;
            COD_ITEM := FormatFloat('000000',
              Dados.qrySped_H010FK_PRODUTO.Value);
            Dados.qrySped_Unidade.Locate('CODIGO',
              Dados.qrySped_H010FK_UNIDADE.Value, []);
            UNID := Dados.qrySped_UnidadeUNIDADE.Value;
            QTD := Dados.qrySped_H010qtd.AsFloat;
            VL_UNIT := Dados.qrySped_H010vl_unit.AsFloat;
            VL_ITEM := Dados.qrySped_H010vl_item.AsFloat;
            IND_PROP := piInformante;
            COD_CTA := Dados.qrySped_H010cod_cta.Value;
          end;
          Dados.qrySped_H010.Next;
        end;
      end;
    end;
  end;
end;

procedure TFrmSpedSf.GeraBlocoB1;
begin
  with ACBrSpedFiscal.Bloco_1 do
  begin
    with Registro1001New do
    begin
      IND_MOV := imComDados;

      with Registro1010New do
      begin
        IND_MOV := imComDados;
        if DadosSped.qryConfig_SpedIND_EXP.IsNull then
          IND_EXP := 'N'
        else
          IND_EXP := DadosSped.qryConfig_SpedIND_EXP.Value;
        // Reg. 1100 - Ocorreu averbação (conclusão) de exportação no período:

        if DadosSped.qryconfig_Spedind_ccrf.IsNull then
          IND_CCRF := 'N'
        else
          IND_CCRF := DadosSped.qryconfig_Spedind_ccrf.Value;

        // Reg. 1200 – Existem informações acerca de créditos de ICMS a serem controlados, definidos pela Sefaz:
        if DadosSped.qryconfig_Spedind_comb.IsNull then
          IND_COMB := 'N'
        else
          IND_COMB := DadosSped.qryconfig_Spedind_comb.Value;

        IND_REST_RESSARC_COMPL_ICMS := 'N';
        // Reg. 1300 – É comercio varejista de combustíveis:

        if DadosSped.qryconfig_Spedind_usina.IsNull then
          IND_USINA := 'N'
        else
          IND_USINA := DadosSped.qryconfig_Spedind_usina.Value;

        // Reg. 1390 – Usinas de açúcar e/álcool – O estabelecimento é produtor de açúcar e/ou álcool carburante:

        if DadosSped.qryconfig_Spedind_va.IsNull then
          IND_VA := 'N'
        else
          IND_VA := DadosSped.qryconfig_Spedind_va.Value;

        // Reg. 1400 – Existem informações a serem prestadas neste registro e o registro é obrigatório em sua Unidade da Federação:
        if DadosSped.qryconfig_Spedind_ee.IsNull then
          IND_EE := 'N'
        else
          IND_EE := DadosSped.qryconfig_Spedind_ee.Value;

        // Reg. 1500 - A empresa é distribuidora de energia e ocorreu fornecimento de energia elétrica para consumidores de outra UF:
        if DadosSped.qryconfig_Spedind_cart.IsNull then
          IND_CART := 'N'
        else
          IND_CART := DadosSped.qryconfig_Spedind_cart.Value;

        // Reg. 1600 - Realizou vendas com Cartão de Crédito ou de débito:
        if DadosSped.qryconfig_Spedind_form.IsNull then
          IND_FORM := 'N'
        else
          IND_FORM := DadosSped.qryconfig_Spedind_form.Value;
        // Reg. 1700 - É obrigatório em sua unidade da federação o controle de utilização de documentos  fiscais em papel:
        if DadosSped.qryconfig_Spedind_aer.IsNull then
          IND_AER := 'N'
        else
          IND_AER := DadosSped.qryconfig_Spedind_aer.Value;
        // Reg. 1800 – A empresa prestou serviços de transporte aéreo de cargas e de passageiros:

        IND_GIAF1 := 'N';
        IND_GIAF3 := 'N';
        IND_GIAF4 := 'N';

      end;
    end;
  end;

end;

procedure TFrmSpedSf.btnExecuteClick(Sender: TObject);
begin
  try
    btnExecute.Enabled := false;
    memoError.Lines.Clear;

    GeraSped;

    if trim(memoError.Text) <> '' then
    begin
      if MessageBox(0, 'Sped está com erro!' + #13 + 'Deseja visualizar erro?',
        'Sped Fiscal', +mb_YesNo) = 6 then
      begin
        ShowMessage(memoError.Text);
      end;
    end
    else
      ShowMessage('Sped Fiscal Gerado com sucesso');
  finally
    btnExecute.Enabled := true;
  end;
end;

procedure TFrmSpedSf.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmSpedSf.cbContadorExit(Sender: TObject);
begin
  NomeCaminho;
end;

procedure TFrmSpedSf.cbEmpresaExit(Sender: TObject);
begin
  NomeCaminho;
end;

procedure TFrmSpedSf.dtFimExit(Sender: TObject);
begin
  dtIni.Date := StartOfTheMonth(dtFim.Date);
  NomeCaminho;
end;

procedure TFrmSpedSf.dtIniExit(Sender: TObject);
begin
  dtFim.Date := EndOfTheMonth(dtIni.Date);
  NomeCaminho;
end;

procedure TFrmSpedSf.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := self;
  Dados.GetComponentes;
end;

procedure TFrmSpedSf.FormCreate(Sender: TObject);
begin
  dtIni.Date := StartOfTheMonth(now);
  dtFim.Date := EndOfTheMonth(now);

  DadosSped.qryContador.Close;
  DadosSped.qryContador.Open;

  DadosSped.qryEmpresa.Close;
  DadosSped.qryEmpresa.Open;

  cbEmpresa.KeyValue := Dados.qryEmpresaCODIGO.Value;
  cbContador.KeyValue := 1;

  NomeCaminho;
end;

procedure TFrmSpedSf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F10 then
    btnExecute.Click;
  if Key = VK_ESCAPE then
    btnSair.Click;
  if Key = VK_RETURN then
    Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TFrmSpedSf.FormShow(Sender: TObject);
begin
  Dados.CriaPastas;
end;

end.
