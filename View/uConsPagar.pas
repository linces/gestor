unit uConsPagar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dateutils, Vcl.DBCtrls, frxClass,
  frxDBSet, frxExportPDF, Vcl.Tabs, frxExportBaseDialog, JvComponentBase,
  JvEnterTab;

type
  TfrmConsPagar = class(TForm)
    Panel3: TPanel;
    dsCP: TDataSource;
    Panel4: TPanel;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBPagar: TfrxDBDataset;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnImp: TSpeedButton;
    frxDBEmpresa: TfrxDBDataset;
    dsEmpresa: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
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
    Bevel1: TBevel;
    Panel6: TPanel;
    btnBaixar: TSpeedButton;
    dsCPPagamento: TDataSource;
    qryFornecedor: TFDQuery;
    dsFornecedor: TDataSource;
    btnAtualizar: TSpeedButton;
    Panel8: TPanel;
    TabSet1: TTabSet;
    Panel7: TPanel;
    Label14: TLabel;
    DBText11: TDBText;
    btnBaixaLote: TSpeedButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    ChckSeleciona: TCheckBox;
    DBText12: TDBText;
    Label15: TLabel;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorRAZAO: TStringField;
    qryFornecedorFORN: TStringField;
    Label28: TLabel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lblDescricao: TLabel;
    maskInicio: TMaskEdit;
    maskFim: TMaskEdit;
    btnFiltrar: TBitBtn;
    ChkPeriodo: TCheckBox;
    edtLoc: TEdit;
    cbFornecedor: TDBLookupComboBox;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dsCPDataChange(Sender: TObject; Field: TField);
    procedure btnBaixarClick(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure frxReportGetValue(const VarName: string; var Value: Variant);
    procedure btnImpClick(Sender: TObject);
    procedure edtLocChange(Sender: TObject);
    procedure TabSet1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtLocKeyPress(Sender: TObject; var Key: Char);
    procedure edtLocKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbFornecedorClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btnBaixaLoteClick(Sender: TObject);
    procedure ChckSelecionaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbFornecedorEnter(Sender: TObject);
  private
    procedure tamanho;
    procedure HabilitaCheck;
    { Private declarations }
  public
    idx: Integer;
    vOrdem, vSql: string;
    procedure Filtrar;
    { Public declarations }
  end;

var
  frmConsPagar: TfrmConsPagar;

implementation

{$R *.dfm}

uses Udados, uCadPagar, uBaixaPagar, uPrincipal, uSupervisor, uBaixaPagarLote;

procedure TfrmConsPagar.Filtrar;
var
  parte, ordem, filtro, filtro1, filtro2: string;
begin
  filtro := '';
  filtro1 := '';
  filtro2 := '';
  parte := '';

  if Dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
    parte := '%';

  vSql := ' select Cp.*, pessoa.razao from cpagar CP  ' +
    ' left join pessoa on pessoa.codigo=cp.fkfornece ' + ' where ' +
    ' cp.codigo>0' + ' /*where*/' + ' /*ordem*/';

  if cbFornecedor.KeyValue <> null then
    if cbFornecedor.KeyValue <> 0 then
      filtro := ' AND Cp.fkfornece=' + inttostr(cbFornecedor.KeyValue);

  filtro := filtro + ' and cp.fkempresa=' + Dados.qryEmpresaCODIGO.AsString;

  case idx of
    0 .. 1:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cp.CODIGO like ' +
            QuotedStr(edtLoc.Text + '%');
      end;

    2:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cp.DOC like ' +
            QuotedStr(parte + edtLoc.Text + '%');
      end;
    3:
      begin
        if ChkPeriodo.Checked then
        begin

          filtro := filtro + ' and cp.data>=' +
            QuotedStr(FormatDateTime('mm/dd/yyyy',
            strtodate(maskInicio.EditText))) + ' and cp.data<=' +
            QuotedStr(FormatDateTime('mm/dd/yyyy',
            strtodate(maskFim.EditText)));
        end;

      end;

    4:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cp.HISTORICO like ' +
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

          filtro := filtro + ' and cp.DTVENCIMENTO>=' +
            QuotedStr(FormatDateTime('mm/dd/yyyy',
            strtodate(maskInicio.EditText))) + ' and cp.DTVENCIMENTO<=' +
            QuotedStr(FormatDateTime('mm/dd/yyyy',
            strtodate(maskFim.EditText)));
        end;

      end;
    7:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cp.VALOR >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;
    8:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cp.JUROS >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;
    9:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cp.DESCONTO >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;
    10:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cp.VLPAGO >= ' + StringReplace(edtLoc.Text,
            ',', '.', []);
      end;
    11:
      begin
        if ChkPeriodo.Checked then
        begin

          filtro := filtro + ' and cp.DATA_PAGAMENTO>=' +
            QuotedStr(FormatDateTime('mm/dd/yyyy',
            strtodate(maskInicio.EditText))) + ' and cp.DATA_PAGAMENTO<=' +
            QuotedStr(FormatDateTime('mm/dd/yyyy',
            strtodate(maskFim.EditText)));
        end;

      end;
    12:
      begin
        if (trim(edtLoc.Text) <> '') then
          filtro := filtro + ' and cp.VL_RESTANTE >= ' +
            StringReplace(edtLoc.Text, ',', '.', []);
      end;

  end;

  case TabSet1.TabIndex of
    1:
      filtro2 := ' and CP.situacao<>''T''';
    2:
      filtro2 := ' and CP.dtvencimento<current_date and CP.situacao<>''T''';
    3:
      filtro2 := ' and CP.situacao=''T''';
  end;

  case idx of
    0 .. 1:
      ordem := ' order by CP.CODIGO' + vOrdem;
    2:
      ordem := ' order by CP.DOC' + vOrdem;
    3:
      ordem := ' order by CP.DATA' + vOrdem + ' ,CP.CODIGO';
    4:
      ordem := ' order by CP.HISTORICO' + vOrdem;
    5:
      ordem := ' order by PESSOA.RAZAO' + vOrdem;
    6:
      ordem := ' order by CP.DTVENCIMENTO' + vOrdem + ' ,CP.CODIGO';
    7:
      ordem := ' order by CP.VALOR' + vOrdem;
    8:
      ordem := ' order by CP.JUROS' + vOrdem;
    9:
      ordem := ' order by CP.DESCONTO' + vOrdem;
    10:
      ordem := ' order by CP.VLPAGO' + vOrdem;
    11:
      ordem := ' order by CP.DATA_PAGAMENTO' + vOrdem;
    12:
      ordem := ' order by CP.VL_RESTANTE' + vOrdem;

  end;

  Dados.qryCP.Close;

  Dados.qryCP.SQL.Text := vSql;
  Dados.qryCP.SQL.Text := StringReplace(Dados.qryCP.SQL.Text, '/*where*/',
    filtro + filtro1 + filtro2 + ordem, [rfReplaceAll]);
  Dados.qryCP.Open;

