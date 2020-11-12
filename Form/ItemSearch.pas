unit ItemSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, d_MainDm, h_MainLib, h_ReferLib,
  DB, ADODB, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.Mask, Vcl.DBCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TfrmItemSearch = class(TForm)
    Pnl_Main: TPanel;
    Pnl_Sub: TPanel;
    Pnl_Top: TPanel;
    Pnl_BTN: TPanel;
    Pnl_Btn5: TPanel;
    Panel24: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    dsInfo: TDataSource;
    Pnl_Base: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    PnlSearchCode: TPanel;
    edtCode: TEdit;
    Panel15: TPanel;
    Panel17: TPanel;
    PnlStockItem: TPanel;
    cbSTOCK_EXIST: TCheckBox;
    qryInfo: TADOQuery;
    Panel8: TPanel;
    sbtClear: TSpeedButton;
    Panel7: TPanel;
    Panel9: TPanel;
    lblITEM_CODE1: TLabel;
    lblITEM_CODE2: TLabel;
    Panel10: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel11: TPanel;
    lblCode: TLabel;
    lblSpec: TLabel;
    Panel12: TPanel;
    PnlSelect: TPanel;
    PnlFormName: TPanel;
    btnClose: TSpeedButton;
    dgInfo: TDBGridEh;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure dgInfoDblClick(Sender: TObject);
    procedure sbtClearClick(Sender: TObject);
    procedure dgInfoCellClick(Column: TColumnEh);
    procedure dgInfoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodeKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodeChange(Sender: TObject);
    procedure dgInfoTitleClick(Column: TColumnEh);
  private
    procedure SetItemList;
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmItemSearch: TfrmItemSearch;
  SrtFlag : integer = 0 ;

implementation

{$R *.dfm}

//==============================================================================
// FormActivate
//==============================================================================
procedure TfrmItemSearch.FormActivate(Sender: TObject);
var
  i : integer;
begin
  try
    m.Popup_ItemInfo.ResultCd := '';
    m.Popup_ItemInfo.DATA01   := '';
    m.Popup_ItemInfo.DATA02   := '';

    frmItemSearch.Caption               := '010. ' + getLangString('010', 'pCodeSearch', 'Item Code Search', MainDm.M_Info.LANG_TYPE, 'N');
    frmItemSearch.PnlFormName.Caption   := getLangString('010', 'pCodeSearch', 'Item Code Search', MainDm.M_Info.LANG_TYPE, 'N');
    frmItemSearch.PnlSelect.Caption     := getLangString('010', 'PInfo'      , 'Select Info', MainDm.M_Info.LANG_TYPE, 'N');
    frmItemSearch.lblCode.Caption       := getLangString('010', 'MAT_CODE'   , 'MAT Code', MainDm.M_Info.LANG_TYPE, 'N');
    frmItemSearch.lblSpec.Caption       := getLangString('010', 'MAT_SPEC'   , 'MAT Spec', MainDm.M_Info.LANG_TYPE, 'N');
    frmItemSearch.btnClose.Caption      := getLangString('010', 'bCLOSE'     , 'Close', MainDm.M_Info.LANG_TYPE, 'N');
    frmItemSearch.PnlSearchCode.Caption := getLangString('010', 'pCODE_SPEC' , 'Item Code/Spec', MainDm.M_Info.LANG_TYPE, 'N');
    frmItemSearch.PnlStockItem.Caption  := ' ' + getLangString('010', 'pSTOCK_ITEM', 'Items In Stock', MainDm.M_Info.LANG_TYPE, 'N');

    for i := 0 to frmItemSearch.dgInfo.Columns.Count-1 do
    begin
      if not frmItemSearch.dgInfo.Columns[i].Visible then Continue;
      frmItemSearch.dgInfo.Columns[i].Title.Caption := getLangString('010', frmItemSearch.dgInfo.Columns[i].FieldName, frmItemSearch.dgInfo.Columns[i].Title.Caption, MainDm.M_Info.LANG_TYPE, 'N');
    end;

    lblITEM_CODE1.Caption := '';
    lblITEM_CODE2.Caption := '';
    edtCode.SetFocus;
    SetItemList;
  except
    on E : Exception do
    begin
      InsertPGMHist('[Item Search]', 'E', 'FormActivate', 'Language', 'Exception Error', 'PGM', '', '', E.Message);
      TraceLogWrite('[Item Search] procedure FormActivate Fail || ERR['+E.Message+']');
    end;
  end;
end;

//==============================================================================
// FormDeactivate
//==============================================================================
procedure TfrmItemSearch.FormDeactivate(Sender: TObject);
begin
  qryInfo.Active := False;
end;

//==============================================================================
// FormClose
//==============================================================================
procedure TfrmItemSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryInfo.Active := False;

  Action := Cafree;
  try frmItemSearch := Nil ;
  except end;
end;

//==============================================================================
// btnCloseClick
//==============================================================================
procedure TfrmItemSearch.btnCloseClick(Sender: TObject);
begin
  Close;
end;

//==============================================================================
// SetItemList
//==============================================================================
procedure TfrmItemSearch.SetItemList;
var
  WhereStr, StrSQL : String;
