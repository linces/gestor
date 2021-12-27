unit Mp2032;

interface

function IniciaPorta( Porta: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function FechaPorta: integer; stdcall; far; external 'MP2032.DLL';
function BematechTX( BufTrans: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ComandoTX( BufTrans: AnsiString; TamBufTrans: integer ): integer; stdcall; far; external 'MP2032.DLL';
function CaracterGrafico( BufTrans: AnsiString; TamBufTrans: integer ): integer; stdcall; far; external 'MP2032.DLL';
function DocumentInserted: integer; stdcall; far; external 'MP2032.DLL';
function Le_Status: integer; stdcall; far; external 'MP2032.DLL';
function AutenticaDoc( texto: AnsiString; tempo: integer ): integer; stdcall; far; external 'MP2032.DLL';
function Le_Status_Gaveta: integer; stdcall; far; external 'MP2032.DLL';
function ConfiguraTamanhoExtrato( NumeroLinhas: Integer ): integer; stdcall; far; external 'MP2032.DLL';
function HabilitaExtratoLongo( Flag: Integer ): integer; stdcall; far; external 'MP2032.DLL';
function HabilitaEsperaImpressao( Flag: Integer ): integer; stdcall; far; external 'MP2032.DLL';
function EsperaImpressao: integer; stdcall; far; external 'MP2032.DLL';
function ConfiguraModeloImpressora( ModeloImpressora: integer ): integer; stdcall; far; external 'MP2032.DLL';
function AcionaGuilhotina( Modo: integer ): integer; stdcall; far; external 'MP2032.DLL';
function FormataTX (BufTras: AnsiString; TpoLtra: integer; Italic: integer; Sublin: integer; expand: integer; enfat: integer ): integer; stdcall; far; external 'MP2032.DLL';
function HabilitaPresenterRetratil( iFlag: integer ): integer; stdcall; far; external 'MP2032.DLL';
function ProgramaPresenterRetratil( iTempo: integer ): integer; stdcall; far; external 'MP2032.DLL';
function VerificaPapelPresenter: integer; stdcall; far; external 'MP2032.DLL';

// Função para Configuração dos Códigos de Barras

function ConfiguraCodigoBarras( Altura: integer; Largura: integer; PosicaoCaracteres: integer; Fonte: integer; Margem: integer ): integer; stdcall; far; external 'MP2032.DLL';

// Funções para impressão dos códigos de barras

function ImprimeCodigoBarrasUPCA( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasUPCE( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasEAN13( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasEAN8( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasCODE39( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasCODE93( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasCODE128( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasITF( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasCODABAR( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasISBN( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasMSI( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasPLESSEY( Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoBarrasPDF417( NivelCorrecaoErros: integer; Altura: integer; Largura: integer; Colunas: integer; Codigo: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeCodigoQRCODE(errorCorrectionLevel: integer; moduleSize: integer; codeType: integer; QRCodeVersion: integer; encodingModes: integer; codeQr: AnsiString): integer; stdcall; far; external 'MP2032.DLL';

// Funções para impressão de BitMap

function ImprimeBitmap ( name: AnsiString; mode: integer): integer; stdcall; far; external 'MP2032.DLL';
function ImprimeBmpEspecial ( name: AnsiString; xScale: integer; yScale: integer; angle: integer): integer; stdcall; far; external 'MP2032.DLL';
function AjustaLarguraPapel ( width: integer): integer; stdcall; far; external 'MP2032.DLL';
function SelectDithering ( mode: integer): integer; stdcall; far; external 'MP2032.DLL';
function PrinterReset : integer; stdcall; far; external 'MP2032.DLL';
function LeituraStatusEstendido ( A: array of byte ): integer; stdcall; far; external 'MP2032.DLL';
function IoControl ( flag: Integer; mode : Boolean ): integer; stdcall; far; external 'MP2032.DLL';
function DefineNVBitmap ( count: integer; filenames: array of AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function PrintNVBitmap ( image: integer; mode: integer ): integer; stdcall; far; external 'MP2032.DLL';
function Define1NVBitmap ( filename : AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function DefineDLBitmap ( filename: AnsiString ): integer; stdcall; far; external 'MP2032.DLL';
function PrintDLBitmap ( mode: integer ): integer; stdcall; far; external 'MP2032.DLL';

implementation

end.
 