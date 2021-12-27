unit uCadOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, math,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Vcl.Mask,
  Vcl.DBCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ACBrBase, ACBrEnterTab, frxClass,
  frxDBSet, frxExportPDF, Vcl.Tabs, JvComponentBase, JvEnterTab;

type
  TfrmCadOS = class(TForm)
    Panel1: TPanel;
    btnFinalizar: TSpeedButton;
    btnSair: TSpeedButton;
    Panel2: TPanel;
    qrySoma: TFDQuery;
    qryProd: TFDQuery;
    qryProdCODIGO: TIntegerField;
    qryProdDESCRICAO: TStringField;
    qryProdCODBARRA: TStringField;
    qryProdREFERENCIA: TStringField;
    dsProd: TDataSource;
    qryProdUNIDADE: TStringField;
    qrAtendente: TFDQuery;
    qryProdLOCALIZACAO: TStringField;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label11: TLabel;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    DBText2: TDBText;
    qryTecnico: TFDQuery;
    qryTecnicoCODIGO: TIntegerField;
    qryTecnicoFANTASIA: TStringField;
    qrAtendenteCODIGO: TIntegerField;
    qrAtendenteFANTASIA: TStringField;
    qrySomaPecas: TFDQuery;
    Label19: TLabel;
    DBText6: TDBText;
    Label22: TLabel;
    DBText7: TDBText;
    Label6: TLabel;
    DBText3: TDBText;
    qrySomaServivos: TFDQuery;
    qryProdSERVICO: TStringField;
    qryOS_Master: TFDQuery;
    qryOS_Detalhe: TFDQuery;
    qryOS_MasterCODIGO: TIntegerField;
    qryOS_MasterDATA_INICIO: TDateField;
    qryOS_MasterHORA_INICIO: TTimeField;
    qryOS_MasterPREVISAO_ENTREGA: TDateField;
    qryOS_MasterHORA_TERMINO: TTimeField;
    qryOS_MasterDATA_ENTREGA: TDateField;
    qryOS_MasterHORA_ENTREGA: TTimeField;
    qryOS_MasterFK_ATENDENDE: TIntegerField;
    qryOS_MasterPROBLEMA: TMemoField;
    qryOS_MasterOBSERVACOES: TMemoField;
    qryOS_MasterFK_EMPRESA: TIntegerField;
    qryOS_MasterFK_USUARIO: TIntegerField;
    qryOS_MasterDOCUMENTO: TStringField;
    qryOS_MasterNOME: TStringField;
    qryOS_MasterFONE1: TStringField;
    qryOS_MasterFONE2: TStringField;
    qryOS_MasterSITUACAO: TStringField;
    qryOS_MasterNUMERO_SERIE: TStringField;
    qryOS_MasterDESCRICAO: TStringField;
    qryOS_MasterMODELO: TStringField;
    qryOS_MasterMARCA: TStringField;
    qryOS_MasterANO: TIntegerField;
    qryOS_MasterPLACA: TStringField;
    qryOS_MasterENDERECO: TStringField;
    qryOS_MasterBAIRRO: TStringField;
    qryOS_MasterCIDADE: TStringField;
    qryOS_MasterUF: TStringField;
    qryOS_DetalheCODIGO: TIntegerField;
    qryOS_DetalheFK_OS_MASTER: TIntegerField;
    qryOS_DetalheFK_FUNCIONARIO: TIntegerField;
    qryOS_DetalheFK_PRODUTO: TIntegerField;
    qryOS_DetalheDATA_INICIO: TDateField;
    qryOS_DetalheHORA_INICIO: TTimeField;
    qryOS_DetalheDATA_TERMINO: TDateField;
    qryOS_DetalheHORA_TERMINO: TTimeField;
    qryOS_DetalheDISCRIMINACAO: TStringField;
    qryOS_DetalheFK_USUARIO: TIntegerField;
    qryOS_DetalheFK_EMPRESA: TIntegerField;
    qryOS_DetalheTIPO: TStringField;
    qryOS_DetalheSITUACAO: TStringField;
    dsDetalhe: TDataSource;
    dsMaster: TDataSource;
    dsEmpresa: TDataSource;
    dsAtendente: TDataSource;
    qryOS_DetalheVIRTUAL_DESCRICAO: TStringField;
    qryOS_MasterVIRTUAL_SITUACAO: TStringField;
    qryOS_DetalheVIRTUAL_SERVICOS: TStringField;
    qryOS_DetalheVIRTUAL_TECNICO: TStringField;
    qryOS_MasterDATA_TERMINO: TDateField;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label34: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label31: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit15: TDBEdit;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    TabSheet4: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    TabSheet2: TTabSheet;
    DBMemoEh2: TDBMemoEh;
    TabSheet1: TTabSheet;
    DBMemoEh1: TDBMemoEh;
    qryOS_MasterDATA_EMISSAO: TDateField;
    btnGravar: TSpeedButton;
    qryOS_MasterVIRTUAL_EMPRESA: TStringField;
    qryOS_MasterKM: TFMTBCDField;
    qryOS_MasterNUMERO: TStringField;
    qryProdPR_VENDA: TFMTBCDField;
    qryProdPR_CUSTO: TFMTBCDField;
    qryOS_MasterSUBTOTAL: TFMTBCDField;
    qryOS_MasterSUBTOTAL_PECAS: TFMTBCDField;
    qryOS_MasterSUBTOTAL_SERVICOS: TFMTBCDField;
    qryOS_MasterVL_DESC_PECAS: TFMTBCDField;
    qryOS_MasterVL_DESC_SERVICOS: TFMTBCDField;
    qryOS_MasterDESC_PERC_PECAS: TFMTBCDField;
    qryOS_MasterDESC_PERC_SERVICOS: TFMTBCDField;
    qryOS_MasterTOTAL_SERVICOS: TFMTBCDField;
    qryOS_MasterTOTAL_PRODUTOS: TFMTBCDField;
    qryOS_MasterTOTAL_GERAL: TFMTBCDField;
    qryOS_DetalheQTD: TFMTBCDField;
    qryOS_DetalhePRECO: TFMTBCDField;
    qryOS_DetalheTOTAL: TFMTBCDField;
    qrySomaSUBTOTAL: TFMTBCDField;
    qrySomaPecasSUBTOTAL: TFMTBCDField;
    qrySomaServivosSUBTOTAL: TFMTBCDField;
    qryOS_MasterFK_CLIENTE: TIntegerField;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    qryOS_MasterVIRTUAL_CLIENTE: TStringField;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    edtProduto: TEdit;
    btnPessoas: TSpeedButton;
    btnProdutos: TSpeedButton;
    qryClienteCODIGO: TIntegerField;
    qryClienteRAZAO: TStringField;
    qryClienteCELULAR1: TStringField;
    qryClienteIE: TStringField;
    qryClienteCNPJ: TStringField;
    qryProdQTD_ATUAL: TFMTBCDField;
    pnPessoa: TPanel;
    Label3: TLabel;
    DBEdit27: TDBEdit;
    DBGridPessooa: TDBGridEh;
    Label37: TLabel;
    DBEdit29: TDBEdit;
    DBEdit28: TDBEdit;
    Label36: TLabel;
    TabControl1: TTabControl;
    DBGridEh2: TDBGridEh;
    Panel3: TPanel;
    btnAbrir: TBitBtn;
    btnFechar: TBitBtn;
    JvEnterAsTab1: TJvEnterAsTab;
    qryOS_DetalheFK_GRADE: TIntegerField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qryItensBeforeOpen(DataSet: TDataSet);
    procedure qryItensNewRecord(DataSet: TDataSet);
    procedure qryOS_MasterAfterPost(DataSet: TDataSet);
    procedure qryItensBeforeInsert(DataSet: TDataSet);
    procedure qryItensAfterPost(DataSet: TDataSet);
    procedure cbEmpresaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure qryOS_MasterCalcFields(DataSet: TDataSet);
    procedure qryPessoa_CobrancaAfterPost(DataSet: TDataSet);
    procedure qryPessoa_entregaAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qryOS_DetalheBeforePost(DataSet: TDataSet);
    procedure qryOS_DetalheAfterDelete(DataSet: TDataSet);
    procedure qryOS_DetalheQTDChange(Sender: TField);
    procedure qryOS_MasterAfterDelete(DataSet: TDataSet);
    procedure qryOS_MasterDESC_PERC_PECASValidate(Sender: TField);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure qryOS_DetalheFK_PRODUTOValidate(Sender: TField);
    procedure BtnAbrirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure qryOS_DetalheNewRecord(DataSet: TDataSet);
    procedure qryOS_DetalheAfterPost(DataSet: TDataSet);
    procedure dsDetalheDataChange(Sender: TObject; Field: TField);
    procedure qryOS_DetalheBeforeInsert(DataSet: TDataSet);
    procedure qryOS_MasterAfterOpen(DataSet: TDataSet);
    procedure PageControl2Change(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure qryOS_DetalheBeforeDelete(DataSet: TDataSet);
    procedure qryOS_DetalheBeforeEdit(DataSet: TDataSet);
    procedure qryOS_DetalheQTDValidate(Sender: TField);
    procedure DBLookupComboboxEh2KeyPress(Sender: TObject; var Key: Char);
    procedure qryOS_MasterBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnPessoasClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure DBEdit27Change(Sender: TObject);
    procedure pnPessoaExit(Sender: TObject);
    procedure DBGridPessooaDblClick(Sender: TObject);
    procedure DBGridPessooaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2Enter(Sender: TObject);
    procedure DBGridEh2Exit(Sender: TObject);
    procedure DBGridEh1Enter(Sender: TObject);
    procedure DBGridEh1Exit(Sender: TObject);
    procedure DBGridEh2ColEnter(Sender: TObject);
    procedure DBGridEh2Columns1UpdateData(Sender: TObject; var Text: string;
      var Value: Variant; var UseText, Handled: Boolean);
    procedure DBEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabControl1Change(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2ColExit(Sender: TObject);
    procedure edtProdutoEnter(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure qryOS_DetalheAfterInsert(DataSet: TDataSet);
    procedure qryOS_DetalheAfterEdit(DataSet: TDataSet);
  private
    FPodeAlterar: Boolean;
    QtdAnterior: extended;
    ProdutoAnterior: Integer;
    VerificaEstoque: Boolean;
    vletras: string[50];
    procedure CalculaTotais;
    procedure CalculaItem;
    procedure Abre_OS_Detalhe;
    procedure InsereItem;
    procedure GetCliente;
    procedure FiltraOS;
    procedure ChamaGrade;
    procedure AtualizaProdutoGrade(aGrade: Integer; aPreco: extended);
    { Private declarations }
  public
    vPessoa: String;
    { Public declarations }
  end;

var
  frmCadOS: TfrmCadOS;

implementation

{$R *.dfm}

uses Udados, uCadPessoa, uCadProduto, uDMEstoque, uGradeOS;

procedure TfrmCadOS.AtualizaProdutoGrade(aGrade: Integer; aPreco: extended);
begin
  if not(qryOS_Detalhe.State in dsEditModes) then
    qryOS_Detalhe.Edit;
  qryOS_DetalheFK_GRADE.Value := aGrade;
  qryOS_DetalhePRECO.AsFloat := aPreco;
  qryOS_DetalheTOTAL.AsFloat := qryOS_DetalhePRECO.AsFloat *
    qryOS_DetalheQTD.AsFloat;
end;

procedure TfrmCadOS.ChamaGrade;
var
  qryPesquisa: TFDQuery;
  eGrade: Boolean;
begin
  try
    qryPesquisa := TFDQuery.Create(self);
    qryPesquisa.Connection := dados.Conexao;
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Text :=
      ' select grade from produto where codigo=:codigo and grade=''S''';
    qryPesquisa.Params[0].Value := qryOS_DetalheFK_PRODUTO.AsInteger;
    qryPesquisa.Open;

    eGrade := qryPesquisa.FieldByName('GRADE').AsString = 'S';

    if eGrade then
    begin

      try
        FrmGradeOS := TFrmGradeOS.Create(Application);
        FrmGradeOS.AbreGrade(qryOS_DetalheFK_PRODUTO.AsInteger);
        FrmGradeOS.idGrade := 0;
        FrmGradeOS.showmodal;
      finally
        if FrmGradeOS.idGrade > 0 then
          AtualizaProdutoGrade(FrmGradeOS.idGrade, FrmGradeOS.aPreco);
        FrmGradeOS.Release;
      end;

    end;

  finally
    qryPesquisa.Free;
  end;

end;

procedure TfrmCadOS.CalculaItem;
begin
  qryOS_DetalheTOTAL.Value := qryOS_DetalhePRECO.AsFloat *
    qryOS_DetalheQTD.AsFloat;
end;

procedure TfrmCadOS.BtnAbrirClick(Sender: TObject);
begin
  if not btnAbrir.Enabled then
    exit;
  if qryOS_DetalheTIPO.Value <> 'S' then
    exit;

  if qryOS_DetalheSITUACAO.IsNull then
  begin
    If Application.messagebox('Tem certeza que Iniciar Serviço?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idno then
      exit;
    qryOS_Detalhe.Edit;
    qryOS_DetalheSITUACAO.Value := 'A';
    qryOS_DetalheDATA_INICIO.Value := Date;
    qryOS_DetalheHORA_INICIO.Value := Now;
    qryOS_Detalhe.Post;

    Application.ProcessMessages;
    ShowMessage('Serviço Iniciado com Sucesso!');
  end;

  if qryOS_DetalheSITUACAO.Value = 'F' then
  begin
    If Application.messagebox('Tem certeza que Reiniciar Serviço?',
      'Confirmação', mb_yesno + mb_iconquestion) = idno then
      exit;
    qryOS_Detalhe.Edit;
    qryOS_DetalheSITUACAO.Value := 'A';
    qryOS_Detalhe.Post;

    Application.ProcessMessages;
    ShowMessage('Serviço Reiniciado com Sucesso!');
  end;

end;

procedure TfrmCadOS.btnFecharClick(Sender: TObject);
begin
  if not btnFechar.Enabled then
    exit;

  if qryOS_DetalheTIPO.Value <> 'S' then
    exit;

  If Application.messagebox('Tem certeza que Finalizar Serviço?', 'Confirmação',
    mb_yesno + mb_iconquestion) = idno then
    exit;
  qryOS_Detalhe.Edit;
  qryOS_DetalheSITUACAO.Value := 'F';
  qryOS_DetalheDATA_TERMINO.Value := Date;
  qryOS_DetalheHORA_TERMINO.Value := Now;
  qryOS_Detalhe.Post;

  Application.ProcessMessages;
  ShowMessage('Serviço Finalizado com Sucesso!');

end;

procedure TfrmCadOS.btnFinalizarClick(Sender: TObject);
begin

  try
    btnFinalizar.Enabled := false;
    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Clear;
    dados.qryConsulta.SQL.add('select codigo from os_detalhe');
    dados.qryConsulta.SQL.add('where');
    dados.qryConsulta.SQL.add('fk_OS_MASTER=:ID');
    dados.qryConsulta.Params[0].Value := qryOS_MasterCODIGO.Value;
    dados.qryConsulta.Open;

    if dados.qryConsulta.IsEmpty then
    begin
      ShowMessage('Informe os Itens da OS!');
      exit;
    end;

    If Application.messagebox('Tem certeza que FINALIZAR OS?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idno then
      exit;

    if not(qryOS_Master.State in dsEditModes) then
      qryOS_Master.Edit;
    qryOS_MasterDATA_TERMINO.AsDateTime := Date;
    qryOS_MasterHORA_TERMINO.AsDateTime := time;
    qryOS_MasterSITUACAO.Value := 'F';
    qryOS_Master.Post;

    DMEstoque.EstoqueGradeOS(qryOS_MasterCODIGO.Value, 'S');

  finally
    VerificaEstoque := true;
    btnFinalizar.Enabled := true;
  end;

  Close;

end;

procedure TfrmCadOS.btnGravarClick(Sender: TObject);
begin
  if qryOS_Master.State in dsEditModes then
  begin
    If Application.messagebox('Deseja salvar OS?', 'Confirmação',
      mb_yesno + mb_iconquestion) = idyes then
    begin
      qryOS_Master.Post;
    end;
  end;
  ShowMessage('OS salva com sucesso!');
end;

procedure TfrmCadOS.btnPessoasClick(Sender: TObject);
begin
  try
    btnPessoas.Enabled := false;
    frmCadPessoa := TfrmCadPessoa.Create(Application);
    if Not dados.qryPessoas.Active then
      dados.qryPessoas.Open;
    dados.qryPessoas.Insert;
    frmCadPessoa.showmodal;
  finally
    frmCadPessoa.Release;
    btnPessoas.Enabled := true;

    qryCliente.Close;
    qryCliente.Params[0].AsString := '%';
    qryCliente.Params[1].AsString := '%';
    qryCliente.Open;

    qrAtendente.Close;
    qrAtendente.Open;

    qryTecnico.Close;
    qryTecnico.Open;

  end;
end;

procedure TfrmCadOS.btnProdutosClick(Sender: TObject);
var
  idProduto: Integer;
begin

  try
    FrmCadProduto := TFrmCadProduto.Create(Application);

    FrmCadProduto.qryProdutos.Close;
    FrmCadProduto.qryProdutos.Params[0].Value := -1;
    FrmCadProduto.qryProdutos.Open;

    FrmCadProduto.qryProdutos.Insert;
    FrmCadProduto.showmodal;

  finally
    FrmCadProduto.Release;

    qryProd.Close;
    qryProd.Open;

  end;

end;

procedure TfrmCadOS.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadOS.FormActivate(Sender: TObject);
begin
  dados.vForm := nil;
  dados.vForm := self;
  dados.GetComponentes;
end;

procedure TfrmCadOS.FormCreate(Sender: TObject);
begin
  VerificaEstoque := true;

  if not(dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S') then
  begin
    DBGridEh2.Columns[1].FieldName := 'VIRTUAL_DESCRICAO';
    DBGridEh2.Columns[0].ReadOnly := false;
  end
  else
  begin
    DBGridEh2.Columns[1].FieldName := 'DISCRIMINACAO';
    DBGridEh2.Columns[0].ReadOnly := true;
  end;

  qryProd.Close;
  qryProd.Open;

  dados.qryPesqEmp.Close;
  dados.qryPesqEmp.Open;

  vletras := ''; // pesquisa parte

end;

procedure TfrmCadOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_f2:
      begin
        btnGravarClick(self);
        exit;
      end;

    vk_f3:
      begin
        btnFinalizarClick(self);
        exit;;
      end;

    vk_f4:
      begin
        btnProdutosClick(self);
        exit;;
      end;

    vk_f5:
      begin
        btnPessoasClick(self);
        exit;;
      end;

    vk_f6:
      begin
        BtnAbrirClick(self);
        exit;;
      end;

    vk_f11:
      begin
        edtProduto.SetFocus;
        exit;;
      end;

    vk_f7:
      begin
        btnFecharClick(self);
        exit;;
      end;
    VK_ESCAPE:
      begin
        if not(qryOS_Detalhe.State in dsEditModes) then
          btnSairClick(self);
      end;
    vk_delete:
      begin
        if Application.messagebox('Deseja Excluir Item?', 'Confirmação',
          mb_yesno) = mrYes then
          qryOS_Detalhe.delete;
        dados.Conexao.CommitRetaining;
        exit;
      end;
  end;

end;

procedure TfrmCadOS.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if FPodeAlterar then
  begin

    Key := UpCase(Key); // pesquisa parcial

    if (dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S') then
    begin

      if (DBGridEh2.SelectedIndex = 1) then
      begin

        if (Key = #8) or (Key = #46) then
        begin

          if length(vletras) = 1 then
            vletras := ''
          else
            vletras := copy(vletras, 1, length(vletras) - 1);
        end;

        if (Key in ['0' .. '9', 'A' .. 'Z', 'a' .. 'z', ' ', '/', '-', '.', ':',
          '@', '&', '*', '%', '$', '(', ')', '=', '?', ':', ';', '{', '}', '[',
          ']', '+', '*', '#', '!']) then
        begin
          vletras := vletras + UpperCase(Key);
        end;

        case TabControl1.TabIndex of
          0:
            begin
              if dados.EhNumero(vletras) and (vletras <> '') then
                qryProd.Filter := 'SERVICO=''S'' AND CODIGO = ' + vletras
              else
              begin

                if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
                  qryProd.Filter := 'SERVICO=''S'' AND DESCRICAO LIKE ' +
                    QuotedStr('%' + UpperCase(vletras) + '%');
              end;
            end;
          1:
            begin
              if dados.EhNumero(vletras) and (vletras <> '') then
                qryProd.Filter := 'SERVICO<>''S'' AND CODIGO = ' + vletras
              else
              begin

                if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
                  qryProd.Filter := 'SERVICO<>''S'' AND DESCRICAO LIKE ' +
                    QuotedStr('%' + UpperCase(vletras) + '%');

              end;
            end;
        end;

        qryProd.Filtered := true;

        if qryProdCODIGO.AsInteger > 0 then
        begin
          if vletras <> '' then
          begin
            if not(qryOS_Detalhe.State in dsEditModes) then
              qryOS_Detalhe.Edit;
            qryOS_DetalheFK_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
          end;
        end;
      end

      else
      begin
        vletras := '';
      end;
    end;
  end;
end;

procedure TfrmCadOS.FormShow(Sender: TObject);
begin
  qrAtendente.Close;
  qrAtendente.Open;

  qryTecnico.Close;
  qryTecnico.Open;

  qryCliente.Close;
  qryCliente.Params[0].AsString := '%';
  qryCliente.Params[1].AsString := '%';
  qryCliente.Open;

  btnProdutos.Visible := dados.vLiberaProduto;
  btnPessoas.Visible := dados.vLiberaPessoa;

  dados.AjustaCamposNovos('os');

end;

procedure TfrmCadOS.PageControl2Change(Sender: TObject);
begin
  Abre_OS_Detalhe
end;

procedure TfrmCadOS.GetCliente;
begin

  if vPessoa <> DBEdit27.EditText then
  begin

    if not(qryOS_Master.State in dsEditModes) then
      qryOS_Master.Edit;

    if not qryOS_Master.IsEmpty then
    begin
      qryOS_MasterFK_CLIENTE.AsInteger := qryClienteCODIGO.AsInteger;
      qryOS_MasterNOME.AsString := qryClienteRAZAO.AsString;
      qryOS_MasterDOCUMENTO.AsString := qryClienteIE.AsString;
      qryOS_MasterFONE1.AsString := qryClienteCELULAR1.AsString;
    end
    else
    begin
      raise Exception.Create('Pessoa não foi encontrada!');
      qryOS_MasterFK_CLIENTE.Clear;
      qryOS_MasterNOME.Clear;
      qryOS_MasterDOCUMENTO.Clear;
      qryOS_MasterFONE1.Clear;

    end
  end;
end;

procedure TfrmCadOS.pnPessoaExit(Sender: TObject);
begin
  if vPessoa <> DBEdit27.Text then
  begin
    if not qryCliente.Eof then
      GetCliente;
  end;

  DBGridPessooa.Visible := false;
  pnPessoa.Height := 39;

end;

procedure TfrmCadOS.qryPessoa_CobrancaAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS.qryPessoa_entregaAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS.TabControl1Change(Sender: TObject);
begin
  FiltraOS;
end;

procedure TfrmCadOS.FiltraOS;
begin
  case TabControl1.TabIndex of
    0:
      begin
        DBGridEh2.Columns[6].Visible := true;
        qryOS_Detalhe.Close;
        qryOS_Detalhe.Params[0].Value := qryOS_MasterCODIGO.Value;
        qryOS_Detalhe.Params[1].Value := 'S';
        qryOS_Detalhe.Open;
      end;
    1:
      begin
        DBGridEh2.Columns[6].Visible := false;
        qryOS_Detalhe.Close;
        qryOS_Detalhe.Params[0].Value := qryOS_MasterCODIGO.Value;
        qryOS_Detalhe.Params[1].Value := 'P';
        qryOS_Detalhe.Open;
      end;
  end;
end;

procedure TfrmCadOS.qryOS_DetalheAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadOS.qryOS_DetalheAfterEdit(DataSet: TDataSet);
begin
  ProdutoAnterior := qryOS_DetalheFK_PRODUTO.AsInteger;
end;

procedure TfrmCadOS.qryOS_DetalheAfterInsert(DataSet: TDataSet);
begin
  ProdutoAnterior := 0;
end;

procedure TfrmCadOS.qryOS_DetalheAfterPost(DataSet: TDataSet);
begin
  // pesquisa parte
  vletras := '';
  dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadOS.qryOS_DetalheBeforeDelete(DataSet: TDataSet);
begin
  DMEstoque.AtualizaEstoque(qryOS_DetalheFK_PRODUTO.Value,
    qryOS_DetalheQTD.AsFloat, 0, 'E', 'R');

  DMEstoque.AtualizaComposicao(qryOS_DetalheFK_PRODUTO.Value,
    qryOS_DetalheQTD.AsFloat, 0, 'E', 'R');

  qryProd.Refresh;
end;

procedure TfrmCadOS.qryOS_DetalheBeforeEdit(DataSet: TDataSet);
begin
  QtdAnterior := qryOS_DetalheQTD.AsFloat;
end;

procedure TfrmCadOS.qryOS_DetalheBeforeInsert(DataSet: TDataSet);
begin
  if qryOS_Master.State in dsEditModes then
    qryOS_Master.Post;
end;

procedure TfrmCadOS.qryOS_DetalheBeforePost(DataSet: TDataSet);
begin

  if (qryOS_DetalheDISCRIMINACAO.IsNull) or
    (qryOS_DetalheDISCRIMINACAO.AsString = '') then
  begin
    // pesquisa parcial
    raise Exception.Create('Informe a Descrição do Produto');

  end;

  if qryOS_Detalhe.State = dsInsert then
    qryOS_DetalheCODIGO.Value := dados.Numerador('OS_DETALHE', 'CODIGO',
      'N', '', '');

  qryOS_DetalheTOTAL.AsFloat := qryOS_DetalheQTD.AsFloat *
    qryOS_DetalhePRECO.AsFloat;

  if ProdutoAnterior = qryOS_DetalheFK_PRODUTO.Value then
  begin
    DMEstoque.AtualizaEstoque(qryOS_DetalheFK_PRODUTO.Value,
      qryOS_DetalheQTD.AsFloat, QtdAnterior, 'S', 'R');

    DMEstoque.AtualizaComposicao(qryOS_DetalheFK_PRODUTO.Value,
      qryOS_DetalheQTD.AsFloat, 0, 'E', 'R');

  end
  else
  begin
    if ProdutoAnterior > 0 then
    begin
      DMEstoque.AtualizaEstoque(ProdutoAnterior, QtdAnterior, 0, 'E', 'R');
      DMEstoque.AtualizaComposicao(ProdutoAnterior, QtdAnterior, 0, 'E', 'R');
    end;

    DMEstoque.AtualizaEstoque(qryOS_DetalheFK_PRODUTO.Value,
      qryOS_DetalheQTD.AsFloat, 0, 'S', 'R');

    DMEstoque.AtualizaComposicao(qryOS_DetalheFK_PRODUTO.Value,
      qryOS_DetalheQTD.AsFloat, 0, 'S', 'R');

  end;

  ChamaGrade;

  qryProd.Refresh;
  QtdAnterior := 0;
  ProdutoAnterior := 0;

end;

procedure TfrmCadOS.qryOS_DetalheFK_PRODUTOValidate(Sender: TField);
begin
  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin

    if DBGridEh2.SelectedIndex = 1 then
    begin

      qryProd.Locate('codigo', qryOS_DetalheFK_PRODUTO.Value, []);
      qryOS_DetalhePRECO.AsFloat := qryProdPR_VENDA.AsFloat;
      if qryProdSERVICO.Value = 'S' then
        qryOS_DetalheTIPO.Value := 'S'
      else
        qryOS_DetalheTIPO.Value := 'P';
    end;
  end
  else
  begin
    if DBGridEh2.SelectedIndex < 2 then
    begin

      qryProd.Locate('codigo', qryOS_DetalheFK_PRODUTO.Value, []);
      qryOS_DetalhePRECO.AsFloat := qryProdPR_VENDA.AsFloat;
      if qryProdSERVICO.Value = 'S' then
        qryOS_DetalheTIPO.Value := 'S'
      else
        qryOS_DetalheTIPO.Value := 'P';
    end;

  end;
end;

procedure TfrmCadOS.qryOS_DetalheNewRecord(DataSet: TDataSet);
begin
  qryOS_DetalheQTD.Value := 1;
  qryOS_DetalheFK_OS_MASTER.Value := qryOS_MasterCODIGO.Value;
  qryOS_DetalheFK_USUARIO.Value := dados.idUsuario;
  qryOS_DetalheFK_FUNCIONARIO.Value := 0;
  qryOS_DetalheFK_EMPRESA.Value := qryOS_DetalheFK_EMPRESA.Value;
  qryOS_DetalhePRECO.Value := 0;
  qryOS_DetalheTOTAL.Value := 0;

end;

procedure TfrmCadOS.qryOS_DetalheQTDChange(Sender: TField);
begin
  CalculaItem;
end;

procedure TfrmCadOS.qryOS_DetalheQTDValidate(Sender: TField);
begin
  if qryOS_DetalheQTD.Value < 0 then
    raise Exception.Create('Quantidade Inválida!');

  if qryOS_DetalheQTD.Value > 9999 then
    raise Exception.Create('Quantidade maior que o permitido!');

  if qryOS_DetalheQTD.Value < 0 then
    raise Exception.Create('Valor Inválido!');

  if qryOS_DetalhePRECO.Value > 999999 then
    raise Exception.Create('Valor maior que o permitido!');
end;

procedure TfrmCadOS.qryOS_MasterAfterDelete(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS.qryOS_MasterAfterOpen(DataSet: TDataSet);
begin
  Abre_OS_Detalhe;
end;

procedure TfrmCadOS.Abre_OS_Detalhe;
begin
  qryOS_Detalhe.Close;
  qryOS_Detalhe.Params[0].Value := qryOS_MasterCODIGO.Value;
  qryOS_Detalhe.Params[1].Value := 'S';
  qryOS_Detalhe.Open;
  TabControl1.TabIndex := 0;
end;

procedure TfrmCadOS.qryOS_MasterAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
end;

procedure TfrmCadOS.qryOS_MasterBeforePost(DataSet: TDataSet);
begin
  qryOS_MasterNOME.Value := qryOS_MasterVIRTUAL_CLIENTE.Value;
  if qryOS_Master.State = dsInsert then
    Abre_OS_Detalhe;
end;

procedure TfrmCadOS.qryOS_MasterCalcFields(DataSet: TDataSet);
begin
  if qryOS_MasterSITUACAO.Value = 'A' then
    qryOS_MasterVIRTUAL_SITUACAO.Value := 'EM ABERTO';
  if qryOS_MasterSITUACAO.Value = 'F' then
    qryOS_MasterVIRTUAL_SITUACAO.Value := 'CONCLUIDA';
  if qryOS_MasterSITUACAO.Value = 'C' then
    qryOS_MasterVIRTUAL_SITUACAO.Value := 'CANCELADA';
end;

procedure TfrmCadOS.qryOS_MasterDESC_PERC_PECASValidate(Sender: TField);
begin
  qryOS_MasterTOTAL_PRODUTOS.Value := qryOS_MasterSUBTOTAL_PECAS.AsFloat -
    qryOS_MasterVL_DESC_PECAS.AsFloat;
  qryOS_MasterTOTAL_SERVICOS.Value := qryOS_MasterSUBTOTAL_SERVICOS.AsFloat -
    qryOS_MasterVL_DESC_SERVICOS.AsFloat;
  qryOS_MasterTOTAL_GERAL.Value := qryOS_MasterTOTAL_SERVICOS.AsFloat +
    qryOS_MasterTOTAL_PRODUTOS.AsFloat;
end;

procedure TfrmCadOS.CalculaTotais;
begin

  qrySoma.Close;
  qrySoma.Params[0].Value := qryOS_MasterCODIGO.AsInteger;
  qrySoma.Open;

  qrySomaPecas.Close;
  qrySomaPecas.Params[0].Value := qryOS_MasterCODIGO.AsInteger;
  qrySomaPecas.Open;

  qrySomaServivos.Close;
  qrySomaServivos.Params[0].Value := qryOS_MasterCODIGO.AsInteger;
  qrySomaServivos.Open;

  if not(qryOS_Master.State in dsEditModes) then
    qryOS_Master.Edit;
  qryOS_MasterSUBTOTAL.Value := qrySomaSUBTOTAL.Value;
  qryOS_MasterSUBTOTAL_PECAS.Value := qrySomaPecasSUBTOTAL.Value;
  qryOS_MasterSUBTOTAL_SERVICOS.Value := qrySomaServivosSUBTOTAL.Value;

  qryOS_MasterTOTAL_SERVICOS.Value := qryOS_MasterSUBTOTAL_SERVICOS.AsFloat -
    qryOS_MasterVL_DESC_SERVICOS.AsFloat;

  qryOS_MasterTOTAL_PRODUTOS.Value := qryOS_MasterSUBTOTAL_PECAS.AsFloat -
    qryOS_MasterVL_DESC_PECAS.AsFloat;

  qryOS_MasterTOTAL_GERAL.Value := qryOS_MasterTOTAL_SERVICOS.AsFloat +
    qryOS_MasterTOTAL_PRODUTOS.AsFloat;

  qryOS_Master.Post;

end;

procedure TfrmCadOS.cbEmpresaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadOS.qryItensAfterPost(DataSet: TDataSet);
begin
  dados.Conexao.CommitRetaining;
  CalculaTotais;
end;

procedure TfrmCadOS.qryItensBeforeInsert(DataSet: TDataSet);
begin
  if (qryOS_Master.State in dsEditModes) then
    qryOS_Master.Post;
end;

procedure TfrmCadOS.qryItensBeforeOpen(DataSet: TDataSet);
begin
  dados.qryProd.Close;
  dados.qryProd.Open;
end;

procedure TfrmCadOS.qryItensNewRecord(DataSet: TDataSet);
begin
  qryOS_DetalheCODIGO.Value := dados.Numerador('OS_DETALHE', 'CODIGO',
    'N', '', '');
  qryOS_DetalheFK_OS_MASTER.Value := qryOS_MasterCODIGO.Value;
  qryOS_DetalhePRECO.Value := 0;
  qryOS_DetalheQTD.Value := 1;
end;

procedure TfrmCadOS.DBEdit13Exit(Sender: TObject);
begin
  if not(qryOS_Master.State in dsEditModes) then
    qryOS_Master.Edit;

  if qryOS_MasterSUBTOTAL_PECAS.Value > 0 then
    qryOS_MasterDESC_PERC_PECAS.Value :=
      ((qryOS_MasterVL_DESC_PECAS.Value * 100) /
      qryOS_MasterSUBTOTAL_PECAS.Value)
  else
    qryOS_MasterDESC_PERC_PECAS.Value := 0;

  if qryOS_MasterSUBTOTAL_SERVICOS.Value > 0 then
    qryOS_MasterDESC_PERC_SERVICOS.Value :=
      ((qryOS_MasterVL_DESC_SERVICOS.Value * 100) /
      qryOS_MasterSUBTOTAL_SERVICOS.Value)
  else
    qryOS_MasterDESC_PERC_SERVICOS.Value := 0;

  qryOS_MasterTOTAL_SERVICOS.Value := qryOS_MasterSUBTOTAL_SERVICOS.AsFloat -
    qryOS_MasterVL_DESC_SERVICOS.AsFloat;

  qryOS_MasterTOTAL_PRODUTOS.Value := qryOS_MasterSUBTOTAL_PECAS.AsFloat -
    qryOS_MasterVL_DESC_PECAS.AsFloat;

  qryOS_MasterTOTAL_GERAL.Value := qryOS_MasterTOTAL_SERVICOS.AsFloat +
    qryOS_MasterTOTAL_PRODUTOS.AsFloat;
end;

procedure TfrmCadOS.DBEdit27Change(Sender: TObject);
begin

  if vPessoa <> DBEdit27.Text then
  begin

    DBGridPessooa.Visible := true;
    pnPessoa.Height := 100;

  end;

  qryCliente.Close;
  if dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S' then
  begin
    qryCliente.Params[0].Value := '%' + DBEdit27.Text + '%';
    qryCliente.Params[1].Value := copy(DBEdit27.Text, 1, 14) + '%';
  end
  else
  begin
    qryCliente.Params[0].Value := DBEdit27.Text + '%';
    qryCliente.Params[1].Value := copy(DBEdit27.Text, 1, 14) + '%';
  end;

  qryCliente.Open;

end;

procedure TfrmCadOS.DBEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_up then
    qryCliente.Prior;
  if Key = VK_DOWN then
    qryCliente.Next;
end;

procedure TfrmCadOS.DBEdit4Exit(Sender: TObject);
begin
  if not(qryOS_Master.State in dsEditModes) then
    qryOS_Master.Edit;

  qryOS_MasterVL_DESC_PECAS.Value :=
    (qryOS_MasterSUBTOTAL_PECAS.Value *
    qryOS_MasterDESC_PERC_PECAS.Value / 100);

  qryOS_MasterVL_DESC_SERVICOS.Value :=
    (qryOS_MasterSUBTOTAL_SERVICOS.Value * qryOS_MasterDESC_PERC_SERVICOS.
    Value / 100);

  qryOS_MasterTOTAL_SERVICOS.Value := qryOS_MasterSUBTOTAL_SERVICOS.AsFloat -
    qryOS_MasterVL_DESC_SERVICOS.AsFloat;

  qryOS_MasterTOTAL_PRODUTOS.Value := qryOS_MasterSUBTOTAL_PECAS.AsFloat -
    qryOS_MasterVL_DESC_PECAS.AsFloat;

  qryOS_MasterTOTAL_GERAL.Value := qryOS_MasterTOTAL_SERVICOS.AsFloat +
    qryOS_MasterTOTAL_PRODUTOS.AsFloat;

end;

procedure TfrmCadOS.DBGridEh1Enter(Sender: TObject);
begin
  vletras := '';
end;

procedure TfrmCadOS.DBGridEh1Exit(Sender: TObject);
begin
  vletras := '';
end;

procedure TfrmCadOS.DBGridEh2ColEnter(Sender: TObject);
begin
  FPodeAlterar := true;
  if DBGridEh2.SelectedIndex <> 1 then
  begin
    if qryOS_DetalheDISCRIMINACAO.Value <> qryOS_DetalheVIRTUAL_SERVICOS.AsString
    then
      if qryOS_Detalhe.State in dsEditModes then
        qryOS_DetalheDISCRIMINACAO.Value :=
          qryOS_DetalheVIRTUAL_SERVICOS.AsString;
  end;

end;

procedure TfrmCadOS.DBGridEh2ColExit(Sender: TObject);
begin
  FPodeAlterar := true;
end;

procedure TfrmCadOS.DBGridEh2Columns1UpdateData(Sender: TObject;
  var Text: string; var Value: Variant; var UseText, Handled: Boolean);
begin
  if (dados.qryEmpresaPESQUISA_POR_PARTE.Value = 'S') then
  begin
    if DBGridEh2.SelectedIndex = 1 then
      qryOS_DetalheFK_PRODUTO.AsInteger := qryProdCODIGO.AsInteger;
  end;
end;

procedure TfrmCadOS.DBGridEh2Enter(Sender: TObject);
begin
  vletras := '';
end;

procedure TfrmCadOS.DBGridEh2Exit(Sender: TObject);
begin
  vletras := '';
end;

procedure TfrmCadOS.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TfrmCadOS.DBGridPessooaDblClick(Sender: TObject);
begin
  DBEdit27.EditText := qryClienteRAZAO.Value;
  qryOS_MasterNOME.AsString := qryClienteRAZAO.Value;
end;

procedure TfrmCadOS.DBGridPessooaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    qryOS_MasterNOME.AsString := qryClienteRAZAO.Value;
end;

procedure TfrmCadOS.DBLookupComboboxEh2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadOS.dsDetalheDataChange(Sender: TObject; Field: TField);
begin

  if (qryOS_DetalheSITUACAO.IsNull) or (qryOS_DetalheSITUACAO.AsString = 'F')
  then
  begin
    btnAbrir.Enabled := true;
    btnFechar.Enabled := false;
  end;

  if qryOS_DetalheSITUACAO.AsString = 'A' then
  begin
    btnAbrir.Enabled := false;
    btnFechar.Enabled := true;
  end;

end;

procedure TfrmCadOS.InsereItem;
var
  vPosicao: Integer;
  vPesquisa: string;
  vQtd: extended;

begin
  try

    vPosicao := Pos('*', trim(edtProduto.Text)) + 1;
    vPesquisa := trim(copy((edtProduto.Text), vPosicao, 1000));

    vQtd := StrToFloatDef(copy(edtProduto.Text, 1,
      Pos('*', edtProduto.Text) - 1), 1);

    qryOS_Detalhe.Insert;
    qryOS_Detalhe.FieldByName('FK_PRODUTO').AsInteger :=
      dados.buscacodigoProduto('select codigo from produto where codbarra=:cod',
      vPesquisa);
    qryOS_Detalhe.FieldByName('DISCRIMINACAO').AsString :=
      dados.BuscaDescricaoProdutoBarra(vPesquisa);

    qryOS_Detalhe.FieldByName('QTD').AsFloat := vQtd;

    dados.qryConsulta.Close;
    dados.qryConsulta.SQL.Clear;
    dados.qryConsulta.SQL.Text :=
      'select pr_venda from produto where codigo=:codigo';
    dados.qryConsulta.Params[0].Value := qryOS_Detalhe.FieldByName('FK_PRODUTO')
      .AsInteger;
    dados.qryConsulta.Open;

    if dados.qryConsulta.RecordCount > 0 then
    begin
      qryOS_Detalhe.FieldByName('PRECO').AsFloat :=
        dados.qryConsulta.FieldByName('PR_VENDA').AsFloat;
      qryOS_Detalhe.FieldByName('TOTAL').AsFloat :=
        vQtd * qryOS_Detalhe.FieldByName('PRECO').AsFloat;
    end;

    case TabControl1.TabIndex of
      0:
        qryOS_DetalheTIPO.Value := 'S';
      1:
        qryOS_DetalheTIPO.Value := 'P';
    end;

    qryOS_Detalhe.Post;
    dados.Conexao.CommitRetaining;

    qryOS_Detalhe.Last;
  except
    On e: Exception do
    begin
      qryOS_Detalhe.Cancel;
      raise Exception.Create(e.Message);
    end;
  end;

end;

procedure TfrmCadOS.edtProdutoEnter(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := false;
end;

procedure TfrmCadOS.edtProdutoExit(Sender: TObject);
begin
  JvEnterAsTab1.EnterAsTab := true;
end;

procedure TfrmCadOS.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin

  if not Panel3.Enabled then
    exit;

  if (Key in [#13]) then
  begin
    if (qryOS_Master.State in dsEditModes) then
      qryOS_Master.Post;

    if ActiveControl = edtProduto then
    begin
      if edtProduto.Text <> '' then
      begin
        InsereItem;
        edtProduto.SetFocus;
        edtProduto.Clear;
        Key := #0;
      end
      else
      begin
        DBEdit12.SetFocus;
      end;
    end;
  end;
end;

end.
