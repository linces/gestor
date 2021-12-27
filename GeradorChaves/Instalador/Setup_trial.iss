; xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
; xx  DATA.......................: 2014 - 2020                                         xx
; xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
; xx  PROJETO...............: Sistema Retaguarda e Frente de Caixa                     xx
; xx  LINGUAGEM.............: Delphi 10.3 Rio (32 bits) ou superior.                   xx
; xx  BANCO DE DADOS........: Firebird 2.5 (32 bits) ou superior.                      xx
; xx  FINALIDADE............: Micro e pequena empresa                                  xx
; xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
; xx  Você não pode comercializar o codigo-fonte. Nem mesmo parcialmente!            xx
; xx  Comercialize somente o sistema compilado (com o nome/interface que desejar).     xx
; xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

[Setup]
AppName=License Manager SoftArena
AppVersion=1.7
;AppVerName={#MyAppName} {#MyAppVersion}
;AppPublisher={#MyAppPublisher}
;AppPublisherURL={#MyAppURL}
;AppSupportURL={#MyAppURL}
;AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\LicenseManagerSA
DefaultGroupName=License Manager - SoftArena
InfoBeforeFile=
OutputDir=F:\00 Projetos\02 Delphi\endsisframework\Repositorio\Componentes\10.4\GeradorChaves\Instalador
OutputBaseFilename=setup_licensemanager
Compression=lzma
SolidCompression=true
PrivilegesRequired=admin
AppID={{5C8F09E6-427D-455E-AF75-F3D5B56877D0}
DisableStartupPrompt=true
UsePreviousTasks=true
DisableReadyMemo=false
LanguageDetectionMethod=locale
UninstallDisplayIcon={app}\Binarios\DBVenda.exe
InternalCompressLevel=normal
DisableDirPage=true
AllowRootDirectory=true
DisableFinishedPage=false
SetupLogging=true
AlwaysShowDirOnReadyPage=true
AlwaysShowGroupOnReadyPage=true
DisableProgramGroupPage=false
AppPublisherURL=https://loja.softarena.com.br
AppSupportURL=softarena@softarena.com.br
UninstallDisplayName=License Manager - SoftArena
AppCopyright=SoftArena
WizardImageFile=compiler:WizModernImage-IS.bmp
WizardSmallImageFile=compiler:WizModernSmallImage-IS.bmp
AppUpdatesURL=
AppPublisher=SoftArena
AppContact=WhatsApp: 5534991587421
AppSupportPhone=+5534991587421
VersionInfoVersion=1.7
VersionInfoCompany=SoftArena
VersionInfoDescription=License Manager - SoftArena https://loja.softarena.com.br
VersionInfoTextVersion=License Manager - SoftArena https://loja.softarena.com.br
VersionInfoCopyright=SoftArena
VersionInfoProductName=License Manager - SoftArena
SourceDir=F:\00 Projetos\02 Delphi\endsisframework\Repositorio\Componentes\10.4\GeradorChaves

[Icons]
;Name: {userdesktop}\DBVenda Sistema; Filename: {app}\Binarios\DBVenda.exe; IconFilename: {app}\Binarios\DBVenda.exe; Comment: DBVenda Sistema; IconIndex: 0; Languages:
Name: {group}\DBVenda; Filename: {app}\Binarios\DBVenda.exe; WorkingDir: {app}\Binarios; IconFilename: {app}\Binarios\DBVenda.exe; IconIndex: 0
Name: {commonprograms}\DBVenda; Filename: {app}\Binarios\DBVenda.exe; IconIndex: 0; WorkingDir: {app}\Binarios; IconFilename: {app}\Binarios\DBVenda.exe; Languages: 
Name: {commondesktop}\DBVenda; Filename: {app}\Binarios\DBVenda.exe; Tasks: desktopicon; IconIndex: 0; WorkingDir: {app}\Binarios; IconFilename: {app}\Binarios\DBVenda.exe

Name: {group}\DBVenda - PDV; Filename: {app}\Binarios\DBVendaPDV.exe; WorkingDir: {app}\Binarios; IconFilename: {app}\Binarios\DBVendaPDV.exe; IconIndex: 0
Name: {commonprograms}\DBVenda - PDV; Filename: {app}\Binarios\DBVendaPDV.exe; WorkingDir: {app}\Binarios; IconFilename: {app}\Binarios\DBVendaPDV.exe; Languages: ; IconIndex: 0
Name: {commondesktop}\DBVenda - PDV; Filename: {app}\Binarios\DBVendaPDV.exe; Tasks: desktopicon; WorkingDir: {app}\Binarios; IconFilename: {app}\Binarios\DBVendaPDV.exe; IconIndex: 0

[Dirs]
Name: "{app}\NFe"
Name: "{app}\NFe\Eventos"
Name: "{app}\NFe\Geradas"
Name: "{app}\NFe\Inutilizadas"
Name: "{app}\NFe\PDF"
Name: "{app}\NFe\Salvar"

Name: "{app}\NFCe"
Name: "{app}\NFCe\Eventos"
Name: "{app}\NFCe\Geradas"
Name: "{app}\NFCe\Inutilizadas"
Name: "{app}\NFCe\PDF"
Name: "{app}\NFCe\Salvar"

Name: "{app}\Essenciais"
Name: "{app}\Boletos\Layout"
Name: "{app}\Boletos\Logos\Colorido"
Name: "{app}\Boletos\Remessa"
Name: "{app}\Boletos\Retorno"
Name: "{app}\Firebird"

[Files]
;------------------------------------------------------------------
; DBVenda
;------------------------------------------------------------------
Source: "..\Compilados\DBVenda.exe"; DestDir: "{app}\Binarios"; Flags: ignoreversion
;------------------------------------------------------------------
; NFC-e/PDV/SAT
;------------------------------------------------------------------
Source: "..\Compilados\DBVendaPDV.exe"; DestDir: "{app}\Binarios"; Flags: ignoreversion
;------------------------------------------------------------------
; Banco de Dados
;------------------------------------------------------------------
Source: "..\Dados\dbvenda.fdb"; DestDir: "{app}\DB"; Flags: ignoreversion uninsneveruninstall
Source: "..\Dados\dbvendapdv.fdb"; DestDir: "{app}\DB"; Flags: ignoreversion uninsneveruninstall
;------------------------------------------------------------------
; Firebird 2.5  32 bits
;------------------------------------------------------------------
Source: "Firebird\Firebird-2.5.8.27089_0_Win32.exe"; DestDir: "{app}\Firebird"
;------------------------------------------------------------------
; ARQUIVOS DLL para a pasta System do Windows
;------------------------------------------------------------------
Source: "DLL\capicom.dll"; DestDir: "{sys}"; Flags: regserver
Source: "DLL\msxml5.dll"; DestDir: "{sys}"; Flags: regserver
Source: "DLL\msxml5r.dll"; DestDir: "{sys}"
Source: "DLL\libeay32.dll"; DestDir: "{sys}"; Flags: onlyifdoesntexist
Source: "DLL\ssleay32.dll"; DestDir: "{sys}"; Flags: onlyifdoesntexist

;------------------------------------------------------------------
; ARQUIVOS DLL para a pasta c:\DBVenda\Binarios
;------------------------------------------------------------------
Source: "DLL\fbrmclib.dll"; DestDir: "{app}\Binarios"
Source: "DLL\fbclient.dll"; DestDir: "{app}\Binarios"
Source: "DLL\capicom.dll"; DestDir: "{app}\Binarios"
Source: "DLL\iconv.dll"; DestDir: "{app}\Binarios"
Source: "DLL\instala.bat"; DestDir: "{app}\Binarios"
Source: "DLL\libcharset-1.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libeay32.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libexslt-0.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libgcc_s_dw2-1.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libiconv-2.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libintl-8.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libltdl-7.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libwinpthread-1.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxml2.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxml2-2.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxmlsec.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxmlsec1.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxmlsec1-openssl.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxmlsecopenssl.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxmlsec-openssl.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxslt.dll"; DestDir: "{app}\Binarios"
Source: "DLL\libxslt-1.dll"; DestDir: "{app}\Binarios"
Source: "DLL\msvcr120.dll"; DestDir: "{app}\Binarios"
Source: "DLL\msxml5.dll"; DestDir: "{app}\Binarios"
Source: "DLL\msxml5r.dll"; DestDir: "{app}\Binarios"
Source: "DLL\openssl.exe"; DestDir: "{app}\Binarios"
Source: "DLL\ssleay32.dll"; DestDir: "{app}\Binarios"
Source: "DLL\zlib1.dll"; DestDir: "{app}\Binarios"

;------------------------------------------------------------------
; OUTROS ARQUIVOS
;------------------------------------------------------------------
Source: "BoletoFastReport\Boleto.fr3"; DestDir: "{app}\Boletos\Layout"

;------------------------------------------------------------------
; SAT
;------------------------------------------------------------------
;------------------------------------------------------------------
;
;------------------------------------------------------------------
Source: "BoletoLogoColorido\001.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\003.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\004.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\008.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\021.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\024.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\027.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\028.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\029.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\031.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\033.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\036.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\038.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\041.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\047.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\070.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\085.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\097.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\099.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\104.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\133.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\136.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\151.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\231.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\237.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\244.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\246.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\263.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\275.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\291.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\320.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\341.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\347.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\353.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\356.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\389.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\392.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\399.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\409.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\422.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\424.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\453.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\479.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\600.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\604.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\610.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\623.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\633.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\637.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\641.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\702.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\707.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\721.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\741.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\745.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\748.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\749.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "BoletoLogoColorido\756.bmp"; DestDir: "{app}\Boletos\Logos\Colorido"
Source: "SchemasNFe_NFCe_SAT\Averb_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\CCe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\CfeDadosVendaAPL_0007.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\CfeDadosVendaSAT_0007.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\confRecebto_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\consCad_v2.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\consNFeDest_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\consReciNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\consReciNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\consSitNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\consSitNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\consStatServ_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\consStatServ_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\distDFeInt_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\distDFeInt_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\downloadNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e110110_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e110111_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e110112_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e110140_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e110140NFCe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e110140NFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e111500_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e111501_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e111502_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e111503_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e210200_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e210210_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e210220_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e210240_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e411500_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e411501_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e411502_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e411503_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e790700_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e990900_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\e990910_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envAverb_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envCancelPProrrogNFe_v1.0.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envCCe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envConfRecebto_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envEPEC_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envEvento_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envEventoCancNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envEventoCancSubst_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envFiscoNfe_v1.0.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\enviNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\enviNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envPProrrogNFe_v1.0.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envRemIndus_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envSuframaInternaliza_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\envSuframaVistoria_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\EPEC_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\eventoCancNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\eventoCancSubst_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\eventoEPEC_v0.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\eventoEPEC_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\eventoRemIndus_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\inutNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\inutNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteAverb_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteCCe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteConfRecebto_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteConsNFeDest_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteConsSitNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteConsSitNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteConsStatServ_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteConsStatServ_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteConsultaCadastro_v2.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteDownloadNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteEPEC_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteEvento_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteEventoCancNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteEventoCancSubst_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteInutNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteInutNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteRemIndus_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteSuframaInternaliza_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\leiauteSuframaVistoria_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\nfe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\nfe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procAverbNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procCCeNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procConfRecebtoNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procEPEC_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procEventoCancNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procEventoCancSubst_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procEventoNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procEventoNFe_v99.99.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procInutNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procInutNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\procRemIndus_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\resEvento_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\resEvento_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\resNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\resNFe_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retconsNFeDest_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retConsReciNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retConsReciNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retConsSitNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retConsSitNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retConsStatServ_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retConsStatServ_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retDistDFeInt_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retDistDFeInt_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retDownloadNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvAverb_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvCancelPProrrogNFe_v1.0.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvCCe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvConfRecebto_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvEPEC_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvEvento_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvEventoCancNFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvEventoCancSubst_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvFiscoNFe_v1.0.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnviNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnviNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvRemIndus_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvSuframaInternaliza_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEnvSuframaVistoria_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retEventoEPEC_v0.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retInutNFe_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retInutNFe_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\retPProrrogNFe_v1.0.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\SuframaInternaliza_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\SuframaVistoria_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\tiposBasico_v1.03.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\tiposBasico_v3.10.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\tiposBasico_v4.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\tiposDistDFe_v1.00.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\tiposDistDFe_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "SchemasNFe_NFCe_SAT\xmldsig-core-schema_v1.01.xsd"; DestDir: "{app}\Schemas"
Source: "DanfeFastReport\DANFeFR-change-log.txt"; DestDir: "{app}\DANFE"
Source: "DanfeFastReport\DANFeNFCe5_00.fr3"; DestDir: "{app}\DANFE"
Source: "DanfeFastReport\DANFePaisagem_2019.fr3"; DestDir: "{app}\DANFE"
Source: "DanfeFastReport\DANFeRetrato_2019.fr3"; DestDir: "{app}\DANFE"
Source: "DanfeFastReport\EVENTOS.fr3"; DestDir: "{app}\DANFE"
Source: "DanfeFastReport\EventosNFCe.fr3"; DestDir: "{app}\DANFE"
Source: "DanfeFastReport\INUTILIZACAO.fr3"; DestDir: "{app}\DANFE"
Source: "DanfeFastReport\INUTILIZACAONFCE.fr3"; DestDir: "{app}\DANFE"
Source: "senhapadrao.txt"; DestDir: "{app}\Binarios"

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; OnlyBelowVersion: 0,6.1




[INI]
Filename: C:\DBVenda\Binarios\DBVenda.ini; Section: PARAMETROS; Key: Database; String: c:\DBVenda\db\DBVenda.fdb
Filename: C:\DBVenda\Binarios\DBVenda.ini; Section: PARAMETROS; Key: DBConfig; String: c:\DBVenda\db\dbvendapdv.fdb
Filename: C:\DBVenda\Binarios\DBVenda.ini; Section: PARAMETROS; Key: Server; String: 
Filename: C:\DBVenda\Binarios\DBVenda.ini; Section: PARAMETROS; Key: Empresa; String: 1
[Run]
Filename: {app}\Firebird\Firebird-2.5.8.27089_0_Win32.exe; Flags: postinstall waituntilidle; Description: Firebird 2.5 (instalar); StatusMsg: Banco de Dados Firebird 2.5
[UninstallDelete]
Name: C:\DBVenda; Type: filesandordirs; Tasks: ; Languages: 