end;

procedure TfrmConsPagar.btnAlterarClick(Sender: TObject);
begin
  if (Dados.qryCP.IsEmpty) then
  begin
    exit;
  end;

  if (Dados.qryCPSITUACAO.Value = 'P') or (Dados.qryCPSITUACAO.Value = 'T') then
  begin
    ShowMessage
      ('Não é permitido alterar contas baixadas Parcialmente ou Totalmente!');
    exit;
  end;

  Dados.vAutorizar := true;

  try

    if not Dados.eSupervisor then
    begin
      try
        btnAlterar.Enabled := false;
        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
      end;
    end;

    if Dados.vAutorizar then
    begin
      try
        frmCadPagar := TfrmCadPagar.Create(Application);
        frmCadPagar.qryCP.Close;
        frmCadPagar.qryCP.Params[0].Value := Dados.qryCPCODIGO.Value;
        frmCadPagar.qryCP.Open;
        frmCadPagar.qryCP.Edit;
        frmCadPagar.SpinEdit1.ReadOnly := true;
        frmCadPagar.SpinEdit1.Value := 1;

        if (Dados.qryCPFK_COMPRA.Value > 0) then
        begin
          frmCadPagar.DBEdit4.ReadOnly := true;
          frmCadPagar.DBLookupComboboxEh4.ReadOnly := true;
        end;
        frmCadPagar.ShowModal;
      finally
        frmCadPagar.DBLookupComboboxEh4.ReadOnly := false;
        frmCadPagar.DBEdit4.ReadOnly := false;
        frmCadPagar.SpinEdit1.ReadOnly := false;
        frmCadPagar.Release;
        if (idx in [3, 6]) then
          maskInicio.SetFocus
        else
          edtLoc.SetFocus;
        btnAtualizarClick(Self);
      end;
    end;
  finally

    btnAlterar.Enabled := true;
  end;
