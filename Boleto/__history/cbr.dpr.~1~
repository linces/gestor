program cbr;

uses
  Forms,
  ufrmDefault in '..\src_comum\ufrmDefault.pas' {frmDefault},
  ufrmDefaultClean in '..\src_comum\ufrmDefaultClean.pas' {frmDefaultClean},
  ufrmDefaultConsulta in '..\src_comum\ufrmDefaultConsulta.pas' {frmDefaultConsulta},
  ufrmDefaultCadastro in '..\src_comum\ufrmDefaultCadastro.pas' {frmDefaultCadastro},
  ufrmBACKUP in '..\src_comum\ufrmBACKUP.pas' {frmBACKUP},
  ufrmMENSAGEMespera in '..\src_comum\ufrmMENSAGEMespera.pas' {frmMENSAGEMespera},
  ufrmEMPRESAScadastro in '..\src_comum\ufrmEMPRESAScadastro.pas' {frmEMPRESAScadastro},
  uclassEMPRESA in '..\src_comum\class\uclassEMPRESA.pas',
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  uclassCONFIGini in '..\src_comum\class\uclassCONFIGini.pas',
  ufrmRETORNOmanutencao in 'ufrmRETORNOmanutencao.pas' {frmRETORNOmanutencao},
  uclassDB in '..\src_comum\class\uclassDB.pas',
  uclassLOG in '..\src_comum\class\uclassLOG.pas',
  udtmCBR in 'dm\udtmCBR.pas' {dtmCBR: TDataModule},
  uclassCBR in 'class\uclassCBR.pas',
  udtmDefault in '..\src_comum\dm\udtmDefault.pas' {dtmDefault: TDataModule},
  ufrmPESSOAScadastro in '..\src_comum\ufrmPESSOAScadastro.pas' {frmPESSOAScadastro},
  ufuncoes in '..\src_comum\unit\ufuncoes.pas',
  uclassPESSOA in '..\src_comum\class\uclassPESSOA.pas',
  uclassTRANSPORTADORA in '..\src_comum\class\uclassTRANSPORTADORA.pas',
  ufrmEMPRESASmanutencao in '..\src_comum\ufrmEMPRESASmanutencao.pas' {frmEMPRESASmanutencao},
  ufrmCBRconfig in 'ufrmCBRconfig.pas' {frmCBRconfig},
  ufrmPESSOASmanutencao in '..\src_comum\ufrmPESSOASmanutencao.pas' {frmPESSOASmanutencao},
  uclassPRODUTO in '..\src_comum\class\uclassPRODUTO.pas',
  ufrmREMESSAcadastro in 'ufrmREMESSAcadastro.pas' {frmREMESSAcadastro},
  ufrmCBRcadastroM in 'ufrmCBRcadastroM.pas' {frmCBRcadastroM},
  ufrmCBRmanutencao in 'ufrmCBRmanutencao.pas' {frmCBRmanutencao},
  uclassCBR_TITULOS in 'class\uclassCBR_TITULOS.pas',
  uclassUTIL in '..\src_comum\class\uclassUTIL.pas',
  ufrmREMESSAmanutencao in 'ufrmREMESSAmanutencao.pas' {frmREMESSAmanutencao},
  uclassCBR_REMESSA in 'class\uclassCBR_REMESSA.pas',
  uclassCBR_RETORNO in 'class\uclassCBR_RETORNO.pas',
  ufrmRETORNOrelatorio in 'ufrmRETORNOrelatorio.pas' {frmRETORNOrelatorio},
  ufrmREMESSArelatorio in 'ufrmREMESSArelatorio.pas' {frmREMESSArelatorio},
  ufrmCBRcadastro in 'ufrmCBRcadastro.pas' {frmCBRcadastro};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TdtmDefault, dtmDefault);
  Application.CreateForm(TdtmCBR, dtmCBR);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