begin
  try
    WhereStr := '' ;

    // 품목코드/품목명
    if (Trim(edtCode.Text) <> '') then
      WhereStr := WhereStr + ' AND ( (UPPER(T.MAT_CODE) LIKE ' + QuotedStr('%'+UpperCase(edtCode.Text)+'%')+ ') or ' +
                             '       (UPPER(T.MAT_SPEC) LIKE ' + QuotedStr('%'+UpperCase(edtCode.Text)+'%')+ ') ) ' ;

    // 재고있는품목
    if (cbSTOCK_EXIST.Checked) then
      WhereStr := WhereStr + ' AND T.QTY is NOT NULL  AND T.QTY <> 0 ' ;

    with qryInfo do
    begin
      Close;
      SQL.Clear;
      StrSQL := ' SELECT T.* ' +
                '   FROM (SELECT MAT_CODE, MAT_SPEC, WEIGHT, HEIGHT, ' +
                '                OT_DIAMETER, IN_DIAMETER, ' +
                '                NVL((SELECT COUNT(*) ' +
                '                       FROM W_STOCK_I S, C_RACK_I R ' +
                '                      WHERE S.GT_MAT_CODE = ITM.MAT_CODE ' +
                '                        AND S.RACK_NO = R.RACK_NO ' +
                '                        AND R.LUGG IN ( 1, 2 ) ' +
                '                        AND R.STATUS = 0 ' +
                '                      GROUP BY S.GT_MAT_CODE),0) QTY ' +
                '           FROM C_ITM_I ITM) T ' +
                '  WHERE 1=1 ' + WhereStr +
                '  ORDER BY T.MAT_CODE ' ;
      SQL.Text := StrSQL;
      Open;
    end;
  except
    on E : Exception do
    begin
      qryInfo.Close;
      InsertPGMHist('[Item Search]', 'E', 'SetItemList', 'Inquiry', 'Exception Error', 'SQL', StrSQL, '', E.Message);
      TraceLogWrite('[Item Search] procedure SetItemList(Popup) Fail || ERR['+E.Message+'], SQL['+StrSQL+']');
    end;
  end;
end;

//==============================================================================
// CheckBoxClick
//==============================================================================
procedure TfrmItemSearch.CheckBoxClick(Sender: TObject);
begin
  SetItemList;
end;

//==============================================================================
// edtCodeChange
//==============================================================================
procedure TfrmItemSearch.edtCodeChange(Sender: TObject);
begin
  SetItemList;
end;

//==============================================================================
// edtCodeKeyPress
//==============================================================================
procedure TfrmItemSearch.edtCodeKeyPress(Sender: TObject; var Key: Char);
begin
  if      (Key = #13) then SetItemList  // Enter
  else if (Key = #27) then Close;
end;

//==============================================================================
// CheckBoxClick
//==============================================================================
procedure TfrmItemSearch.dgInfoDblClick(Sender: TObject);
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;

  m.Popup_ItemInfo.DATA01 := qryInfo.FieldByName('MAT_CODE').AsString; // MAT 코드
  m.Popup_ItemInfo.DATA02 := qryInfo.FieldByName('MAT_SPEC').AsString; // MAT 사양
  m.Popup_ItemInfo.ResultCd := 'OK';
  qryInfo.Close;
  Close;
end;

//==============================================================================
// dgInfoCellClick
//==============================================================================
procedure TfrmItemSearch.dgInfoCellClick(Column: TColumnEh);
begin
  if not qryInfo.Active then Exit;
  if qryInfo.RecordCount < 1 then Exit;
  if dgInfo.SelectedRows.Count  < 1 then Exit;

  lblITEM_CODE1.Caption := qryInfo.FieldByName('MAT_CODE').AsString;
  lblITEM_CODE2.Caption := qryInfo.FieldByName('MAT_SPEC').AsString;
end;

//==============================================================================
// sbtClearClick
//==============================================================================
procedure TfrmItemSearch.sbtClearClick(Sender: TObject);
begin
  edtCode.Text := '';
  cbSTOCK_EXIST.Checked := False;
  lblITEM_CODE1.Caption := '';
  lblITEM_CODE1.Caption := '';
  dgInfo.SelectedRows.Clear;
  SetItemList;
end;

//==============================================================================
// dgInfoKeyPress
//==============================================================================
procedure TfrmItemSearch.dgInfoKeyPress(Sender: TObject; var Key: Char);
begin
  if (qryInfo.Active) and
     (qryInfo.RecordCount > 0) and
     (Key = #13) then
  begin
    dgInfoDblClick(nil);
  end else
  if (Key = #27) then Close;
end;

//==============================================================================
// dgInfoTitleClick
//==============================================================================
procedure TfrmItemSearch.dgInfoTitleClick(Column: TColumnEh);
begin
  if Column.Field.DataSet is TADOQuery then
  begin
    with TADOQuery(Column.Field.DataSet) do
    begin
      if RecordCount=0 then Exit ;
      if SrtFlag = 0 then
      begin
        SrtFlag := 1; Sort := Column.FieldName + ' DESC' ;
      end else
      begin
        SrtFlag := 0; Sort := Column.FieldName + ' ASC' ;
      end;
    end;
  end;
end;

end.