end;

procedure TfrmConsPagar.btnAtualizarClick(Sender: TObject);
var
  codigo: Integer;
begin
  try
    btnAtualizar.Enabled := false;
    codigo := Dados.qryCPCODIGO.Value;
    Filtrar;
    Dados.qryCP.Locate('codigo', codigo, []);
  finally
    btnAtualizar.Enabled := true;
    if (idx in [3, 6]) then
      maskInicio.SetFocus
    else
      edtLoc.SetFocus;
  end;
end;

procedure TfrmConsPagar.btnBaixaLoteClick(Sender: TObject);
begin

  if not(cbFornecedor.KeyValue > 0) then
  begin
    ShowMessage('Selecione o fornecedor!');
    cbFornecedor.SetFocus;
    exit;
  end;

  if Dados.qryCP.IsEmpty then
  begin
    ShowMessage('Não existem contas a serem baixadas');
    exit;
  end;

  if (Dados.qryCPSITUACAO.Value = 'T') then
  begin
    ShowMessage('Conta já baixada!');
    exit;
  end;
  try

    frmBaixaPagarLote := TfrmBaixaPagarLote.Create(Application);

    frmBaixaPagarLote.idfornecedor := cbFornecedor.KeyValue;
    frmBaixaPagarLote.qryCPForn.Close;
    frmBaixaPagarLote.qryCPForn.Params[0].Value := cbFornecedor.KeyValue;
    frmBaixaPagarLote.qryCPForn.Open;

    frmBaixaPagarLote.qryCPBaixa.Close;
    frmBaixaPagarLote.qryCPBaixa.Params[0].Value := cbFornecedor.KeyValue;
    frmBaixaPagarLote.qryCPBaixa.Open;

    frmBaixaPagarLote.qryCPBaixa.First;

    while not frmBaixaPagarLote.qryCPBaixa.eof do
    begin
      frmBaixaPagarLote.qryCPBaixa.Next;
    end;

    if frmBaixaPagarLote.qryCPBaixa.RecordCount > 1 then
    begin

      if not frmBaixaPagarLote.qryCPBaixa.IsEmpty then
      begin

        frmBaixaPagarLote.qryBaixaLote.Close;
        frmBaixaPagarLote.qryBaixaLote.Params[0].Value := 0;
        frmBaixaPagarLote.qryBaixaLote.Open;

        frmBaixaPagarLote.qryBaixaLote.Insert;

        frmBaixaPagarLote.qryBaixaLoteFK_EMPRESA.AsFloat :=
          Dados.qryEmpresaCODIGO.Value;

        frmBaixaPagarLote.qryBaixaLoteFK_USUARIO.AsFloat := Dados.idUsuario;

        frmBaixaPagarLote.qryBaixaLoteCODIGO.Value :=
          Dados.Numerador('CPPAGAMENTO_LOTE', 'CODIGO', 'N', '', '');
        frmBaixaPagarLote.qryBaixaLoteDATA.Value := date;

        frmBaixaPagarLote.qryBaixaLoteSALDO.AsFloat :=
          SimpleRoundTo(frmBaixaPagarLote.qryCPBaixaTOTAL_S_JUROS.Value, -2);

        frmBaixaPagarLote.qryBaixaLoteJUROS_VALOR.AsFloat := 0;

        frmBaixaPagarLote.qryBaixaLoteTOTAL_C_JUROS.AsFloat :=
          SimpleRoundTo(frmBaixaPagarLote.qryCPBaixaTOTAL_S_JUROS.Value, -2);

        frmBaixaPagarLote.qryBaixaLoteJUROS_PERC.AsFloat := 0;

        frmBaixaPagarLote.qryBaixaLoteDESCONTO_PERC.AsFloat := 0;
        frmBaixaPagarLote.qryBaixaLoteDESCONTO_VALOR.AsFloat := 0;

        frmBaixaPagarLote.qryBaixaLoteJUROS_PERC.AsFloat :=
          SimpleRoundTo(frmBaixaPagarLote.qryBaixaLoteJUROS_PERC.AsFloat, -2);

        if frmBaixaPagarLote.qryBaixaLoteJUROS_PERC.AsFloat < 0 then
          frmBaixaPagarLote.qryBaixaLoteJUROS_PERC.AsFloat := 0;

        frmBaixaPagarLote.qryBaixaLoteTOTAL_FINAL.AsFloat :=
          SimpleRoundTo(frmBaixaPagarLote.qryBaixaLoteTOTAL_C_JUROS.AsFloat, -2)
          - SimpleRoundTo(frmBaixaPagarLote.qryBaixaLoteDESCONTO_VALOR.
          AsFloat, -2);

        frmBaixaPagarLote.qryCPForn.RecordCount;
        if frmBaixaPagarLote.qryCPForn.RecordCount > 1 then
        begin
          frmBaixaPagarLote.qryBaixaLoteTOTAL_PAGO.AsFloat := 0;
          frmBaixaPagarLote.DBEdit8.ReadOnly := true;
        end
        else
        begin
          frmBaixaPagarLote.qryBaixaLoteTOTAL_PAGO.AsFloat := 0;
          frmBaixaPagarLote.DBEdit8.ReadOnly := false;
        end;

        frmBaixaPagarLote.ShowModal;
      end;
    end
    else
      ShowMessage('Não é possivel fazer baixa em lote para apenas um registro!'
        + sLineBreak + 'Faça a baixa individual!');
  finally
    frmBaixaPagarLote.Release;
    Filtrar;
  end;
