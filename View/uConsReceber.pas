unit uConsReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math, ACBrBoleto, acbrUtil,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, ACBrBoletoConversao,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dateutils, Vcl.DBCtrls, frxClass,
  frxDBSet, frxExportPDF, Vcl.Tabs, frxExportBaseDialog,
  DBGridEh, DBCtrlsEh,
  DBLookupEh, frxExportXLS, Vcl.Imaging.pngimage, JvComponentBase, JvEnterTab, ACBrBoletoFCFortesFr, ACBrBase;

type
  TfrmConsReceber = class(TForm)
    Panel3: TPanel;
    dsCR: TDataSource;
    Panel4: TPanel;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBReceber: TfrxDBDataset;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnImp: TSpeedButton;
    frxDBEmpresa: TfrxDBDataset;
    dsEmpresa: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel6: TPanel;
    dsCRRecebimento: TDataSource;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    Panel2: TPanel;
    btnEstornar: TSpeedButton;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    btnCarne: TSpeedButton;
    btnAtualizar: TSpeedButton;
    Panel7: TPanel;
    Label14: TLabel;
    DBText11: TDBText;
    dbGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    qryPlano: TFDQuery;
    qryPlanoCODIGO: TIntegerField;
    qryPlanoDESCRICAO: TStringField;
    qryPlanoDC: TStringField;
    dsPlano: TDataSource;
    qryConta: TFDQuery;
    qryContaCODIGO: TIntegerField;
    qryContaDESCRICAO: TStringField;
    qryContaTIPO: TStringField;
    qryContaID_USUARIO: TIntegerField;
    qryContaEMPRESA: TIntegerField;
    qryContaDATA_ABERTURA: TDateField;
    qryContaLOTE: TIntegerField;
    qryContaSITUACAO: TStringField;
    dsConta: TDataSource;
    dsFPG: TDataSource;
    qryFPG: TFDQuery;
    qryFPGCODIGO: TIntegerField;
    qryFPGDESCRICAO: TStringField;
    BtnBaixar: TSpeedButton;
    btnLote: TSpeedButton;
    qryUpdCR: TFDQuery;
    ChckSeleciona: TCheckBox;
    PnRodape: TPanel;
    DBText12: TDBText;
    Label16: TLabel;
    qryClienteCODIGO: TIntegerField;
    qryClienteRAZAO: TStringField;
    qryClienteCLI: TStringField;
    btnBoleto: TSpeedButton;
    qryCRBoleto: TFDQuery;
    TabSet1: TTabSet;
    TabSet2: TTabSet;
    qryInadimplentes: TFDQuery;
    qryAtrasadas: TFDQuery;
    btnWhats: TSpeedButton;
    frxXLSExport1: TfrxXLSExport;
    Label28: TLabel;
    pnImpressao: TPanel;
    Shape2: TShape;
    Label21: TLabel;
    Image2: TImage;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    JvEnterAsTab1: TJvEnterAsTab;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    lblDescricao: TLabel;
    maskInicio: TMaskEdit;
    maskFim: TMaskEdit;
    btnFiltrar: TBitBtn;
    ChkPeriodo: TCheckBox;
    cbCliente: TDBLookupComboBox;
    edtLoc: TEdit;
    ACBrBoleto1: TACBrBoleto;
    ACBrBoletoFCFortes1: TACBrBoletoFCFortes;
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dsCRDataChange(Sender: TObject; Field: TField);
    procedure btnBaixarClick(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure btnImpClick(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure TabSet1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCarneClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure s(Sender: TObject);
    procedure cbClienteClick(Sender: TObject);
    procedure cbClienteEnter(Sender: TObject);
    procedure dbGrid1TitleClick(Column: TColumn);
    procedure dbGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGrid1DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbGrid1CellClick(Column: TColumn);
    procedure ChckSelecionaClick(Sender: TObject);
    procedure btnLoteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBoletoClick(Sender: TObject);
    procedure dbGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnWhatsClick(Sender: TObject);
  private
    procedure tamanho;
    procedure HabilitaCheck;
    procedure Excluir;
    procedure EnviarMensagem;
    procedure Estado;
    { Private declarations }
  public
    idx: Integer;
    vOrdem, vSql: string;
    procedure Filtrar;
    { Public declarations }
  end;

var
  frmConsReceber: TfrmConsReceber;

implementation

{$R *.dfm}

uses Udados, uCadReceber, uBaixaReceber, uSupervisor, uBaixaReceberLote,
  udtmCBR;

procedure TfrmConsReceber.Filtrar;
var
  parte, ordem, filtro, filtro1, filtro2, filtro3: string;
begin
  Estado;
  TThread.CreateAnonymousThread(
    procedure
    begin

      filtro := '';
      filtro1 := '';
      filtro2 := '';
      filtro3 := '';
      parte := '';
      if dados.qryEmpresaPESQUISA_POR_PARTE.AsString = 'S' then
        parte := '%';

      vSql := ' select CR.*, pessoa.razao, ved.nome as vendedor from creceber CR'
        + ' left join pessoa on pessoa.codigo=cr.fkcliente' +
        ' left join vendedores ved on ved.codigo=cr.id_vendedor' + ' where' +
        ' cr.codigo>0' + ' /*where*/' + ' /*ordem*/';

      if cbCliente.KeyValue <> null then
        if cbCliente.KeyValue <> 0 then
          filtro := ' AND CR.fkcliente=' + inttostr(cbCliente.KeyValue);

      filtro := filtro + ' and cr.fkempresa=' + dados.qryEmpresaCODIGO.AsString;

      case idx of
        1:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and cr.CODIGO = ' + edtLoc.Text;
          end;
        2:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and cr.DOC like ' +
                QuotedStr(parte + edtLoc.Text + '%');
          end;
        3:
          begin
            if ChkPeriodo.Checked then
            begin
              filtro := filtro + ' and cr.data>=' +
                QuotedStr(FormatDateTime('mm/dd/yyyy',
                strtodate(maskInicio.EditText))) + ' and cr.data<=' +
                QuotedStr(FormatDateTime('mm/dd/yyyy',
                strtodate(maskFim.EditText)));
            end;

          end;
        4:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and cr.HISTORICO like ' +
                QuotedStr(parte + edtLoc.Text + '%');
          end;
        5:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and PESSOA.RAZAO like ' +
                QuotedStr(parte + edtLoc.Text + '%');
          end;

        6:
          begin
            if ChkPeriodo.Checked then
            begin

              filtro := filtro + ' and cr.DTVENCIMENTO>=' +
                QuotedStr(FormatDateTime('mm/dd/yyyy',
                strtodate(maskInicio.EditText))) + ' and cr.DTVENCIMENTO<=' +
                QuotedStr(FormatDateTime('mm/dd/yyyy',
                strtodate(maskFim.EditText)));
            end;

          end;
        7:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and cr.VALOR >= ' +
                StringReplace(edtLoc.Text, ',', '.', []);
          end;
        8:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and cr.JUROS >= ' +
                StringReplace(edtLoc.Text, ',', '.', []);
          end;
        9:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and cr.DESCONTO >= ' +
                StringReplace(edtLoc.Text, ',', '.', []);
          end;
        10:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and cr.VRECEBIDO >= ' +
                StringReplace(edtLoc.Text, ',', '.', []);
          end;

        11:
          begin
            if ChkPeriodo.Checked then
            begin

              filtro := filtro + ' and cr.DATA_RECEBIMENTO>=' +
                QuotedStr(FormatDateTime('mm/dd/yyyy',
                strtodate(maskInicio.EditText))) + ' and cr.DATA_RECEBIMENTO<='
                + QuotedStr(FormatDateTime('mm/dd/yyyy',
                strtodate(maskFim.EditText)));
            end;
          end;

        12:
          begin
            if (trim(edtLoc.Text) <> '') then
              filtro := filtro + ' and cr.VL_RESTANTE >= ' +
                StringReplace(edtLoc.Text, ',', '.', []);
          end;

      end;

      case TabSet1.TabIndex of
        1:
          begin
            filtro2 := ' and cr.situacao<>''T''';
          end;
        2:
          begin
            filtro2 :=
              ' and cr.dtvencimento<current_date and not(cr.situacao=''T'')';
          end;
        3:
          begin
            filtro2 := ' and cr.situacao=''T''';
          end;
      end;

      case TabSet2.TabIndex of
        1:
          filtro3 := ' and cr.tipo=''T''';
        2:
          filtro3 := ' and cr.tipo=''C''';
        3:
          filtro3 := ' and cr.tipo=''R''';
        4:
          filtro3 := ' and cr.tipo=''B''';
      end;

      case idx of
        1:
          ordem := ' order by cr.CODIGO' + vOrdem;
        2:
          ordem := ' order by cr.DOC' + vOrdem;
        3:
          ordem := ' order by cr.DATA' + vOrdem + ' ,CR.CODIGO';
        4:
          ordem := ' order by cr.HISTORICO' + vOrdem;
        5:
          ordem := ' order by PESSOA.RAZAO' + vOrdem;
        6:
          ordem := ' order by cr.DTVENCIMENTO' + vOrdem + ' ,CR.CODIGO';
        7:
          ordem := ' order by CR.VALOR' + vOrdem;
        8:
          ordem := ' order by CR.JUROS' + vOrdem;
        9:
          ordem := ' order by CR.DESCONTO' + vOrdem;
        10:
          ordem := ' order by CR.VRECEBIDO' + vOrdem;
        11:
          ordem := ' order by CR.DATA_RECEBIMENTO' + vOrdem;
        12:
          ordem := ' order by CR.VL_RESTANTE' + vOrdem;

      end;
      TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          dados.qrycr.Close;
          dados.qrycr.SQL.Text := vSql;
          dados.qrycr.SQL.Text := StringReplace(dados.qrycr.SQL.Text,
            '/*where*/', filtro + filtro1 + filtro2 + filtro3 + ordem,
            [rfReplaceAll]);
          dados.qrycr.Open;
        end);

    end).Start;

end;

procedure TfrmConsReceber.btnAlterarClick(Sender: TObject);
begin

  if btnAlterar.Visible = false then
    exit;

  if dados.qrycr.IsEmpty then
    exit;

  if (dados.qrycrSITUACAO.Value = 'P') or (dados.qrycrSITUACAO.Value = 'T') then
  begin
    ShowMessage
      ('Não é permitido alterar contas baixadas Parcialmente ou Totalmente!');
    exit;
  end;

  dados.vAutorizar := true;

  try
    btnAlterar.Enabled := true;

    if not dados.eSupervisor then
    begin

      try
        frmSupervisor := TFrmSupervisor.Create(Application);
        dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;

    if dados.vAutorizar then
    begin
      try
        frmCadReceber := TfrmCadReceber.Create(Application);
        frmCadReceber.qrycr.Close;
        frmCadReceber.qrycr.Params[0].Value := dados.qrycrCODIGO.Value;
        frmCadReceber.qrycr.Open;
        frmCadReceber.qrycr.Edit;

        frmCadReceber.SpinEdit1.ReadOnly := true;

        if (dados.qryCRFK_VENDA.AsInteger > 0) or
          (dados.qryCRFK_NFE.AsInteger > 0) then
        begin
          frmCadReceber.DBEdit4.ReadOnly := true;
          frmCadReceber.DBLookupComboboxEh4.ReadOnly := true;
        end;
        frmCadReceber.ShowModal;
      finally
        frmCadReceber.DBLookupComboboxEh4.ReadOnly := false;
        frmCadReceber.DBEdit4.ReadOnly := false;
        frmCadReceber.SpinEdit1.ReadOnly := false;

        frmCadReceber.Release;

        if (idx in [3, 6]) then
          maskInicio.SetFocus
        else
          edtLoc.SetFocus;
        Filtrar;
      end;
    end;
  finally
    btnAlterar.Enabled := true;

  end;
end;

procedure TfrmConsReceber.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := dados.qrycrCODIGO.Value;
    Filtrar;
    dados.qrycr.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
    if (idx in [3, 6]) then
      maskInicio.SetFocus
    else
      edtLoc.SetFocus;
  end;

end;

procedure TfrmConsReceber.btnBaixarClick(Sender: TObject);
begin
  if dados.qrycr.IsEmpty then
  begin
    ShowMessage('Não existem contas a serem baixadas');
    exit;
  end;

  if (dados.qrycrSITUACAO.Value = 'T') then
  begin
    ShowMessage('Conta já baixada!');
    exit;
  end;
  try
    frmBaixaReceber := TfrmBaixaReceber.Create(Application);

    frmBaixaReceber.qrycr.Close;
    frmBaixaReceber.qrycr.Params[0].Value := dados.qrycrCODIGO.Value;
    frmBaixaReceber.qrycr.Open;

    frmBaixaReceber.ShowModal;
  finally
    frmBaixaReceber.Release;
    Filtrar;
  end;

end;

procedure TfrmConsReceber.btnBoletoClick(Sender: TObject);
var
  email: string;
begin

  dbGrid1.Refresh;
  dbGrid1.Repaint;

  if not btnBoleto.Visible then
    exit;

  If Application.messagebox('Tem certeza que deseja gerar boleto?',
    'Confirmação', mb_yesno + mb_iconquestion) = IDNO then
    exit;

  if not(cbCliente.KeyValue > 0) then
  begin
    ShowMessage('Selecione o Cliente!');
    cbCliente.SetFocus;
    exit;
  end;

  if dados.qrycr.IsEmpty then
  begin
    ShowMessage('Não existem contas a serem baixadas');
    exit;
  end;

  if (dados.qrycrSITUACAO.Value = 'T') then
  begin
    ShowMessage('Conta já baixada!');
    exit;
  end;

  qryCRBoleto.Close;
  qryCRBoleto.Params[0].Value := cbCliente.KeyValue;
  qryCRBoleto.Open;

  if qryCRBoleto.IsEmpty then
  begin
    ShowMessage('Clique na aba Receber e selecione as Parcelas!');
    exit;
  end;

  dtmCBR.ConfigurarBoleta;
  dtmCBR.ACBrBoleto1.ListadeBoletos.Clear;

  qryCRBoleto.First;
  while not qryCRBoleto.eof do
  begin
    dados.UpdateTipoBoleto(qryCRBoleto.FieldByName('codigo').AsInteger);
    qryCRBoleto.Next;
  end;

  qryCRBoleto.First;
  while not qryCRBoleto.eof do
  begin

    // popular a lista de boletos selecionados
    with dtmCBR.ACBrBoleto1.CriarTituloNaLista do
    begin

      // OcorrenciaOriginal.Tipo := toRemessaBaixar;

      NumeroDocumento := qryCRBoleto.FieldByName('NBOLETO').AsString;
      DataProcessamento := Now;
      DataDocumento := qryCRBoleto.FieldByName('DATA').Value;
      Vencimento := qryCRBoleto.FieldByName('DTVENCIMENTO').Value;
      ValorDocumento := qryCRBoleto.FieldByName('VALOR').Value;
      EspecieDoc := dtmCBR.qryCBR_CONFIGESPECIEDOC.Value;
      EspecieMod := dtmCBR.qryCBR_CONFIGCOBMOEDA.AsString;
      Carteira := dtmCBR.qryCBR_CONFIGCARTEIRA.AsString;
      Aceite := TACBrAceiteTitulo(atNao);
      if dtmCBR.ACBrBoleto1.Banco.Numero = 1 then
        nossonumero := Carteira + qryCRBoleto.FieldByName('NBOLETO').AsString
      else
        nossonumero := qryCRBoleto.FieldByName('NBOLETO').Value;

      Sacado.NomeSacado := qryCRBoleto.FieldByName('RAZAO').AsString;
      Sacado.CNPJCPF := qryCRBoleto.FieldByName('CNPJ').AsString;
      Sacado.Logradouro := qryCRBoleto.FieldByName('ENDERECO').AsString;
      Sacado.Numero := qryCRBoleto.FieldByName('NUMERO').AsString;;
      Sacado.Bairro := qryCRBoleto.FieldByName('BAIRRO').AsString;;
      Sacado.Cidade := qryCRBoleto.FieldByName('MUNICIPIO').AsString;;
      Sacado.UF := qryCRBoleto.FieldByName('UF').AsString;;
      Sacado.CEP := qryCRBoleto.FieldByName('CEP').AsString;;
      Sacado.Complemento := qryCRBoleto.FieldByName('COMPLEMENTO').AsString;;

      ValorDesconto := 0.00;
      ValorMoraJuros := 0.00;
      ValorAbatimento := 0.00;
      PercentualMulta := 0.00;
      DataMoraJuros := 0.0;
      DataDesconto := 0.0;
      DataAbatimento := 0.0;
      DataProtesto := 0.0;

      LocalPagamento := dtmCBR.qryCBR_CONFIGLOCALPAGTO.AsString;
      Mensagem.Text := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
      // Instrucao1         := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
      // Instrucao2         := dtmCBR.qryCBR_CONFIGINSTRUCAO2.AsString;
      // TextoLivre         := dtmCBR.qryCBR_CONFIGINSTRUCAO1.AsString;
    end;
    qryCRBoleto.Next;
  end;
  dtmCBR.ACBrBoleto1.Imprimir;

  If Application.messagebox('Deseja enviar boleto(s) para o email do cliente?',
    'Confirmação', mb_yesno + mb_iconquestion) = IDYES then
  begin
    email := InputBox('Email do Cliente', 'Email:',
      qryCRBoleto.FieldByName('email1').AsString);
    if trim(email) <> '' then
    begin
      dtmCBR.EnviarEmal(email, qryCRBoleto.FieldByName('RAZAO').AsString);
    end;
  end;

  ChckSelecionaClick(self);
end;

procedure TfrmConsReceber.Estado;
begin
  case TabSet1.TabIndex of
    1:
      begin
        btnBoleto.Visible := true;
        btnCarne.Visible := true;
      end
  else
    begin
      btnBoleto.Visible := false;
      btnCarne.Visible := false;
    end;
  end;
end;

procedure TfrmConsReceber.btnCarneClick(Sender: TObject);
begin
  if btnCarne.Visible = false then
    exit;

  if dados.qrycrSITUACAO.Value <> 'A' then
    exit;

  try
    btnCarne.Enabled := false;
    Filtrar;

    if not dados.qrycr.IsEmpty then
      pnImpressao.Visible := true;

  finally
    btnCarne.Enabled := true;

    if (idx in [3, 6]) then
      maskInicio.SetFocus
    else
      edtLoc.SetFocus;
  end;
end;

procedure TfrmConsReceber.btnEstornarClick(Sender: TObject);
begin

  if dados.vLancamentoCaixa then
  begin
    if dados.qryCRRecebimentoID_SUBCAIXA.Value <> dados.vidLote then
    begin
      ShowMessage('Recebimento não foi feita por este caixa!');
      exit;
    end;
  end;

  If Application.messagebox('Tem certeza que deseja ESTORNAR parcela recebida?',
    'Confirmação', mb_yesno + mb_iconquestion) = IDNO then
    exit;

  if not dados.qryCRRecebimento.IsEmpty then
    dados.qryCRRecebimento.Delete;
  dados.Conexao.CommitRetaining;

  dados.qrysomarec.Close;
  dados.qrysomarec.Params[0].Value := dados.qrycrCODIGO.Value;
  dados.qrysomarec.Open;

  dados.qrycr.Edit;
  dados.qryCRDATA_RECEBIMENTO.Clear;
  dados.qrycrDESCONTO.Value := dados.qrysomarecDESCONTO.AsFloat;
  dados.qrycrJUROS.Value := dados.qrysomarecJUROS.AsFloat;
  dados.qrycrVRECEBIDO.Value := dados.qrysomarecRECEBIDO.AsFloat;
  dados.qrycrVL_RESTANTE.Value := dados.qrycrVALOR.AsFloat -
    (dados.qrycrVRECEBIDO.AsFloat - dados.qrycrJUROS.AsFloat +
    dados.qrycrDESCONTO.AsFloat);
  if dados.qrycrVRECEBIDO.Value = 0 then
    dados.qrycrSITUACAO.Value := 'A';

  if (dados.qrycrVL_RESTANTE.Value > 0) and (dados.qrycrVRECEBIDO.Value > 0)
  then
    dados.qrycrSITUACAO.Value := 'P';
  dados.qrycr.Post;

  dados.Conexao.CommitRetaining;

  // btnFiltrarClick(self);

  ShowMessage('Estorno de título efetuado com sucesso!');

end;

procedure TfrmConsReceber.Excluir;
begin
  if dados.qrycr.IsEmpty then
    exit;

  if dados.vLancamentoCaixa then
    exit;

  if not dados.qryCRRecebimento.IsEmpty then
    raise Exception.Create('Não é possivel excluir conta baixada!');

  if dados.qrycr.FieldByName('fk_venda').AsInteger > 1 then
    raise Exception.Create
      ('Lançamento do Contas a Receber foi feito pela Venda!' + sLineBreak +
      'Não pode ser excluido por aqui!');

  if not dados.qryCRRecebimento.IsEmpty then
    raise Exception.Create('Existe parcela recebida!' + #13 +
      'Não é possivel excluir título!');

  dados.vAutorizar := true;
  try
    frmSupervisor := TFrmSupervisor.Create(Application);
    dados.vAutorizar := false;
    frmSupervisor.ShowModal;
  finally
    frmSupervisor.Release;
    if (idx in [3, 6]) then
      maskInicio.SetFocus
    else
      edtLoc.SetFocus;
  end;

  if not dados.vAutorizar then
  begin
    exit;
  end;

  If Application.messagebox('Tem certeza que deseja excluir Lançamento?',
    'Confirmação', mb_yesno + mb_iconquestion) = IDYES then
  begin
    dados.qrycr.Delete;
  end;

end;

procedure TfrmConsReceber.btnFiltrarClick(Sender: TObject);
begin
  try
    btnFiltrar.Enabled := false;
    Filtrar;
    edtLoc.SetFocus;
  finally
    btnFiltrar.Enabled := true;
  end;
end;

procedure TfrmConsReceber.btnImpClick(Sender: TObject);
begin
  try

    if btnImp.Visible = false then
      exit;

    btnImp.Enabled := false;
    Filtrar;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelReceber.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
    if (idx in [3, 6]) then
      maskInicio.SetFocus
    else
      edtLoc.SetFocus;
  end;
end;

procedure TfrmConsReceber.HabilitaCheck;
begin
  case TabSet1.TabIndex of
    1:
      begin
        dbGrid1.Columns[0].Visible := true;
        dbGrid1.Columns[0].Title.Caption := ' ';
        ChckSeleciona.Visible := true;
        btnWhats.Visible := false;
        btnLote.Visible := true;
      end;
    2:
      begin
        dbGrid1.Columns[0].Visible := true;
        dbGrid1.Columns[0].Title.Caption := ' ';
        ChckSeleciona.Visible := true;
        btnLote.Visible := true;
        btnWhats.Visible := true;
      end
  else
    begin
      dbGrid1.Columns[0].Visible := false;
      dbGrid1.Columns[0].Title.Caption := ' ';
      ChckSeleciona.Visible := false;
      btnLote.Visible := false;
      btnWhats.Visible := false
    end;

  end;
end;

procedure TfrmConsReceber.btnLoteClick(Sender: TObject);
var
  Total_C_Juros, Total_S_Juros: Extended;
begin

  if not(cbCliente.KeyValue > 0) then
  begin
    ShowMessage('Selecione o Cliente!');
    cbCliente.SetFocus;
    exit;
  end;

  if dados.qrycr.IsEmpty then
  begin
    ShowMessage('Não existem contas a serem baixadas');
    exit;
  end;

  if (dados.qrycrSITUACAO.Value = 'T') then
  begin
    ShowMessage('Conta já baixada!');
    exit;
  end;
  try
    frmBaixaReceberLote := TfrmBaixaReceberLote.Create(Application);
    frmBaixaReceberLote.idCliente := cbCliente.KeyValue;
    frmBaixaReceberLote.qryCRClie.Close;
    frmBaixaReceberLote.qryCRClie.Params[0].Value := cbCliente.KeyValue;
    frmBaixaReceberLote.qryCRClie.Open;

    frmBaixaReceberLote.qryCRBaixa.Close;
    frmBaixaReceberLote.qryCRBaixa.Params[0].Value := cbCliente.KeyValue;
    frmBaixaReceberLote.qryCRBaixa.Open;

    frmBaixaReceberLote.qryCRBaixa.First;
    while not frmBaixaReceberLote.qryCRBaixa.eof do
    begin
      frmBaixaReceberLote.qryCRBaixa.Next;
    end;

    if frmBaixaReceberLote.qryCRBaixa.RecordCount > 1 then
    begin

      if not frmBaixaReceberLote.qryCRBaixa.IsEmpty then
      begin

        frmBaixaReceberLote.qryBaixaLote.Close;
        frmBaixaReceberLote.qryBaixaLote.Params[0].Value := 0;
        frmBaixaReceberLote.qryBaixaLote.Open;
        frmBaixaReceberLote.qryBaixaLote.Insert;

        frmBaixaReceberLote.qryBaixaLoteFK_EMPRESA.AsFloat :=
          dados.qryEmpresaCODIGO.Value;

        frmBaixaReceberLote.qryBaixaLoteFK_USUARIO.AsFloat := dados.idUsuario;

        frmBaixaReceberLote.qryBaixaLoteCODIGO.Value :=
          dados.Numerador('CRRECEBIMENTO_LOTE', 'CODIGO', 'N', '', '');
        frmBaixaReceberLote.qryBaixaLoteDATA.Value := date;

        frmBaixaReceberLote.qryBaixaLoteSALDO.AsFloat :=
          simpleroundto(frmBaixaReceberLote.qryCRBaixaTOTAL_S_JUROS.Value, -2);

        frmBaixaReceberLote.qryBaixaLoteJUROS_VALOR.AsFloat :=
          simpleroundto(frmBaixaReceberLote.qryCRBaixaTOTAL_JUROS.Value, -2);

        frmBaixaReceberLote.qryBaixaLoteTOTAL_C_JUROS.AsFloat :=
          simpleroundto(frmBaixaReceberLote.qryCRBaixaTOTAL_C_JUROS.Value, -2);

        if frmBaixaReceberLote.qryCRBaixaTOTAL_S_JUROS.Value > 0 then
        begin

          Total_C_Juros :=
            simpleroundto(frmBaixaReceberLote.qryCRBaixaTOTAL_C_JUROS.
            Value, -2);

          Total_S_Juros :=
            simpleroundto(frmBaixaReceberLote.qryCRBaixaTOTAL_S_JUROS.
            Value, -2);

          frmBaixaReceberLote.qryBaixaLoteJUROS_PERC.AsFloat :=
            100 - ((Total_S_Juros / Total_C_Juros) * 100);

          frmBaixaReceberLote.qryBaixaLoteJUROS_PERC.AsFloat :=
            simpleroundto(frmBaixaReceberLote.qryBaixaLoteJUROS_PERC.
            AsFloat, -2);

          if frmBaixaReceberLote.qryBaixaLoteJUROS_PERC.AsFloat < 0 then
            frmBaixaReceberLote.qryBaixaLoteJUROS_PERC.AsFloat := 0

        end;

        frmBaixaReceberLote.qryBaixaLoteDESCONTO_PERC.AsFloat := 0;
        frmBaixaReceberLote.qryBaixaLoteDESCONTO_VALOR.AsFloat := 0;

        frmBaixaReceberLote.qryBaixaLoteJUROS_PERC.AsFloat :=
          simpleroundto(frmBaixaReceberLote.qryBaixaLoteJUROS_PERC.AsFloat, -2);

        frmBaixaReceberLote.qryBaixaLoteTOTAL_FINAL.AsFloat :=
          simpleroundto(frmBaixaReceberLote.qryBaixaLoteTOTAL_C_JUROS.AsFloat -
          frmBaixaReceberLote.qryBaixaLoteDESCONTO_VALOR.AsFloat, -2);

        frmBaixaReceberLote.qryCRClie.RecordCount;
        if frmBaixaReceberLote.qryCRClie.RecordCount > 1 then
        begin
          frmBaixaReceberLote.qryBaixaLoteTOTAL_RECEBIDO.AsFloat :=
            simpleroundto(frmBaixaReceberLote.qryBaixaLoteTOTAL_FINAL.
            AsFloat, -2);
          frmBaixaReceberLote.DBEdit8.ReadOnly := true;
        end
        else
        begin
          frmBaixaReceberLote.qryBaixaLoteTOTAL_RECEBIDO.AsFloat := 0;
          frmBaixaReceberLote.DBEdit8.ReadOnly := false;
        end;

        frmBaixaReceberLote.DBEdit3.ReadOnly := false;
        frmBaixaReceberLote.DBEdit4.ReadOnly := false;
        if dados.qryEmpresaJUROS_DIA.AsFloat > 0 then
        begin
          frmBaixaReceberLote.DBEdit3.ReadOnly := true;
          frmBaixaReceberLote.DBEdit4.ReadOnly := true;
        end;

        frmBaixaReceberLote.ShowModal;
      end;
    end
    else
      ShowMessage('Não é possivel fazer baixa em lote para apenas um registro!'
        + sLineBreak + 'Faça a baixa individual!');

  finally
    frmBaixaReceberLote.Release;
    Filtrar;
  end;

end;

procedure TfrmConsReceber.btnNovoClick(Sender: TObject);
begin
  if btnNovo.Visible = false then
    exit;

  try
    frmCadReceber := TfrmCadReceber.Create(Application);
    btnNovo.Enabled := false;
    frmCadReceber.qrycr.Close;
    frmCadReceber.qrycr.Params[0].Value := -1;
    frmCadReceber.qrycr.Open;

    frmCadReceber.qrycr.Insert;
    frmCadReceber.qrycrCODIGO.Value := dados.Numerador('CRECEBER', 'CODIGO',
      'N', '', '');
    frmCadReceber.qrycrDATA.Value := date;
    frmCadReceber.qrycrFKEMPRESA.Value := dados.qryEmpresaCODIGO.Value;
    frmCadReceber.qryCRREMESSA.Value := 'N';
    frmCadReceber.qryCRREMESSA_REENVIAR.Value := 'S';
    frmCadReceber.qrycrFKCONTA.Value := 0;
    frmCadReceber.qrycrVALOR.Value := 0;
    frmCadReceber.qrycrDESCONTO.Value := 0;
    frmCadReceber.qrycrJUROS.Value := 0;
    frmCadReceber.qrycrVRECEBIDO.Value := 0;
    frmCadReceber.qrycrVL_RESTANTE.Value := 0;
    frmCadReceber.qrycrSITUACAO.Value := 'A';
    frmCadReceber.qrycrDOC.Value := '';
    frmCadReceber.ShowModal;
  finally
    frmCadReceber.Release;
    btnNovo.Enabled := true;
    if (idx in [3, 6]) then
      maskInicio.SetFocus
    else
      edtLoc.SetFocus;

    Filtrar;

  end;
end;

procedure TfrmConsReceber.Button1Click(Sender: TObject);
begin

  dados.qrycr.Filtered := false;
  dados.qrycr.Filter := 'FLAG=''S''';
  dados.qrycr.Filtered := true;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\Carne.fr3');
  frxReport.ShowReport;
  dados.qrycr.Filtered := false;
end;

procedure TfrmConsReceber.Button2Click(Sender: TObject);
begin

  dados.qrycr.Filtered := false;
  dados.qrycr.Filter := 'FLAG=''S''';
  dados.qrycr.Filtered := true;

  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
    '\Relatorio\CarneBobina.fr3');
  frxReport.ShowReport;
  dados.qrycr.Filtered := false;

