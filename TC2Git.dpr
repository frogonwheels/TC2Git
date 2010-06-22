program TC2Git;

{$APPTYPE CONSOLE}



{$R 'iconfile.res' 'iconfile.RC'}

uses
  SysUtils,
  TCDirectIntf in '..\tcvcsapi\TCDirectIntf.pas',
  ExportGitCollate in 'ExportGitCollate.pas',
  TCVcsConst in '..\tcvcsapi\TCVcsConst.pas',
  TCVcsTypes in '..\tcvcsapi\TCVcsTypes.pas',
  TCVcsUtils in '..\tcvcsapi\TCVcsUtils.pas',
  TrkIntf in '..\tcvcsapi\TrkIntf.pas',
  TCTrkConst in '..\tcvcsapi\TCTrkConst.pas',
  TCTrkTypes in '..\tcvcsapi\TCTrkTypes.pas',
  TCTrkUtils in '..\tcvcsapi\TCTrkUtils.pas';

begin
  try
    ExportMain;

  except
    on E: Exception do
      Writeln( E.ClassName, ': ', E.Message);
  end;
end.