end;

procedure TfrmConsPagar.btnBaixarClick(Sender: TObject);
begin
  if Dados.qryCP.IsEmpty then
  begin
    ShowMessage('Não existem contas a serem baixadas');
    exit;
  end;

  if (Dados.qryCPSITUACAO.Value = 'T') then
  begin
    ShowMessage('Conta já baixada!');
    exit;
  end;
  try
    frmBaixaPagar := TfrmBaixaPagar.Create(Application);
    frmBaixaPagar.qryCP.Close;
    frmBaixaPagar.qryCP.Params[0].Value := Dados.qryCPCODIGO.Value;
    frmBaixaPagar.qryCP.Open;
    frmBaixaPagar.ShowModal;
  finally
    frmBaixaPagar.Release;
    btnAtualizar.Click;
  end;

end;

procedure TfrmConsPagar.btnEstornarClick(Sender: TObject);
begin

  If Application.messagebox('Tem certeza que deseja ESTORNAR parcela paga?',
    'Confirmação', mb_yesno + mb_iconquestion) = IDNO then
    exit;

  if not(Dados.qryCPPagamento.IsEmpty) then
    Dados.qryCPPagamento.Delete;
  Dados.Conexao.CommitRetaining;

  Dados.qrySomaPaga.Close;
  Dados.qrySomaPaga.Params[0].Value := Dados.qryCPCODIGO.Value;
  Dados.qrySomaPaga.Open;
  Dados.qryCP.Edit;
  Dados.qryCPDESCONTO.Value := Dados.qrySomaPagaDESCONTO.AsFloat;
  Dados.qryCPJUROS.Value := Dados.qrySomaPagaJUROS.AsFloat;
  Dados.qryCPVLPAGO.Value := Dados.qrySomaPagaRECEBIDO.AsFloat;
  Dados.qryCPVL_RESTANTE.Value := Dados.qryCPVALOR.Value -
    (Dados.qryCPVLPAGO.Value - Dados.qryCPJUROS.Value +
    Dados.qryCPDESCONTO.Value);
  if Dados.qryCPVLPAGO.Value = 0 then
    Dados.qryCPSITUACAO.Value := 'A';

  if (Dados.qryCPVL_RESTANTE.Value > 0) and (Dados.qryCPVLPAGO.Value > 0) then
    Dados.qryCPSITUACAO.Value := 'P';
  Dados.qryCP.Post;

  Dados.Conexao.CommitRetaining;

  // btnFiltrarClick(self);

  ShowMessage('Estorno de título efetuado com sucesso!');