end;

procedure TfrmConsReceber.Button3Click(Sender: TObject);
begin
  pnImpressao.Visible := false;
end;

procedure TfrmConsReceber.cbClienteClick(Sender: TObject);
begin

  dados.limpaFlagCR(cbCliente.KeyValue);

  dbGrid1.Refresh;
  dbGrid1.Repaint;

  Filtrar;
end;

procedure TfrmConsReceber.cbClienteEnter(Sender: TObject);
begin
  TDBLookupComboBox(Sender).DropDown;
end;

procedure TfrmConsReceber.ChckSelecionaClick(Sender: TObject);
begin
  try
    dados.qrycr.DisableControls;
    dados.qrycr.First;
    while not dados.qrycr.eof do
    begin

      if ChckSeleciona.Checked then
      begin

        dados.qryExecute.Close;
        dados.qryExecute.SQL.Text :=
          'update creceber set FLAG=''S'' where codigo=:codigo';
        dados.qryExecute.Params[0].Value := dados.qrycrCODIGO.Value;
        dados.qryExecute.ExecSQL;
        dados.Conexao.CommitRetaining;
      end;

      if not ChckSeleciona.Checked then
      begin

        dados.qryExecute.Close;
        dados.qryExecute.SQL.Text :=
          'update creceber set FLAG=''N'' where codigo=:codigo';
        dados.qryExecute.Params[0].Value := dados.qrycrCODIGO.Value;
        dados.qryExecute.ExecSQL;
        dados.Conexao.CommitRetaining;
      end;
      dados.qrycr.Next;
    end;
  finally
    dados.qrycr.EnableControls;
  end;

  btnFiltrar.Click;
