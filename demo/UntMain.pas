unit UntMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.OleServer,
  Vcl.ExtCtrls,
  pdflib.core;

type

  TForm2 = class(TForm)
    btnNested_tables: TButton;
    btnCreatePdf: TButton;
    pnl2: TPanel;
    btnHello: TButton;
    procedure btnNested_tablesClick(Sender: TObject);
    procedure btnCreatePdfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnHelloClick(Sender: TObject);
  private
    FBitMap: TBitMap;
    pdf: TPdfLib;
    list: TStringList;
    /// <summary>
    /// 根据宽高得到一副位图
    /// </summary>
    /// <param name="AWidth">宽</param>
    /// <param name="AHeight">高</param>
    /// <returns>返回文件名</returns>
    function getImage(AWidth, AHeight: Integer): string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnCreatePdfClick(Sender: TObject);
  procedure AddOne;
  var
    font,gs_blendmode: Integer;
    text: string;
  begin
    pdf.begin_page_ext(900, 600, '');
    gs_blendmode := pdf.create_gstate('blendmode=Color');

    pdf.set_graphics_option('fillcolor=red gstate=' + gs_blendmode.ToString);
    pdf.rect(0,520,900,80);
    pdf.circle(450, 300, 150);
    pdf.fill();
    font := pdf.load_font('微软雅黑', 'unicode', '');
    pdf.setfont(font, 12);
    text:='我爱你，塞北的雪20';
    pdf.fit_textline(text, 100, 20, '');
    text:='我爱你，塞北的雪60';
    pdf.fit_textline(text, 100, 60, 'position={center bottom}');

    //pdf.set_graphics_option('fillcolor=black gstate=' + gs_blendmode.ToString);
    text:='*我爱你，塞北的雪*';
    pdf.fit_textline(text, 100, 90, 'boxsize={200 50} position=center fontsize=20 fitmethod=auto');
    pdf.fit_textline(text, 100, 150, '');
    pdf.end_page_ext('');
  end;

  procedure AddTwo;
  var
    font,gs_blendmode,tbl,row,col,tf: Integer;
    cellValue,tf_text: string;
    optlistFit,optlistFlow: string;
    optlist:array[1..6] of string;
    cWidth:array[1..6] of Integer;
  begin
    pdf.begin_page_ext(900, 600, '');

    tf_text := '它惊人地强壮，甚至可以做特技飞行。但它最适合滑翔。';

    cWidth[1] := 150;
    cWidth[2] := 200;
    cWidth[3] := 80;
    cWidth[4] := 70;
    cWidth[5] := 180;
    cWidth[6] := 80;

    var llx:double:=30;
    var lly:double:=30;
    var urx:double:=870;
    var ury:double:=570;
    // 避免错误
    pdf.set_option('errorpolicy=exception');

    font := pdf.load_font('微软雅黑', 'unicode', '');
    pdf.setfont(font, 12);
    gs_blendmode := pdf.create_gstate('blendmode=Color');
    pdf.set_graphics_option('fillcolor=green gstate=' + gs_blendmode.ToString);

    for col := 1 to 6 do  optlist[col]:='';

    optlistFlow := 'font=' + font.ToString + ' fontsize=8 leading=110%';

    optlist[1] := 'fittextline={position={left center} font=' + font.ToString
      + ' fontsize=8} margin=4 ' + 'colwidth=' + cWidth[1].ToString;
    optlist[2] := 'fittextline={position={right center} font=' + font.ToString
      + ' fontsize=10} margin=4 ' + 'colwidth=' + cWidth[2].ToString;
    optlist[3] := 'fittextline={position={left center} font=' + font.ToString
      + ' fontsize=8} margin=4 ' + 'colwidth=' + cWidth[3].ToString;
    optlist[4] := 'fittextline={position={right center} font=' + font.ToString
      + ' fontsize=8} margin=4 ' + 'colwidth=' + cWidth[4].ToString;
    optlist[6] := 'fittextline={position={left center} font=' + font.ToString
      + ' fontsize=8} margin=4 ' + 'colwidth=' + cWidth[6].ToString;

    tbl:= PdfInitialValue;
    for row := 1 to 5 do
    begin
      for col := 1 to 6 do
      begin
        cellValue:= Format('单元格：COL:%d,ROW:%d',[col, row]);
        if col=5 then
        begin
          tf := pdf.add_textflow(PdfInitialValue, tf_text, optlistFlow);
          optlist[5] := 'textflow=' + tf.ToString + ' margin=4 colwidth=' + cWidth[5].ToString;
          tbl := pdf.add_table_cell(tbl, col, row, '', optlist[col]);
        end else
          tbl := pdf.add_table_cell(tbl, col, row, cellValue, optlist[col]);
      end;
    end;

    optlistFit := 'stroke={{line=frame linewidth=0.4} {line=other linewidth=0.2}}';
    pdf.fit_table(tbl, llx, lly, urx, ury, optlistFit);
    pdf.end_page_ext('');
  end;