end;

procedure TfrmConsPagar.btnFiltrarClick(Sender: TObject);
begin
  try
    btnFiltrar.Enabled := false;
    Filtrar;
    edtLoc.SetFocus;
  finally
    btnFiltrar.Enabled := true;
  end;
end;

procedure TfrmConsPagar.btnImpClick(Sender: TObject);
begin
  try
    Filtrar;
    btnImp.Enabled := false;
    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) +
      '\Relatorio\RelPagar.fr3');
    frxReport.ShowReport;
  finally
    btnImp.Enabled := true;
    if (idx in [3, 6]) then
      maskInicio.SetFocus
    else
      edtLoc.SetFocus;
  end;
end;

procedure TfrmConsPagar.btnNovoClick(Sender: TObject);
begin
  try
    btnNovo.Enabled := false;
    frmCadPagar := TfrmCadPagar.Create(Application);

    frmCadPagar.qryCP.Close;
    frmCadPagar.qryCP.Params[0].Value := -1;
    frmCadPagar.qryCP.Open;

    frmCadPagar.qryCP.Insert;
    frmCadPagar.qryCPCODIGO.Value := Dados.Numerador('CPAGAR', 'CODIGO',
      'N', '', '');
    frmCadPagar.qryCPDATA.Value := date;
    frmCadPagar.qryCPFKEMPRESA.Value := Dados.qryEmpresaCODIGO.Value;
    frmCadPagar.qryCPVALOR.Value := 0;
    frmCadPagar.qryCPDESCONTO.Value := 0;
    frmCadPagar.qryCPJUROS.Value := 0;
    frmCadPagar.qryCPVLPAGO.Value := 0;
    frmCadPagar.qryCPVL_RESTANTE.Value := 0;
    frmCadPagar.qryCPSITUACAO.Value := 'A';
    frmCadPagar.qryCPDOC.Value := '';
    frmCadPagar.SpinEdit1.Value := 1;
    frmCadPagar.ShowModal;
  finally
    frmCadPagar.Release;
    btnNovo.Enabled := true;

    if (idx in [3, 6]) then
      maskInicio.SetFocus
    else
      edtLoc.SetFocus;

    btnAtualizar.Click;
  end;
end;

procedure TfrmConsPagar.cbFornecedorClick(Sender: TObject);
begin
  if cbFornecedor.KeyValue > 0 then
    Dados.limpaFlagCP(cbFornecedor.KeyValue);
  btnFiltrar.Click;
end;

procedure TfrmConsPagar.cbFornecedorEnter(Sender: TObject);
begin
  cbFornecedor.DropDown;
end;

procedure TfrmConsPagar.ChckSelecionaClick(Sender: TObject);
begin
  if ChckSeleciona.Checked then
  begin
    Dados.qryCP.First;
    while not Dados.qryCP.eof do
    begin
      Dados.qryCP.Edit;
      Dados.qryCPFLAG.Value := 'S';
      Dados.qryCPFK_USUARIO.Value := Dados.idUsuario;
      Dados.qryCP.Post;
      Dados.qryCP.Next;
    end;
  end;
  if not ChckSeleciona.Checked then
  begin
    Dados.qryCP.First;
    while not Dados.qryCP.eof do
    begin
      Dados.qryCP.Edit;
      Dados.qryCPFLAG.Value := 'N';
      Dados.qryCPFK_USUARIO.Clear;
      Dados.qryCP.Post;
      Dados.qryCP.Next;
    end;
  end;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmConsPagar.DBGrid1CellClick(Column: TColumn);
begin
  if Dados.qryCPVL_RESTANTE.Value > 0 then
  begin
    if Dados.qryCPFLAG.Value = 'S' then
    begin
      Dados.qryCP.Edit;
      Dados.qryCPFLAG.Value := 'N';
      Dados.qryCPFK_USUARIO.Clear;
      Dados.qryCP.Post;
    end
    else
    begin
      Dados.qryCP.Edit;
      Dados.qryCPFLAG.Value := 'S';
      Dados.qryCPFK_USUARIO.Value := Dados.idUsuario;
      Dados.qryCP.Post;
    end;
  end;
  Dados.Conexao.CommitRetaining;
end;