end;

procedure TfrmConsReceber.s(Sender: TObject);
begin
  btnFiltrarClick(self);
end;

procedure TfrmConsReceber.EnviarMensagem;
var
  DDD, FFone, Parcelas, Mensagem: String;
begin

  if cbCliente.KeyValue = 0 then
  begin
    qryInadimplentes.Close;
    qryInadimplentes.Params[0].Value := 1;
    qryInadimplentes.Params[1].Value := 99999;
    qryInadimplentes.Open;
  end
  else
  begin
    qryInadimplentes.Close;
    qryInadimplentes.Params[0].Value := cbCliente.KeyValue;
    qryInadimplentes.Params[1].Value := cbCliente.KeyValue;
    qryInadimplentes.Open;
  end;

  if qryInadimplentes.IsEmpty then
    raise Exception.Create('Selecione as parcelas!');

  qryInadimplentes.First;
  while not qryInadimplentes.eof do
  begin
    qryAtrasadas.Close;
    qryAtrasadas.Params[0].Value := qryInadimplentes.FieldByName('codigo')
      .AsInteger;
    qryAtrasadas.Open;
    Parcelas := '';

    while not qryAtrasadas.eof do
    begin

      if Parcelas = '' then
        Parcelas := FormatDateTime('DD/MM/YYYY',
          qryAtrasadas.FieldByName('DTVENCIMENTO').AsDateTime) + '  ' +
          FormatFloat('R$ ,0.00',
          qryAtrasadas.FieldByName('VL_RESTANTE').AsFloat)
      else
        Parcelas := Parcelas + '\n' + FormatDateTime('DD/MM/YYYY',
          qryAtrasadas.FieldByName('DTVENCIMENTO').AsDateTime) + '  ' +
          FormatFloat('R$ ,0.00',
          qryAtrasadas.FieldByName('VL_RESTANTE').AsFloat);
      qryAtrasadas.Next;

    end;

    if not qryInadimplentes.FieldByName('whatsapp').IsNull then
    begin

      FFone := qryInadimplentes.FieldByName('whatsapp').Value;

      if Length(FFone) = 11 then
      begin
        dados.InsereMensagemZap('', FFone, Parcelas,
          dados.qryEmpresaMENSAGEM_COBRANCA.Value,
          qryInadimplentes.FieldByName('FANTASIA').Value,
          dados.qryEmpresa.FieldByName('FANTASIA').Value, 'RECEBER');

      end;

    end;
    qryInadimplentes.Next;
  end;
  ShowMessage('Contas enviadas para lista de cobrança!');