begin
  if pdf.begin_document('abc.pdf','') = PdfError then begin
      ShowMessage('Error: ' + pdf.get_errmsg());
      Exit;
  end;
  //第一页
  AddOne;
  //第二页
  AddTwo;
  pdf.end_document('');
end;

procedure TForm2.btnHelloClick(Sender: TObject);
var
  font: Integer;
  text: string;
begin
  if pdf.begin_document('hello.pdf','') = PdfError then begin
      ShowMessage('Error: ' + pdf.get_errmsg());
      Exit;
  end;
  pdf.begin_page_ext(900, 600, '');
  font := pdf.load_font('微软雅黑', 'unicode', '');
  pdf.setfont(font, 12);
  text:='我爱你，塞北的雪20';
  pdf.fit_textline(text, 100, 200, '');
  text:='我爱你，塞北的雪60';
  pdf.fit_textline(text, 100, 280, 'position={center bottom}');
  pdf.end_page_ext('');
  pdf.end_document('');
end;

procedure TForm2.btnNested_tablesClick(Sender: TObject);
var
  p: TPDFLib;
  pFont: Integer;
  function SubTableTemplate(AValue: Double; var AWidth,AHeight: Double): Integer;
  var
    fontsize :Double;
    margin :Integer;
  begin
    fontsize := 12.0;
    margin   := 3;
    Result:= p.begin_template_ext(0, 0, '');
    var R,C,tbl,image,ww: Integer;
    var cellValue,optList,imagefile: string;
    tbl:= PdfInitialValue;
    for R := 1 to 1 do
    begin
      for C := 1 to 2 do
      begin
        // 为模板子表添加一些单元格，并将其放入模板中
        if C=1 then
        begin
          cellValue:= '';
          ww:= Round(AValue);
          imagefile:= getImage(ww,15);
          image := p.load_image('auto', imagefile, '');
          if (image = -1) then
            raise Exception.Create('错误: ' + p.get_errmsg());

          optlist := 'image=' + image.ToString
            + ' colwidth=' + AValue.ToString //+ Format(' margin={0 %d}',[margin])
            + ' fittextline={font=' + pFont.ToString
            + ' fontsize=' + fontsize.ToString + '}';
           // +  ' matchbox={fillcolor={rgb 0.82 0.4 0.1}}';
        end else
        begin
          cellValue:= Format('%f',[AValue]);
          // 为模板子表添加一些单元格，并将其放入模板中  fontname=NotoSerif-Regular
          optList :=
              'fittextline={font=' + pFont.ToString
              + ' fontsize=' + fontsize.ToString + '} margin=' + margin.ToString;
        end;
        tbl := p.add_table_cell(tbl, C, R, cellValue, optList);
        if (tbl = -1) then
          raise Exception.Create('错误: ' + p.get_errmsg());
      end;
    end;
    var subTabOptlist := 'stroke={{line=other linewidth=0}} '
            //+ 'fill={{area=table fillcolor={rgb 1 0.9 0.9}}} '
            + 'position={left bottom}';
    p.fit_table(tbl, 0, 0, 1000, 1000, subTabOptlist);

    // 检索模板子表的宽度和高度  "fillcolor={#FFC0CB})"
    AWidth  := p.info_table(tbl, 'width');
    AHeight := p.info_table(tbl, 'height');

    // 在指定模板大小的同时完成模板
    p.end_template_ext(AWidth, AHeight);
    p.delete_table(tbl, '');
  end;
var
  {searchpath,}outfile,title: string;
  taboptlist2: string;
  addoptlist1, addoptlist2, fitoptlist1, textoptlist: string;