procedure TfrmConsPagar.DBGrid1DblClick(Sender: TObject);
begin
  if idx > 0 then
    btnAlterarClick(Self);
end;

procedure TfrmConsPagar.HabilitaCheck;
begin
  case TabSet1.TabIndex of
    1 .. 2:
      begin
        DBGrid1.Columns[0].Visible := true;
        DBGrid1.Columns[0].Title.Caption := ' ';
        ChckSeleciona.Visible := true;
        btnBaixaLote.Visible := true;
      end
  else
    begin
      DBGrid1.Columns[0].Visible := false;
      DBGrid1.Columns[0].Title.Caption := ' ';
      ChckSeleciona.Visible := false;
      btnBaixaLote.Visible := false;
    end;

  end;
end;

procedure TfrmConsPagar.DBGrid1DrawColumnCell(Sender: TObject;
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
    DBGrid1.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid1.Canvas.Font.Style := [];

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  DBGrid1.Canvas.Font.Color := clBlack;
  if (Dados.qryCPDTVENCIMENTO.Value < date) and
    (Dados.qryCPSITUACAO.Value <> 'T') then
  begin
    DBGrid1.Canvas.Font.Color := clRed;
  end;
  if (Dados.qryCPSITUACAO.Value = 'T') then
  begin
    DBGrid1.Canvas.Font.Color := clGreen;
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  // Desenha um checkbox no dbgrid ************************************************

  if Column.FieldName = 'FLAG' then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    iCheck := 0;
    if Dados.qryCPFLAG.AsString = 'S' then
      iCheck := DFCS_CHECKED
    else
      iCheck := 0;

    rRect := Rect;
    InflateRect(rRect, -2, -2);
    DrawFrameControl(DBGrid1.Canvas.Handle, rRect, DFC_BUTTON,
      DFCS_BUTTONCHECK or iCheck);

  end;

end;

procedure TfrmConsPagar.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    if (Dados.qryCP.IsEmpty) then
    begin
      exit;
    end;

    if Dados.qryCP.FieldByName('FK_COMPRA').AsInteger > 1 then
      raise Exception.Create
        ('Lançamento do Contas a Pagar foi feito pela compra!' + sLineBreak +
        'Não pode ser excluido por aqui!');

    if not Dados.qryCPPagamento.IsEmpty then
    begin
      ShowMessage('Existe parcela paga!' + #13 +
        'Não é possivel excluir título!');
      exit;
    end;

    Dados.vAutorizar := true;
    if not Dados.eSupervisor then
    begin
      try

        frmSupervisor := TFrmSupervisor.Create(Application);
        Dados.vAutorizar := false;
        frmSupervisor.ShowModal;
      finally
        frmSupervisor.Release;
        if (idx in [3, 6]) then
          maskInicio.SetFocus
        else
          edtLoc.SetFocus;
      end;
    end;

    if Dados.vAutorizar then
    begin
      If Application.messagebox('Tem certeza que deseja excluir Lançamento?',
        'Confirmação', mb_yesno + mb_iconquestion) = idyes then
      begin
        Dados.qryCP.Delete;
      end;
    end;
  end;

end;

procedure TfrmConsPagar.DBGrid1TitleClick(Column: TColumn);
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
  DBGrid1.Columns[0].Title.Caption := '...';
  DBGrid1.Columns[1].Title.Caption := 'Número';
  DBGrid1.Columns[2].Title.Caption := 'Doc';
  DBGrid1.Columns[3].Title.Caption := 'Emissão';
  DBGrid1.Columns[4].Title.Caption := 'Histórico';
  DBGrid1.Columns[5].Title.Caption := 'Fornecedor';
  DBGrid1.Columns[6].Title.Caption := 'Vencimento';
  DBGrid1.Columns[7].Title.Caption := 'Valor';
  DBGrid1.Columns[8].Title.Caption := 'Desconto';
  DBGrid1.Columns[9].Title.Caption := 'Juros';
  DBGrid1.Columns[10].Title.Caption := 'Vl.Pago';
  DBGrid1.Columns[11].Title.Caption := 'Pago Em';
  DBGrid1.Columns[12].Title.Caption := 'Saldo';

  lblDescricao.Caption := 'Localizar <<' + DBGrid1.Columns[idx]
    .Title.Caption + '>>';

  DBGrid1.Columns[idx].Title.Caption := '>>' + DBGrid1.Columns[idx]
    .Title.Caption;

  if not(idx in [3, 6, 11]) then
    edtLoc.SetFocus
  else
    maskInicio.SetFocus;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];

  DBGrid1.Columns[idx].Title.Font.Style := [fsbold];

  Filtrar;
