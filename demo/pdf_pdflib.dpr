program pdf_pdflib;

uses
  Vcl.Forms,
  UntMain in 'UntMain.pas' {Form2},
  pdflib.lib in '..\lib\pdflib.lib.pas',
  pdflib.core in '..\lib\pdflib.core.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