end;

procedure TfrmConsReceber.btnWhatsClick(Sender: TObject);
begin
  try
    try
      btnWhats.Enabled := false;
      EnviarMensagem;

    finally
      btnWhats.Enabled := true;
    end;
  except
    on e: Exception do
      raise Exception.Create('Erro:' + sLineBreak + e.Message + sLineBreak +
        'Entre em contato com o suporte e peça atualização para o whatsapp!');
  end;
end;

procedure TfrmConsReceber.dbGrid1CellClick(Column: TColumn);
begin
  if dados.qrycrVL_RESTANTE.Value > 0 then
  begin
    if dados.qryCRFLAG.Value = 'S' then
    begin
      dados.qrycr.Edit;
      dados.qryCRFLAG.Value := 'N';
      if (dados.qryCRFK_USUARIO.Value = dados.idUsuario) then
        dados.qryCRFK_USUARIO.Clear;
      dados.qrycr.Post;
      dados.Conexao.CommitRetaining;
    end
    else
    begin
      dados.qrycr.Edit;
      dados.qryCRFLAG.Value := 'S';
      dados.qryCRFK_USUARIO.Value := dados.idUsuario;
      dados.qrycr.Post;
      dados.Conexao.CommitRetaining;
    end;
  end;
  dados.Conexao.CommitRetaining;