end;

procedure TfrmConsPagar.DBGrid2DrawColumnCell(Sender: TObject;
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
    DBGrid2.Canvas.Font.Style := [fsbold];
  end
  else
    DBGrid2.Canvas.Font.Style := [];

  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmConsPagar.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TfrmConsPagar.dsCPDataChange(Sender: TObject; Field: TField);
begin

  if Dados.qryCP.Active then
  begin
    if Dados.qryCPSITUACAO.Value = 'A' then
    begin // aberto
      // btnEstornar.Enabled := false;
      btnBaixar.Enabled := true;
    end;

    if (Dados.qryCPSITUACAO.Value = 'P') then
    begin // parcial
      btnBaixar.Enabled := true;

    end;

    if (Dados.qryCPSITUACAO.Value = 'T') then
    begin // total
      btnBaixar.Enabled := false;
    end;

  end;

end;

procedure TfrmConsPagar.edtLocChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmConsPagar.edtLocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    Dados.qryCP.Prior;
  if Key = VK_DOWN then
    Dados.qryCP.Next;

end;

procedure TfrmConsPagar.edtLocKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmConsPagar.FormActivate(Sender: TObject);
begin
  Dados.vForm := nil;
  Dados.vForm := Self;
  Dados.GetComponentes;
end;


procedure TfrmConsPagar.FormCreate(Sender: TObject);
begin
  vOrdem := ' ASC';


  PageControl1.ActivePageIndex := 0;
  maskInicio.Text := datetostr(StartOfTheMonth(date));
  maskFim.Text := datetostr(date);
end;

procedure TfrmConsPagar.FormKeyDown(Sender: TObject; var Key: Word;
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
    edtLoc.SetFocus;
  if Key = vk_f7 then
    if PageControl1.ActivePageIndex = 0 then
      btnBaixar.Click;
  if Key = vk_f8 then
    if PageControl1.ActivePageIndex = 1 then
      btnEstornar.Click;
  if Key = vk_f9 then
    btnFiltrar.Click;
  if Key = vk_f12 then
    cbFornecedor.SetFocus;
end;

procedure TfrmConsPagar.tamanho;
begin
  DBGrid1.Columns[1].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[2].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[3].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[4].Width := round(Screen.Width * 0.18);
  DBGrid1.Columns[5].Width := round(Screen.Width * 0.20);
  DBGrid1.Columns[6].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[7].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[8].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[9].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[10].Width := round(Screen.Width * 0.05);
  DBGrid1.Columns[11].Width := round(Screen.Width * 0.06);
  DBGrid1.Columns[11].Width := round(Screen.Width * 0.05);

end;

procedure TfrmConsPagar.FormShow(Sender: TObject);
begin

  btnBaixar.Caption := 'F7' + sLineBreak + 'Baixar';
  btnBaixaLote.Caption := 'F8' + sLineBreak + 'Baixar' + sLineBreak + 'Lote';

  HabilitaCheck;

  qryFornecedor.Close;
  qryFornecedor.Open;

  cbFornecedor.KeyValue := qryFornecedorCODIGO.Value;

  DBGrid1TitleClick(DBGrid1.Columns[1]);

  tamanho;

  edtLoc.SetFocus;

end;

procedure TfrmConsPagar.frxReportGetValue(const VarName: string;
  var Value: Variant);
var
  filtro: string;
begin

  if VarName = 'PARAMETRO' then
  begin
    Value := ' SITUAÇÃO:' + TabSet1.Tabs[TabSet1.TabIndex] + filtro +
      ' | ORDENADO: ' + copy(DBGrid1.Columns[idx].Title.Caption, 3, 100000);
  end;

end;

procedure TfrmConsPagar.TabSet1Click(Sender: TObject);
begin
  Filtrar;
  HabilitaCheck;
end;

end.