begin
  //searchpath := '../input';
  outfile := 'nested_tables.pdf';
  title := 'Nested Tables';

  var fontsize :Double := 14.0;
  var margin :Double := 5.0;
  var tabwidth1, tabheight1:Double;
  var pagewidth :Double := 800;
  var pageheight :Double := 500;
  var x,y,yoff: Double;
  x:= 20; y := 470; yoff := 10;
  var exitcode,gs_blendmode :Integer;
  exitcode:= 0;  gs_blendmode:=0;
  try
    p := TPDFLib.Create(nil);

    //p.set_option('license=0');
    p.set_parameter('compatibility', '1.7');
    //p.set_option('searchpath={' + searchpath + '}');

    // 这意味着我们必须检查load_font（）等的返回值。
    p.set_option('errorpolicy=return');

    if (p.begin_document(outfile, '') = PdfError) then
      raise Exception.Create('错误：'+p.get_errmsg());

    p.set_info('Creator', 'wdj');
    p.set_info('Title', title);
    p.begin_page_ext(pagewidth, pageheight, '');

    pFont := p.load_font('微软雅黑', 'unicode', '');
    p.setfont(pFont, 12);

    {放置子表。为了说明子表的范围
    首先单独输出它。此处仅需要“ewind=1”
    为了说明的目的。它将表重置为状态
    在上次调用fit_table（）之前，该调用已用于放置
    将表格放入模板中。否则，我们将无法放置
    }
    // 输出一些描述性文本   fontname=NotoSerif-Regular
    textoptlist := 'fontsize=' + fontsize.ToString
      +' font='+ pFont.ToString;


    // 输出一些描述性文本
    y :=y - yoff * 4;
    p.fit_textline('嵌套表、进度条:', x, y, textoptlist);

    {
    在外表中添加一些单元格。列宽设置为上面检索到的子表的表宽度。
    这个行高设置为已修改的子表的高度在上面检索。fontname=NotoSerif-Regular }
    addoptlist2 :=
        'fittextline={font=' + pFont.ToString + ' fontsize=' + fontsize.ToString
        + ' position={left center}} margin=' + margin.ToString
        + ' colwidth=150';
        //+ ' rowheight=' + tabheight1.ToString;

    var templ: Integer;
    var R,C,tbl: Integer;
    var cellValue: string;
    var rr,value: Double;
    Randomize;
    // 创建由十行三列组成的外部表
    tbl:= PdfInitialValue;
    for R := 1 to 10 do
    begin
      for C := 1 to 3 do
      begin
        cellValue:= Format('行:%d 列:%d',[R,C]);
        if (c=2) then
        begin
          rr:= Random;
          if rr<0.1 then
            rr:=0.1;
          value:= 300*rr;
          templ:= SubTableTemplate(value,tabwidth1, tabheight1);
          {
          添加另一个包含模板子表的单元格，以及
          一些灰色文本。“图像”选项提供模板。fontname=NotoSerif-Regular
           }
          addoptlist1 := 'image=' + templ.ToString
            +' fitimage={position={left center} fitmethod=meet}'
            + ' fittextline={font=' + pFont.ToString
            + ' fontsize=' + fontsize.ToString
            +' } colwidth=400'
            //+ Format(' margin=%d',[margin])
            + ' rowheight=' + tabheight1.ToString;
          tbl := p.add_table_cell(tbl, C, R, ' ', addoptlist1);
        end else
        begin
          tbl := p.add_table_cell(tbl, C, R, cellValue, addoptlist2);
        end;
        if (tbl = -1) then
          raise Exception.Create('错误: ' + p.get_errmsg());
      end;
    end;

    taboptlist2 := 'stroke={{line=other linewidth=0.1 } '
            + '{line=frame linewidth=1.0 }} ';
            //+ 'fill={{area=table fillcolor={rgb 0.9 0.9 1}}} ';
    y:= y - yoff;
    p.fit_table(tbl, x, 20, pagewidth - x, y, taboptlist2);

    p.end_page_ext('');
    p.end_document('');
  finally
    p.DisposeOf;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  pdf:= TPDFLib.Create(nil);
  //pdf.set_option('license=0');
  pdf.set_parameter('compatibility', '1.7');
  FBitMap:= TBitMap.Create(1,1);
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  pdf.DisposeOf;
  FBitMap.DisposeOf;
end;

function TForm2.getImage(AWidth, AHeight: Integer): string;
begin
  //FBitMap:= TBitMap.Create(AWidth, AHeight);
  //try
    FBitMap.Width := AWidth;
    FBitMap.Height:= AHeight;
    FBitMap.Canvas.Brush.Color:= clRed;
    FBitMap.Canvas.FloodFill(0,0,clRed,TFillStyle.fsBorder);
    //Result:=Format('cmei_bmp%dx%d.bmp',[AWidth, AHeight]);
    Result:='cmei_bmp.bmp';
    FBitMap.SaveToFile(Result);
  //finally
  //  FBitMap.DisposeOf;
 // end;
end;

end.