end;

procedure TfrmConsReceber.dbGrid1DblClick(Sender: TObject);
begin
  if idx > 0 then
    btnAlterarClick(self);
end;

procedure TfrmConsReceber.dbGrid1DrawColumnCell(Sender: TObject;
const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  iCheck: Integer;
  rRect: TRect;
begin

  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    dbGrid1.Canvas.Font.Style := [fsbold];
  end
  else
  begin
    dbGrid1.Canvas.Font.Style := [];
  end;

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  // Muda cor da fonte da grid ************************************************

  dbGrid1.Canvas.Font.Color := clBlack;

  if (dados.qrycrDTVENCIMENTO.Value < date) and
    (dados.qrycrSITUACAO.Value <> 'T') then
  begin
    dbGrid1.Canvas.Font.Color := clRed;
  end;
  if (dados.qrycrSITUACAO.Value = 'T') then
  begin
    dbGrid1.Canvas.Font.Color := clGreen;
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  // Desenha um checkbox no dbgrid ************************************************

  if Column.FieldName = 'FLAG' then
  begin
    dbGrid1.Canvas.FillRect(Rect);
    iCheck := 0;

    if dados.qryCRFLAG.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;

    rRect := Rect;
    InflateRect(rRect, -2, -2);
    DrawFrameControl(dbGrid1.Canvas.Handle, rRect, DFC_BUTTON,
      DFCS_BUTTONCHECK or iCheck);

  end;
end;

procedure TfrmConsReceber.dbGrid1KeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_DELETE then
    Excluir;

end;

procedure TfrmConsReceber.dbGrid1TitleClick(Column: TColumn);
var
  i: Integer;
begin
  edtLoc.Clear;

  if idx = Column.Index then
  begin
    if vOrdem = ' ASC' then
      vOrdem := ' DESC'
    else
      vOrdem := ' ASC';
  end
  else
    vOrdem := ' ASC';

  idx := Column.Index;
  dbGrid1.Columns[1].Title.Caption := 'Número';
  dbGrid1.Columns[2].Title.Caption := 'Doc';
  dbGrid1.Columns[3].Title.Caption := 'Emissão';
  dbGrid1.Columns[4].Title.Caption := 'Histórico';
  dbGrid1.Columns[5].Title.Caption := 'Cliente';
  dbGrid1.Columns[6].Title.Caption := 'Vencimento';
  dbGrid1.Columns[7].Title.Caption := 'Valor';
  dbGrid1.Columns[9].Title.Caption := 'Desconto';
  dbGrid1.Columns[9].Title.Caption := 'Juros';
  dbGrid1.Columns[10].Title.Caption := 'Vl.Recebido';
  dbGrid1.Columns[11].Title.Caption := 'Recebido Em';
  dbGrid1.Columns[12].Title.Caption := 'Saldo';

  lblDescricao.Caption := 'Localizar <<' + dbGrid1.Columns[idx]
    .Title.Caption + '>>';

  dbGrid1.Columns[idx].Title.Caption := '>>' + dbGrid1.Columns[idx]
    .Title.Caption;

  if not(idx in [3, 6, 11]) then
    edtLoc.SetFocus
  else
    maskInicio.SetFocus;

  for i := 0 to dbGrid1.Columns.Count - 1 do
    dbGrid1.Columns[i].Title.Font.Style := [];

  dbGrid1.Columns[idx].Title.Font.Style := [fsbold];

  Filtrar;
end;

procedure TfrmConsReceber.DBGrid2DrawColumnCell(Sender: TObject;
const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if odd((Sender as TDBGrid).DataSource.DataSet.RecNo) then
    (Sender as TDBGrid).Canvas.Brush.Color := $00F1ECE7
  else
    (Sender as TDBGrid).Canvas.Brush.Color := clWhite;

  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    dbGrid1.Canvas.Font.Style := [fsbold];
  end
  else
  begin
    dbGrid1.Canvas.Font.Style := [];
  end;

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmConsReceber.DBGrid2KeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TfrmConsReceber.dsCRDataChange(Sender: TObject; Field: TField);
begin

  if dados.qrycr.Active then
  begin
    if dados.qrycrSITUACAO.Value = 'A' then
    begin // aberto
      BtnBaixar.Enabled := true;
    end;

    if (dados.qrycrSITUACAO.Value = 'P') then
    begin // parcial
      btnEstornar.Enabled := true;
      BtnBaixar.Enabled := true;

    end;

    if (dados.qrycrSITUACAO.Value = 'T') then
    begin // total
      BtnBaixar.Enabled := false;
    end;

  end;

end;

procedure TfrmConsReceber.edtLocChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmConsReceber.edtLocKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = vk_up then
    dados.qrycr.Prior;
  if Key = VK_DOWN then
    dados.qrycr.Next;

end;

procedure TfrmConsReceber.edtLocKeyPress(Sender: TObject; var Key: Char);
begin
  if (idx in [1, 3, 6]) then
  begin
    if not(Key in ['0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;
  if (idx in [7 .. 11]) then
  begin
    if not(Key in [',', '0' .. '9', #8, #9, #13, #27]) then
      Key := #0;
  end;

end;

procedure TfrmConsReceber.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;


procedure TfrmConsReceber.FormCreate(Sender: TObject);
begin
  vOrdem := ' ASC';


  maskInicio.EditText := datetostr(StartOfTheMonth(date));
  maskFim.EditText := datetostr(date);
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmConsReceber.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin

  if Key = vk_f2 then
    btnNovo.Click;

  if Key = vk_f3 then
    btnAlterar.Click;

  if Key = vk_f4 then
    btnImp.Click;

  if Key = vk_f5 then
    btnAtualizar.Click;

  if Key = vk_f6 then
    btnCarneClick(self);

  if Key = vk_f7 then
    btnBoletoClick(self);

  if Key = vk_f8 then
    BtnBaixar.Click;

  if Key = vk_f9 then
    btnLote.Click;

  if Key = vk_f10 then
    btnWhats.Click;

  if Key = vk_f11 then
    btnEstornar.Click;

  if Key = vk_f12 then
    cbCliente.SetFocus;

end;

procedure TfrmConsReceber.tamanho;
begin
  dbGrid1.Columns[1].Width := round(Screen.Width * 0.055);
  dbGrid1.Columns[2].Width := round(Screen.Width * 0.055);
  dbGrid1.Columns[3].Width := round(Screen.Width * 0.060);
  dbGrid1.Columns[4].Width := round(Screen.Width * 0.15);
  dbGrid1.Columns[5].Width := round(Screen.Width * 0.20);
  dbGrid1.Columns[6].Width := round(Screen.Width * 0.060);
  dbGrid1.Columns[7].Width := round(Screen.Width * 0.055);
  dbGrid1.Columns[8].Width := round(Screen.Width * 0.055);
  dbGrid1.Columns[9].Width := round(Screen.Width * 0.055);
  dbGrid1.Columns[10].Width := round(Screen.Width * 0.055);
  dbGrid1.Columns[11].Width := round(Screen.Width * 0.060);
  dbGrid1.Columns[12].Width := round(Screen.Width * 0.055);
end;

procedure TfrmConsReceber.FormShow(Sender: TObject);
begin
  BtnBaixar.Caption := 'F8' + sLineBreak + 'Baixar';
  btnLote.Caption := ' F9 Baixa' + sLineBreak + 'Lote';
  btnWhats.Caption := 'F10' + sLineBreak + 'Cobrança';
  btnEstornar.Caption := 'F11' + sLineBreak + 'Estornar';
  dbGrid1TitleClick(dbGrid1.Columns[1]);
  HabilitaCheck;

  if dados.vLancamentoCaixa then
  begin
    btnNovo.Visible := false;
    btnAlterar.Visible := false;
    btnImp.Visible := false;
  end
  else
  begin
    btnNovo.Visible := true;
    btnAlterar.Visible := true;
    btnImp.Visible := true;
  end;

  tamanho;
  edtLoc.SetFocus;

  qryCliente.Close;
  qryCliente.Open;
  if not qryCliente.IsEmpty then
    cbCliente.KeyValue := qryClienteCODIGO.Value;

end;

procedure TfrmConsReceber.frxReportGetValue(const VarName: string;
var Value: Variant);
var
  filtro: string;
begin

  if VarName = 'PARAMETRO' then
  begin
    Value := ' SITUAÇÃO:' + TabSet1.Tabs[TabSet1.TabIndex] + filtro +
      ' | ORDENADO: ' + copy(dbGrid1.Columns[idx].Title.Caption, 3, 100000);
  end;

end;

procedure TfrmConsReceber.TabSet1Click(Sender: TObject);
begin
  Filtrar;
  HabilitaCheck;
end;

end.

