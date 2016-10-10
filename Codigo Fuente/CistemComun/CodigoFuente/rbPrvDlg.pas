{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  10940: rbPrvDlg.pas 
{
{   Rev 1.0    21/07/2008 12:01:30 PM  Marks
{ Version Inicial
}
{
{   Rev 1.0    21/11/2007 3:00:06 PM  Marco
{ x
}
{
{   Rev 1.1    27/04/2007 10:56:46 AM  Marco
{ Imagenes en Print Preview
}
{
{   Rev 1.0    18/01/2007 2:29:48 PM  Supervisor
}
{
{   Rev 1.0    24/07/2006 11:38:08 AM  Supervisor
{ 24 Julio 2006
}
{
{   Rev 1.2    8/27/2004 6:57:18 PM  Marco
}
{
{   Rev 1.1    26/07/2004 4:36:18 PM  Marco
{ Se cambió el toolbar
}
{
{   Rev 1.0    16/07/2004 11:03:16 AM  Marco
}
{
{   Rev 1.0    30/07/2003 11:26:08 AM  Supervisor
{ Versión Inicial Timex Card
}
{******************************************************************************}
{                                                                              }
{                   ReportBuilder Report Component Library                     }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit rbPrvDlg;

interface


uses
  Windows, SysUtils, Forms, ComCtrls, Graphics, ExtCtrls, Controls, Buttons,
  ppForms, ppTypes, ppProd, ppDevice, ppViewr, Dialogs, ppUtils, dxBar,
  dxBarExtItems, Classes, cxClasses;

type

  { TrbPrintPreview }
  TrbPrintPreview = class(TppCustomPreviewer)
    ppViewer1: TppViewer;
    dxBarManager1: TdxBarManager;
    spbPreviewPrint: TdxBarButton;
    spbAutoSearch: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    spbPreviewWhole: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    spbPreview100Percent: TdxBarButton;
    spbPreviewWidth: TdxBarButton;
    mskPreviewPercentage: TdxBarEdit;
    spbPreviewFirst: TdxBarButton;
    spbPreviewPrior: TdxBarButton;
    mskPreviewPage: TdxBarEdit;
    spbPreviewLast: TdxBarButton;
    spbPreviewNext: TdxBarButton;
    spbPreviewClose: TdxBarButton;
    procedure spbPreviewPrintClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewFirstClick(Sender: TObject);
    procedure spbPreviewPriorClick(Sender: TObject);
    procedure spbPreviewNextClick(Sender: TObject);
    procedure spbPreviewLastClick(Sender: TObject);
    procedure mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
    procedure ppViewerPageChange(Sender: TObject);
    procedure ppViewerStatusChange(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure spbPreviewCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure spbAutoSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FStatusBar: TStatusBar;

  protected
    procedure Activate; override;
    function  GetViewer: TObject; override;
    procedure LanguageChanged; override;

  public
    procedure Init; override;

  end; {class, TppPrintPreview}

var
  rbPrintPreview: TrbPrintPreview;

implementation

uses uDM, dmImagenes;

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.FormCreate }

procedure TrbPrintPreview.FormCreate(Sender: TObject);
begin

  FStatusBar := TStatusBar.Create(Self);
  FStatusBar.Parent      := Self;
  FStatusBar.SimplePanel := True;
  FStatusBar.Align       := alBottom;

end; {procedure FormCreate}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.FormClose}

procedure TrbPrintPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  rbPrintPreview := nil;
end; {procedure FormClose}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.Activate }

procedure TrbPrintPreview.Activate;
begin

  {this is in Activate because we want it to fire after OnPreviewFormCreate
   and it's before Inherited to avoid caption flash.}
  if DisplayDocumentName then
    Caption := ppViewer1.Report.PrinterSetup.DocumentName;

  inherited Activate;

end; {procedure, Activate}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.Init }

procedure TrbPrintPreview.Init;
begin

  if (Report is TppProducer) then
    ppViewer1.Report := TppProducer(Report);

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.FormShow }

procedure TrbPrintPreview.FormShow(Sender: TObject);
begin

  if (Report is TppProducer) and (TppProducer(Report).ShowAutoSearchDialog) then
    spbAutoSearch.Visible := ivAlways; 

  spbPreviewWhole.Down      := (ppViewer1.ZoomSetting = zsWholePage);
  spbPreviewWidth.Down      := (ppViewer1.ZoomSetting = zsPageWidth);
  spbPreview100Percent.Down := (ppViewer1.ZoomSetting = zs100Percent);

end; {procedure, FormShow}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.LanguageChanged}

procedure TrbPrintPreview.LanguageChanged;
var
  lBitMap: TBitMap;
begin

  spbAutoSearch.Hint := ppLoadStr(1021);
  spbPreviewPrint.Hint := ppLoadStr(22);
  spbPreviewWhole.Hint := ppLoadStr(30);
  spbPreviewWidth.Hint := ppLoadStr(31);
  spbPreview100Percent.Hint := ppLoadStr(1); {'100 %'}
  spbPreviewFirst.Hint := ppLoadStr(13);
  spbPreviewPrior.Hint := ppLoadStr(29);
  spbPreviewNext.Hint  := ppLoadStr(15);
  spbPreviewLast.Hint  := ppLoadStr(14);
  spbPreviewClose.Caption := ppLoadStr(6); {'Close'}

  lBitMap := TBitMap.Create;
  lBitMap.Free;

  Caption := ppLoadStr(23);

end; {procedure, LanguageChanged}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.GetViewer }

function TrbPrintPreview.GetViewer: TObject;
begin
  Result := ppViewer1;
end; {function, GetViewer}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.FormKeyDown}

procedure TrbPrintPreview.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  lScrollBar: TControlScrollBar;
begin

  if (ssCtrl in Shift) then
    begin

      case Key of
       VK_PRIOR: ppViewer1.PriorPage;
       VK_NEXT:  ppViewer1.NextPage;
       VK_HOME:  ppViewer1.FirstPage;
       VK_END:   ppViewer1.LastPage;
      end;

    end
  else
    begin

      case Key of
       VK_PRIOR, VK_UP:
         begin
           lScrollBar := ppViewer1.ScrollBox.VertScrollBar;
           lScrollBar.Position := lScrollBar.Position - ppViewer1.ScrollBox.Height;
         end;

       VK_NEXT, VK_DOWN:
         begin
           lScrollBar := ppViewer1.ScrollBox.VertScrollBar;
           lScrollBar.Position := lScrollBar.Position + ppViewer1.ScrollBox.Height;
         end;

       VK_LEFT:
         begin
           lScrollBar := ppViewer1.ScrollBox.HorzScrollBar;
           lScrollBar.Position := lScrollBar.Position - ppViewer1.ScrollBox.Width;
         end;

       VK_RIGHT:
         begin
           lScrollBar := ppViewer1.ScrollBox.HorzScrollBar;
           lScrollBar.Position := lScrollBar.Position + ppViewer1.ScrollBox.Width;
         end;

      end;

    end;

end; {procedure, FormKeyDown}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbCloseClick }

procedure TrbPrintPreview.spbPreviewCloseClick(Sender: TObject);
begin
  if TppProducer(Report).Printing then
    begin
      ppViewer1.Cancel;
      DoOnCancel;
    end
  else
    Close;
end; {procedure, spbCloseClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.ppViewerStatusChange }

procedure TrbPrintPreview.ppViewerStatusChange(Sender: TObject);
begin
  FStatusBar.SimpleText := ppViewer1.Status;
end; {procedure, ppViewerStatusChange}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.ppViewerPageChange }

procedure TrbPrintPreview.ppViewerPageChange(Sender: TObject);
begin
  mskPreviewPage.Text := IntToStr(ppViewer1.AbsolutePageNo);
  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, ppViewerPageChange}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbPreviewPrintClick }

procedure TrbPrintPreview.spbPreviewPrintClick(Sender: TObject);
begin
  ppViewer1.Print;
end; {procedure, spbPreviewPrintClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbAutoSearchClick}

procedure TrbPrintPreview.spbAutoSearchClick(Sender: TObject);
begin
  ppViewer1.DisplayAutoSearchDialog;
end; {procedure, spbAutoSearchClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbPreviewFirstClick}

procedure TrbPrintPreview.spbPreviewFirstClick(Sender: TObject);
begin
  ppViewer1.FirstPage;
end; {procedure, spbCloseClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbPreviewPriorClick}

procedure TrbPrintPreview.spbPreviewPriorClick(Sender: TObject);
begin
  ppViewer1.PriorPage;
end; {procedure, spbPreviewFirstClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbPreviewNextClick}

procedure TrbPrintPreview.spbPreviewNextClick(Sender: TObject);
begin
  ppViewer1.NextPage;
end; {procedure, spbPreviewNextClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbPreviewLastClick}

procedure TrbPrintPreview.spbPreviewLastClick(Sender: TObject);
begin
  ppViewer1.LastPage;
end; {procedure, spbPreviewLastClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.mskPreviewPageKeyPress}

procedure TrbPrintPreview.mskPreviewPageKeyPress(Sender: TObject; var Key: Char);
var
  liPage: Longint;
begin

  if (Key = #13) then
    begin
      liPage := StrToInt(mskPreviewPage.Text);

      ppViewer1.GotoPage(liPage);
    end; {if, carriage return pressed}

end; {procedure, mskPreviewPageKeyPress}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbPreviewZoomClick }

procedure TrbPrintPreview.spbPreviewWholeClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsWholePage;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreviewZoomClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbPreviewWidthClick}

procedure TrbPrintPreview.spbPreviewWidthClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zsPageWidth;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreviewWidthClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.spbPreview100PercentClick}

procedure TrbPrintPreview.spbPreview100PercentClick(Sender: TObject);
begin
  ppViewer1.ZoomSetting := zs100Percent;

  mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
end; {procedure, spbPreview100PercentClick}

{------------------------------------------------------------------------------}
{ TrbPrintPreview.mskPreviewPercentageKeyPress}

procedure TrbPrintPreview.mskPreviewPercentageKeyPress(Sender: TObject; var Key: Char);
var
  liPercentage: Integer;
begin
  if (Key = #13) then
    begin
      liPercentage := StrToIntDef(mskPreviewPercentage.Text, 100);

      ppViewer1.ZoomPercentage := liPercentage;

      spbPreviewWhole.Down := False;
      spbPreviewWidth.Down := False;
      spbPreview100Percent.Down := False;

      mskPreviewPercentage.Text := IntToStr(ppViewer1.CalculatedZoom);
    end; {if, carriage return pressed}

end; {procedure, mskPreviewPercentageKeyPress}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}



initialization

  ppRegisterForm(TppCustomPreviewer, TrbPrintPreview);

finalization

  ppUnRegisterForm(TppCustomPreviewer);

end.
