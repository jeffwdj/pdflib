{*******************************************************}
{                                                       }
{       pdflib.core                                     }
{       版权所有 (C) 2022 wdj                           }
{                                                       }
{*******************************************************}

unit pdflib.core;

interface
uses System.Classes,System.SysUtils, pdflib.lib;

const
  PdfError        = -1;
  PdfInitialValue = -1;
  PdfTextChar     = #$80;

type
  IPDFLib = interface(IDispatch)
    ['{CAB96CA4-41D6-4241-B766-5BB9420DEBA0}']
    procedure activate_item(id: Integer);
    function add_bookmark(const text: AnsiString; parent: Integer; open: Integer): Integer;
    procedure add_launchlink(llx: Double; lly: Double; urx: Double; ury: Double;
                             const filename: AnsiString);
    procedure add_locallink(llx: Double; lly: Double; urx: Double; ury: Double; page: Integer;
                            const optlist: AnsiString);
    procedure add_nameddest(const name: AnsiString; const optlist: AnsiString);
    procedure add_note(llx: Double; lly: Double; urx: Double; ury: Double;
                       const contents: AnsiString; const title: AnsiString; const icon: AnsiString;
                       open: Integer);
    function add_path_point(path: Integer; x: Double; y: Double; const type_: AnsiString;
                            const optlist: AnsiString): Integer;
    procedure add_pdflink(llx: Double; lly: Double; urx: Double; ury: Double;
                          const filename: AnsiString; page: Integer; const optlist: AnsiString);
    function add_portfolio_file(folder: Integer; const filename: AnsiString;
                                const optlist: AnsiString): Integer;
    function add_portfolio_folder(parent: Integer; const foldername: AnsiString;
                                  const optlist: AnsiString): Integer;
    function add_table_cell(table: Integer; column: Integer; row: Integer; const text: AnsiString;
                            const optlist: AnsiString): Integer;
    function add_textflow(textflow: Integer; const text: AnsiString; const optlist: AnsiString): Integer;
    procedure add_thumbnail(image: Integer);
    procedure add_weblink(llx: Double; lly: Double; urx: Double; ury: Double; const url: AnsiString);
    procedure align(dx: Double; dy: Double);
    procedure arc(x: Double; y: Double; r: Double; alpha: Double; beta: Double);
    procedure arcn(x: Double; y: Double; r: Double; alpha: Double; beta: Double);
    procedure attach_file(llx: Double; lly: Double; urx: Double; ury: Double;
        const filename: AnsiString; const description: AnsiString;
        const author: AnsiString; const mimetype: AnsiString;
        const icon: AnsiString);
    function begin_document(const filename: AnsiString; const optlist: AnsiString): Integer;
    procedure begin_dpart(const optlist: AnsiString);
    procedure begin_font(const fontname: AnsiString; a: Double; b: Double; c: Double; d: Double;
                         e: Double; f: Double; const optlist: AnsiString);
    procedure begin_glyph(const glyphname: AnsiString; wx: Double; llx: Double; lly: Double;
                          urx: Double; ury: Double);
    procedure begin_glyph_ext(uv: Integer; const optlist: AnsiString);
    function begin_item(const tag: AnsiString; const optlist: AnsiString): Integer;
    procedure begin_layer(layer: Integer);
    procedure begin_mc(const tag: AnsiString; const optlist: AnsiString);
    procedure begin_page(width: Double; height: Double);
    procedure begin_page_ext(width: Double; height: Double; const optlist: AnsiString);
    function begin_pattern(width: Double; height: Double; xstep: Double; ystep: Double;
        painttype: Integer): Integer;
    function begin_template(width: Double; height: Double): Integer;
    function begin_template_ext(width: Double; height: Double; const optlist: AnsiString): Integer;
    procedure circle(x: Double; y: Double; r: Double);
    procedure pcircle(x: Double; y: Double; r: Double);
    procedure circular_arc(x_1: Double; y_1: Double; x_2: Double; y_2: Double);
    procedure clip;
    procedure close;
    procedure close_font(font: Integer);
    procedure close_graphics(graphics: Integer);
    procedure close_image(image: Integer);
    procedure close_pdi(doc: Integer);
    procedure close_pdi_document(doc: Integer);
    procedure close_pdi_page(page: Integer);
    procedure closepath;
    procedure closepath_fill_stroke;
    procedure closepath_stroke;
    procedure concat(a: Double; b: Double; c: Double; d: Double; e: Double; f: Double);
    procedure continue_text(const text: AnsiString);
    function create_3dview(const username: AnsiString; const optlist: AnsiString): Integer;
    function create_action(const type_: AnsiString; const optlist: AnsiString): Integer;
    procedure create_annotation(llx: Double; lly: Double; urx: Double; ury: Double;
        const type_: AnsiString; const optlist: AnsiString);
    function create_bookmark(const text: AnsiString; const optlist: AnsiString): Integer;
    procedure create_field(llx: Double; lly: Double; urx: Double; ury: Double;
        const name: AnsiString; const type_: AnsiString; const optlist: AnsiString);
    procedure create_fieldgroup(const name: AnsiString; const optlist: AnsiString);
    function create_gstate(const optlist: AnsiString): Integer;
    procedure create_pvf(const filename: AnsiString; const data: OleVariant;
        const optlist: AnsiString);
    function create_textflow(const text: AnsiString; const optlist: AnsiString): Integer;
    procedure curveto(x1: Double; y1: Double; x2: Double; y2: Double; x3: Double; y3: Double);
    function define_layer(const name: AnsiString; const optlist: AnsiString): Integer;
    procedure delete_path(path: Integer);
    function delete_pvf(const filename: AnsiString): Integer;
    procedure delete_table(table: Integer; const optlist: AnsiString);
    procedure delete_textflow(textflow: Integer);
    procedure draw_path(path: Integer; x: Double; y: Double; const optlist: AnsiString);
    procedure ellipse(x: Double; y: Double; rx: Double; ry: Double);
    procedure elliptical_arc(x: Double; y: Double; rx: Double; ry: Double;
        const optlist: AnsiString);
    procedure encoding_set_char(const encoding: AnsiString; slot: Integer;
        const glyphname: AnsiString; uv: Integer);
    procedure end_document(const optlist: AnsiString);
    procedure end_dpart(const optlist: AnsiString);
    procedure end_font;
    procedure end_glyph;
    procedure end_item(id: Integer);
    procedure end_layer;
    procedure end_mc;
    procedure end_page;
    procedure end_page_ext(const optlist: AnsiString);
    procedure end_pattern;
    procedure end_template;
    procedure end_template_ext(width: Double; height: Double);
    procedure endpath;
    procedure fill;
    function fill_graphicsblock(page: Integer; const blockname: AnsiString;
        graphics: Integer; const optlist: AnsiString): Integer;
    function fill_imageblock(page: Integer; const blockname: AnsiString; image: Integer;
        const optlist: AnsiString): Integer;
    function fill_pdfblock(page: Integer; const blockname: AnsiString; contents: Integer;
        const optlist: AnsiString): Integer;
    procedure fill_stroke;
    function fill_textblock(page: Integer; const blockname: AnsiString;
       const text: AnsiString; const optlist: AnsiString): Integer;
    function findfont(const fontname: AnsiString; const encoding: AnsiString; options: Integer): Integer;
    procedure fit_graphics(graphics: Integer; x: Double; y: Double; const optlist: AnsiString);
    procedure fit_image(image: Integer; x: Double; y: Double; const optlist: AnsiString);
    procedure fit_pdi_page(page: Integer; x: Double; y: Double; const optlist: AnsiString);
    function fit_table(table: Integer; llx: Double; lly: Double; urx: Double; ury: Double;
        const optlist: AnsiString): AnsiString;
    function fit_textflow(textflow: Integer; llx: Double; lly: Double;
        urx: Double; ury: Double; const optlist: AnsiString): AnsiString;
    procedure fit_textline(const text: AnsiString; x: Double; y: Double;
        const optlist: AnsiString);
    function get_apiname: AnsiString;
    function get_buffer: AnsiString;
    function get_errmsg: AnsiString;
    function get_errnum: Integer;
    function get_option(const keyword: AnsiString; const optlist: AnsiString): Double;
    function get_parameter(const key: AnsiString; modifier: Double): AnsiString;
    function get_pdi_parameter(const key: AnsiString; doc: Integer; page: Integer; reserved: Integer): AnsiString;
    function get_pdi_value(const key: AnsiString; doc: Integer; page: Integer; reserved: Integer): Double;
    function get_AnsiString(idx: Integer; const optlist: AnsiString): AnsiString;
    function get_value(const key: AnsiString; modifier: Double): Double;
    function get_unicode_format(): TPdfUnicodeFormat;
    function info_font(font: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_graphics(graphics: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_image(image: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_matchbox(const boxname: AnsiString; num: Integer; const keyword: AnsiString): Double;
    function info_path(path: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_pdi_page(page: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_pvf(const filename: AnsiString; const keyword: AnsiString): Double;
    function info_table(table: Integer; const keyword: AnsiString): Double;
    function info_textflow(textflow: Integer; const keyword: AnsiString): Double;
    function info_textline(const text: AnsiString; const keyword: AnsiString;
        const optlist: AnsiString): Double;
    procedure initgraphics;
    procedure lineto(x: Double; y: Double);
    function load_asset(const type_: AnsiString; const filename: AnsiString;
        const optlist: AnsiString): Integer;
    function load_font(const fontname: AnsiString; encoding,
        optlist: AnsiString): Integer;
    function load_graphics(const type_: AnsiString; const filename: AnsiString;
        const optlist: AnsiString): Integer;
    function load_iccprofile(const profilename: AnsiString; const optlist: AnsiString): Integer;
    function load_3ddata(const filename: AnsiString; const optlist: AnsiString): Integer;
    function load_image(const imagetype: AnsiString; const filename: AnsiString;
        const optlist: AnsiString): Integer;
    function makespotcolor(const spotname: AnsiString): Integer;
    procedure mc_point(const tag: AnsiString; const optlist: AnsiString);
    procedure moveto(x: Double; y: Double);
    function open_CCITT(const filename: AnsiString; width: Integer; height: Integer;
        BitReverse: Integer; K: Integer; BlackIs1: Integer): Integer;
    function open_file(const filename: AnsiString): Integer;
    function open_image(const imagetype: AnsiString; const source: AnsiString;
        const data: AnsiString; length: Integer; width: Integer; height: Integer;
        components: Integer; bpc: Integer; const params: AnsiString): Integer;
    function open_image_file(const imagetype: AnsiString; const filename: AnsiString;
        const AnsiStringparam: AnsiString; intparam: Integer): Integer;
    function open_pdi(const filename: AnsiString; const AnsiStringparam: AnsiString; reserved: Integer): Integer;
    function open_pdi_document(const filename: AnsiString; const AnsiStringparam: AnsiString): Integer;
    function open_pdi_page(doc: Integer; pagenumber: Integer; const optlist: AnsiString): Integer;
    function pcos_get_number(page: Integer; const path: AnsiString): Double;
    function pcos_get_stream(page: Integer; const optlist: AnsiString; const path: AnsiString): OleVariant;
    function pcos_get_AnsiString(page: Integer; const path: AnsiString): AnsiString;
    procedure place_image(image: Integer; x: Double; y: Double; scale: Double);
    procedure place_pdi_page(page: Integer; x: Double; y: Double; sx: Double; sy: Double);
    procedure poca_delete(container: Integer; const optlist: AnsiString);
    procedure poca_insert(container: Integer; const optlist: AnsiString);
    function poca_new(const optlist: AnsiString): Integer;
    procedure poca_remove(container: Integer; const optlist: AnsiString);
    function process_pdi(doc: Integer; page: Integer; const optlist: AnsiString): Integer;
    procedure rect(x: Double; y: Double; width: Double; height: Double);
    procedure restore;
    procedure resume_page(const optlist: AnsiString);
    procedure rotate(phi: Double);
    procedure save;
    procedure scale(sx: Double; sy: Double);
    procedure pscale(sx: Double; sy: Double);
    procedure set_border_color(red: Double; green: Double; blue: Double);
    procedure set_border_dash(b: Double; w: Double);
    procedure set_border_style(const style: AnsiString; width: Double);
    procedure set_graphics_option(const optlist: AnsiString);
    procedure set_gstate(gstate: Integer);
    procedure set_info(const key: AnsiString; const value: AnsiString);
    procedure set_layer_dependency(const type_: AnsiString; const optlist: AnsiString);
    procedure set_option(const optlist: AnsiString);
    procedure set_parameter(const key: AnsiString; const value: AnsiString);
    procedure set_text_option(const optlist: AnsiString);
    procedure set_text_pos(x: Double; y: Double);
    procedure set_value(const key: AnsiString; value: Double);
    procedure setcolor(const fstype: AnsiString; const colorspace: AnsiString;
        c1: Double; c2: Double; c3: Double; c4: Double);
    procedure setdash(b: Double; w: Double);
    procedure setdashpattern(const optlist: AnsiString);
    procedure setflat(flatness: Double);
    procedure setfont(font: Integer; fontsize: Double);
    procedure setlinecap(linecap: Integer);
    procedure setlinejoin(linejoin: Integer);
    procedure setlinewidth(width: Double);
    procedure setmatrix(a: Double; b: Double; c: Double; d: Double; e: Double; f: Double);
    procedure setmiterlimit(miter: Double);
    procedure setpolydash(const darray: OleVariant);
    function shading(const shtype: AnsiString; x0: Double; y0: Double; x1: Double; y1: Double;
        c1: Double; c2: Double; c3: Double; c4: Double; const optlist: AnsiString): Integer;
    function shading_pattern(shading: Integer; const optlist: AnsiString): Integer;
    procedure shfill(shading: Integer);
    procedure show(const text: AnsiString);
    function show_boxed(const text: AnsiString; x: Double; y: Double; width: Double;
        height: Double; const hmode: AnsiString; const feature: AnsiString): Integer;
    procedure show_xy(const text: AnsiString; x: Double; y: Double);
    procedure skew(alpha: Double; beta: Double);
    function AnsiStringwidth(const text: AnsiString; font: Integer; fontsize: Double): Double;
    procedure stroke;
    procedure suspend_page(const optlist: AnsiString);
    procedure translate(tx: Double; ty: Double);
    function convert_to_unicode(const inputformat: AnsiString; const input: AnsiString;
        const optlist: AnsiString): AnsiString;
    function begin_pattern_ext(width: Double; height: Double; const optlist: AnsiString): Integer;
    function create_devicen(const optlist: AnsiString): Integer;
  end;

  /// <summary>
  /// PDFLib 库实现部分
  /// </summary>
  TPdfLib=class(TComponent, IPDFLib)
  private
    FPDF: PDF;
    function Utf8bom(AValue: ansiString): ansiString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure activate_item(id: Integer);
    function add_bookmark(const text: AnsiString; parent: Integer; open: Integer): Integer;
    procedure add_launchlink(llx: Double; lly: Double; urx: Double; ury: Double;
       const filename: AnsiString);
    procedure add_locallink(llx: Double; lly: Double; urx: Double; ury: Double; page: Integer;
       const optlist: AnsiString);
    procedure add_nameddest(const name: AnsiString; const optlist: AnsiString);
    procedure add_note(llx: Double; lly: Double; urx: Double; ury: Double;
       const contents: AnsiString; const title: AnsiString; const icon: AnsiString;
       open: Integer);
    function add_path_point(path: Integer; x: Double; y: Double; const type_: AnsiString;
       const optlist: AnsiString): Integer;
    procedure add_pdflink(llx: Double; lly: Double; urx: Double; ury: Double;
       const filename: AnsiString; page: Integer; const optlist: AnsiString);
    function add_portfolio_file(folder: Integer; const filename: AnsiString;
       const optlist: AnsiString): Integer;
    function add_portfolio_folder(parent: Integer; const foldername: AnsiString;
       const optlist: AnsiString): Integer;
    function add_table_cell(table: Integer; column: Integer; row: Integer; const text: AnsiString;
       const optlist: AnsiString): Integer;
    function add_textflow(textflow: Integer; const text: AnsiString; const optlist: AnsiString): Integer;
    procedure add_thumbnail(image: Integer);
    procedure add_weblink(llx: Double; lly: Double; urx: Double; ury: Double; const url: AnsiString);
    procedure align(dx: Double; dy: Double);
    procedure arc(x: Double; y: Double; r: Double; alpha: Double; beta: Double);
    procedure arcn(x: Double; y: Double; r: Double; alpha: Double; beta: Double);
    procedure attach_file(llx: Double; lly: Double; urx: Double; ury: Double;
        const filename: AnsiString; const description: AnsiString;
        const author: AnsiString; const mimetype: AnsiString;
        const icon: AnsiString);
    function begin_document(const filename: AnsiString; const optlist: AnsiString): Integer;
    procedure begin_dpart(const optlist: AnsiString);
    procedure begin_font(const fontname: AnsiString; a: Double; b: Double; c: Double; d: Double;
        e: Double; f: Double; const optlist: AnsiString);
    procedure begin_glyph(const glyphname: AnsiString; wx: Double;
        llx: Double; lly: Double; urx: Double; ury: Double);
    procedure begin_glyph_ext(uv: Integer; const optlist: AnsiString);
    function begin_item(const tag: AnsiString; const optlist: AnsiString): Integer;
    procedure begin_layer(layer: Integer);
    procedure begin_mc(const tag: AnsiString; const optlist: AnsiString);
    procedure begin_page(width: Double; height: Double);
    procedure begin_page_ext(width: Double; height: Double; const optlist: AnsiString);
    function begin_pattern(width: Double; height: Double; xstep: Double; ystep: Double;
        painttype: Integer): Integer;
    function begin_template(width: Double; height: Double): Integer;
    function begin_template_ext(width: Double; height: Double; const optlist: AnsiString): Integer;
    procedure circle(x: Double; y: Double; r: Double);
    procedure pcircle(x: Double; y: Double; r: Double);
    procedure circular_arc(x_1: Double; y_1: Double; x_2: Double; y_2: Double);
    procedure clip;
    procedure close;
    procedure close_font(font: Integer);
    procedure close_graphics(graphics: Integer);
    procedure close_image(image: Integer);
    procedure close_pdi(doc: Integer);
    procedure close_pdi_document(doc: Integer);
    procedure close_pdi_page(page: Integer);
    procedure closepath;
    procedure closepath_fill_stroke;
    procedure closepath_stroke;
    procedure concat(a: Double; b: Double; c: Double; d: Double; e: Double; f: Double);
    procedure continue_text(const text: AnsiString);
    function create_3dview(const username: AnsiString; const optlist: AnsiString): Integer;
    function create_action(const type_: AnsiString; const optlist: AnsiString): Integer;
    procedure create_annotation(llx: Double; lly: Double; urx: Double; ury: Double;
        const type_: AnsiString; const optlist: AnsiString);
    function create_bookmark(const text: AnsiString; const optlist: AnsiString): Integer;
    procedure create_field(llx: Double; lly: Double; urx: Double; ury: Double;
        const name: AnsiString; const type_: AnsiString; const optlist: AnsiString);
    procedure create_fieldgroup(const name: AnsiString; const optlist: AnsiString);
    function create_gstate(const optlist: AnsiString): Integer;
    procedure create_pvf(const filename: AnsiString; const data: OleVariant;
        const optlist: AnsiString);
    function create_textflow(const text: AnsiString; const optlist: AnsiString): Integer;
    procedure curveto(x1: Double; y1: Double; x2: Double; y2: Double; x3: Double; y3: Double);
    function define_layer(const name: AnsiString; const optlist: AnsiString): Integer;
    procedure delete_path(path: Integer);
    function delete_pvf(const filename: AnsiString): Integer;
    procedure delete_table(table: Integer; const optlist: AnsiString);
    procedure delete_textflow(textflow: Integer);
    procedure draw_path(path: Integer; x: Double; y: Double; const optlist: AnsiString);
    procedure ellipse(x: Double; y: Double; rx: Double; ry: Double);
    procedure elliptical_arc(x: Double; y: Double; rx: Double; ry: Double; const optlist: AnsiString);
    procedure encoding_set_char(const encoding: AnsiString; slot: Integer;
        const glyphname: AnsiString; uv: Integer);
    procedure end_document(const optlist: AnsiString);
    procedure end_dpart(const optlist: AnsiString);
    procedure end_font;
    procedure end_glyph;
    procedure end_item(id: Integer);
    procedure end_layer;
    procedure end_mc;
    procedure end_page;
    procedure end_page_ext(const optlist: AnsiString);
    procedure end_pattern;
    procedure end_template;
    procedure end_template_ext(width: Double; height: Double);
    procedure endpath;
    procedure fill;
    function fill_graphicsblock(page: Integer; const blockname: AnsiString;
        graphics: Integer; const optlist: AnsiString): Integer;
    function fill_imageblock(page: Integer; const blockname: AnsiString; image: Integer;
        const optlist: AnsiString): Integer;
    function fill_pdfblock(page: Integer; const blockname: AnsiString;
        contents: Integer; const optlist: AnsiString): Integer;
    procedure fill_stroke;
    function fill_textblock(page: Integer; const blockname: AnsiString;
        const text: AnsiString; const optlist: AnsiString): Integer;
    function findfont(const fontname: AnsiString; const encoding: AnsiString; options: Integer): Integer;
    procedure fit_graphics(graphics: Integer; x: Double; y: Double; const optlist: AnsiString);
    procedure fit_image(image: Integer; x: Double; y: Double; const optlist: AnsiString);
    procedure fit_pdi_page(page: Integer; x: Double; y: Double; const optlist: AnsiString);
    function fit_table(table: Integer; llx: Double; lly: Double; urx: Double; ury: Double;
        const optlist: AnsiString): AnsiString;
    function fit_textflow(textflow: Integer; llx: Double; lly: Double; urx: Double; ury: Double;
        const optlist: AnsiString): AnsiString;
    procedure fit_textline(const text: AnsiString; x: Double; y: Double; const optlist: AnsiString);
    function get_apiname: AnsiString;
    function get_buffer: AnsiString;
    function get_errmsg: AnsiString;
    function get_errnum: Integer;
    function get_option(const keyword: AnsiString; const optlist: AnsiString): Double;
    function get_parameter(const key: AnsiString; modifier: Double): AnsiString;
    function get_pdi_parameter(const key: AnsiString; doc: Integer; page: Integer; reserved: Integer): AnsiString;
    function get_pdi_value(const key: AnsiString; doc: Integer; page: Integer; reserved: Integer): Double;
    function get_AnsiString(idx: Integer; const optlist: AnsiString): AnsiString;
    function get_value(const key: AnsiString; modifier: Double): Double;
    function get_unicode_format(): TPdfUnicodeFormat;
    function info_font(font: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_graphics(graphics: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_image(image: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_matchbox(const boxname: AnsiString; num: Integer; const keyword: AnsiString): Double;
    function info_path(path: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_pdi_page(page: Integer; const keyword: AnsiString; const optlist: AnsiString): Double;
    function info_pvf(const filename: AnsiString; const keyword: AnsiString): Double;
    function info_table(table: Integer; const keyword: AnsiString): Double;
    function info_textflow(textflow: Integer; const keyword: AnsiString): Double;
    function info_textline(const text: AnsiString; const keyword: AnsiString;
        const optlist: AnsiString): Double;
    procedure initgraphics;
    procedure lineto(x: Double; y: Double);
    function load_asset(const type_: AnsiString; const filename: AnsiString;
          const optlist: AnsiString): Integer;
    function load_font(const fontname: AnsiString; encoding,
          optlist: AnsiString): Integer;
    function load_graphics(const type_: AnsiString; const filename: AnsiString;
        const optlist: AnsiString): Integer;
    function load_iccprofile(const profilename: AnsiString; const optlist: AnsiString): Integer;
    function load_3ddata(const filename: AnsiString; const optlist: AnsiString): Integer;
    function load_image(const imagetype: AnsiString; const filename: AnsiString;
        const optlist: AnsiString): Integer;
    function makespotcolor(const spotname: AnsiString): Integer;
    procedure mc_point(const tag: AnsiString; const optlist: AnsiString);
    procedure moveto(x: Double; y: Double);
    function open_CCITT(const filename: AnsiString; width: Integer; height: Integer;
        BitReverse: Integer; K: Integer; BlackIs1: Integer): Integer;
    function open_file(const filename: AnsiString): Integer;
    function open_image(const imagetype: AnsiString; const source: AnsiString;
       const data: AnsiString; length: Integer; width: Integer; height: Integer;
       components: Integer; bpc: Integer; const params: AnsiString): Integer;
    function open_image_file(const imagetype: AnsiString; const filename: AnsiString;
       const optlist: AnsiString; intparam: Integer): Integer;
    function open_pdi(const filename: AnsiString; const optlist: AnsiString; reserved: Integer): Integer;
    function open_pdi_document(const filename: AnsiString; const optlist: AnsiString): Integer;
    function open_pdi_page(doc: Integer; pagenumber: Integer; const optlist: AnsiString): Integer;
    function pcos_get_number(page: Integer; const path: AnsiString): Double;
    function pcos_get_stream(page: Integer; const optlist: AnsiString; const path: AnsiString): OleVariant;
    function pcos_get_AnsiString(page: Integer; const path: AnsiString): AnsiString;
    procedure place_image(image: Integer; x: Double; y: Double; scale: Double);
    procedure place_pdi_page(page: Integer; x: Double; y: Double; sx: Double; sy: Double);
    procedure poca_delete(container: Integer; const optlist: AnsiString);
    procedure poca_insert(container: Integer; const optlist: AnsiString);
    function poca_new(const optlist: AnsiString): Integer;
    procedure poca_remove(container: Integer; const optlist: AnsiString);
    function process_pdi(doc: Integer; page: Integer; const optlist: AnsiString): Integer;
    procedure rect(x: Double; y: Double; width: Double; height: Double);
    procedure restore;
    procedure resume_page(const optlist: AnsiString);
    procedure rotate(phi: Double);
    procedure save;
    procedure scale(sx: Double; sy: Double);
    procedure pscale(sx: Double; sy: Double);
    procedure set_border_color(red: Double; green: Double; blue: Double);
    procedure set_border_dash(b: Double; w: Double);
    procedure set_border_style(const style: AnsiString; width: Double);
    procedure set_graphics_option(const optlist: AnsiString);
    procedure set_gstate(gstate: Integer);
    procedure set_info(const key: AnsiString; const value: AnsiString);
    procedure set_layer_dependency(const type_: AnsiString; const optlist: AnsiString);
    procedure set_option(const optlist: AnsiString);
    procedure set_parameter(const key: AnsiString; const value: AnsiString);
    procedure set_text_option(const optlist: AnsiString);
    procedure set_text_pos(x: Double; y: Double);
    procedure set_value(const key: AnsiString; value: Double);
    procedure setcolor(const fstype: AnsiString; const colorspace: AnsiString;
        c1: Double; c2: Double; c3: Double; c4: Double);
    procedure setdash(b: Double; w: Double);
    procedure setdashpattern(const optlist: AnsiString);
    procedure setflat(flatness: Double);
    procedure setfont(font: Integer; fontsize: Double);
    procedure setlinecap(linecap: Integer);
    procedure setlinejoin(linejoin: Integer);
    procedure setlinewidth(width: Double);
    procedure setmatrix(a: Double; b: Double; c: Double; d: Double; e: Double; f: Double);
    procedure setmiterlimit(miter: Double);
    procedure setpolydash(const darray: OleVariant);
    function shading(const shtype: AnsiString; x0: Double; y0: Double;
        x1: Double; y1: Double; c1: Double; c2: Double; c3: Double; c4: Double; const optlist: AnsiString): Integer;
    function shading_pattern(shading: Integer; const optlist: AnsiString): Integer;
    procedure shfill(shading: Integer);
    procedure show(const text: AnsiString);
    function show_boxed(const text: AnsiString; x: Double; y: Double; width: Double;
        height: Double; const hmode: AnsiString; const feature: AnsiString): Integer;
    procedure show_xy(const text: AnsiString; x: Double; y: Double);
    procedure skew(alpha: Double; beta: Double);
    function AnsiStringwidth(const text: AnsiString; font: Integer; fontsize: Double): Double;
    procedure stroke;
    procedure suspend_page(const optlist: AnsiString);
    procedure translate(tx: Double; ty: Double);
    function convert_to_unicode(const inputformat: AnsiString; const input: AnsiString;
        const optlist: AnsiString): AnsiString;
    function begin_pattern_ext(width: Double; height: Double; const optlist: AnsiString): Integer;
    function create_devicen(const optlist: AnsiString): Integer;
  end;
procedure Register;

implementation

{ TPdfLib }

procedure Register;
begin
  RegisterComponents('pdf', [TPDFLib]);
end;

procedure TPdfLib.activate_item(id: Integer);
begin
  PDF_activate_item(FPDF, id);
end;

function TPdfLib.add_bookmark(const text: AnsiString; parent,
  open: Integer): Integer;
var
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  Result:= PDF_add_bookmark(FPDF, PAnsiChar(tempText), parent, open);
end;

procedure TPdfLib.add_launchlink(llx, lly, urx, ury: Double;
  const filename: AnsiString);
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  PDF_add_launchlink(FPDF, llx, lly, urx, ury, PAnsiChar(temp));
end;

procedure TPdfLib.add_locallink(llx, lly, urx, ury: Double; page: Integer;
  const optlist: AnsiString);
begin
  PDF_add_locallink(FPDF, llx, lly, urx, ury, page, PAnsiChar(optlist));
end;

procedure TPdfLib.add_nameddest(const name, optlist: AnsiString);
var
  temp: AnsiString;
begin
  temp:= Utf8bom(name);
  PDF_add_nameddest(FPDF, PAnsiChar(temp), 0, PAnsiChar(optlist))
end;

procedure TPdfLib.add_note(llx, lly, urx, ury: Double; const contents, title,
  icon: AnsiString; open: Integer);
var
  tc,tt,ti: AnsiString;
begin
  tc:= Utf8bom(contents);
  tt:= Utf8bom(title);
  ti:= Utf8bom(icon);
  PDF_add_note(FPDF, llx, lly, urx, ury, PAnsiChar(tc), PAnsiChar(tt), PAnsiChar(ti), open);
end;

function TPdfLib.add_path_point(path: Integer; x, y: Double; const type_,
  optlist: AnsiString): Integer;
begin
  Result:= PDF_add_path_point(FPDF, path, x, y, PAnsiChar(type_),PAnsiChar(optlist));
end;

procedure TPdfLib.add_pdflink(llx, lly, urx, ury: Double;
  const filename: AnsiString; page: Integer; const optlist: AnsiString);
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  PDF_add_pdflink(FPDF, llx, lly, urx, ury, PAnsiChar(temp), page, PAnsiChar(optlist));
end;

function TPdfLib.add_portfolio_file(folder: Integer; const filename,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_add_portfolio_file(FPDF, folder, PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.add_portfolio_folder(parent: Integer; const foldername,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(foldername);
  Result:= PDF_add_portfolio_folder(FPDF, parent, PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.add_table_cell(table, column, row: Integer; const text,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(text);
  Result:= PDF_add_table_cell(FPDF, table, column, row,
    PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.add_textflow(textflow: Integer; const text,
  optlist: AnsiString): Integer;
var
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  Result:= PDF_add_textflow(FPDF, textflow, PAnsiChar(tempText), 0, PAnsiChar(optlist));
end;

procedure TPdfLib.add_thumbnail(image: Integer);
begin
  PDF_add_thumbnail(FPDF, image);
end;

procedure TPdfLib.add_weblink(llx, lly, urx, ury: Double;
  const url: AnsiString);
var
  tempUrl: AnsiString;
begin
  tempUrl:= Utf8bom(url);
  PDF_add_weblink(FPDF, llx, lly, urx, ury, PAnsiChar(tempUrl));
end;

procedure TPdfLib.align(dx, dy: Double);
begin
  PDF_align(FPDF, dx, dy);
end;

procedure TPdfLib.arc(x, y, r, alpha, beta: Double);
begin
  PDF_arc(FPDF, x, y, r, alpha, beta);
end;

procedure TPdfLib.arcn(x, y, r, alpha, beta: Double);
begin
  PDF_arcn(FPDF, x, y, r, alpha, beta);
end;

procedure TPdfLib.attach_file(llx, lly, urx, ury: Double; const filename,
  description, author, mimetype, icon: AnsiString);
var
  tf,td,ta,tm,ti: AnsiString;
begin
  tf:= Utf8bom(filename);
  td:= Utf8bom(description);
  ta:= Utf8bom(author);
  tm:= Utf8bom(mimetype);
  ti:= Utf8bom(icon);
  PDF_attach_file(FPDF, llx, lly, urx, ury, PAnsiChar(tf), PAnsiChar(td),
      PAnsiChar(ta), PAnsiChar(tm), PAnsiChar(ti));
end;

function TPdfLib.begin_document(const filename, optlist: AnsiString): Integer;
var
  tempFileName: AnsiString;
begin
  tempFileName:= Utf8bom(filename);
  Result:= PDF_begin_document(FPDF, PAnsiChar(tempFileName) ,0 , PAnsiChar(optlist));
end;

procedure TPdfLib.begin_dpart(const optlist: AnsiString);
begin
  PDF_begin_dpart(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.begin_font(const fontname: AnsiString; a, b, c, d, e,
  f: Double; const optlist: AnsiString);
var
  tempFontName: AnsiString;
begin
  tempFontName:= Utf8bom(fontname);
  PDF_begin_font(FPDF, PAnsiChar(tempFontName), 0, a, b, c, d, e, f, PAnsiChar(optlist));
end;

procedure TPdfLib.begin_glyph(const glyphname: AnsiString; wx, llx, lly, urx,
  ury: Double);
begin
  PDF_begin_glyph(FPDF, PAnsiChar(glyphname), wx, llx, lly, urx, ury)
end;

procedure TPdfLib.begin_glyph_ext(uv: Integer; const optlist: AnsiString);
begin
  PDF_begin_glyph_ext(FPDF, uv, PAnsiChar(optlist));
end;

function TPdfLib.begin_item(const tag, optlist: AnsiString): Integer;
begin
  Result:= PDF_begin_item(FPDF, PAnsiChar(tag), PAnsiChar(optlist));
end;

procedure TPdfLib.begin_layer(layer: Integer);
begin
  PDF_begin_layer(FPDF, layer);
end;

procedure TPdfLib.begin_mc(const tag, optlist: AnsiString);
begin
  PDF_begin_mc(FPDF, PAnsiChar(tag), PAnsiChar(optlist));
end;

procedure TPdfLib.begin_page(width, height: Double);
begin
  PDF_begin_page(FPDF, width, height);
end;

procedure TPdfLib.begin_page_ext(width, height: Double;
  const optlist: AnsiString);
begin
  PDF_begin_page_ext(FPDF, width, height, PAnsiChar(optlist));
end;

function TPdfLib.begin_pattern(width, height, xstep, ystep: Double;
  painttype: Integer): Integer;
begin
  Result:= PDF_begin_pattern(FPDF, width, height, xstep, ystep, painttype);
end;

function TPdfLib.begin_pattern_ext(width, height: Double;
  const optlist: AnsiString): Integer;
begin
  Result:= PDF_begin_pattern_ext(FPDF, width, height, PAnsiChar(optlist));
end;

function TPdfLib.begin_template(width, height: Double): Integer;
begin
  Result:= PDF_begin_template(FPDF, width, height);
end;

function TPdfLib.begin_template_ext(width, height: Double;
  const optlist: AnsiString): Integer;
begin
  Result:= PDF_begin_template_ext(FPDF, width, height, PAnsiChar(optlist));
end;

procedure TPdfLib.circle(x, y, r: Double);
begin
  PDF_circle(FPDF, x, y, r);
end;

procedure TPdfLib.circular_arc(x_1, y_1, x_2, y_2: Double);
begin
  PDF_circular_arc(FPDF, x_1, y_1, x_2, y_2);
end;

procedure TPdfLib.clip;
begin
  PDF_clip(FPDF);
end;

procedure TPdfLib.close;
begin
  PDF_close(FPDF);
end;

procedure TPdfLib.closepath;
begin
  PDF_closepath(FPDF);
end;

procedure TPdfLib.closepath_fill_stroke;
begin
  PDF_closepath_fill_stroke(FPDF);
end;

procedure TPdfLib.closepath_stroke;
begin
  PDF_closepath_stroke(FPDF);
end;

procedure TPdfLib.close_font(font: Integer);
begin
  PDF_close_font(FPDF, font)
end;

procedure TPdfLib.close_graphics(graphics: Integer);
begin
  PDF_close_graphics(FPDF, graphics)
end;

procedure TPdfLib.close_image(image: Integer);
begin
  PDF_close_image(FPDF, image)
end;

procedure TPdfLib.close_pdi(doc: Integer);
begin
  PDF_close_pdi(FPDF, doc)
end;

procedure TPdfLib.close_pdi_document(doc: Integer);
begin
  PDF_close_pdi_document(FPDF, doc);
end;

procedure TPdfLib.close_pdi_page(page: Integer);
begin
  PDF_close_pdi_page(FPDF, page)
end;

procedure TPdfLib.concat(a, b, c, d, e, f: Double);
begin
  PDF_concat(FPDF, a, b, c, d, e, f)
end;

procedure TPdfLib.continue_text(const text: AnsiString);
var
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  PDF_continue_text(FPDF, PAnsiChar(tempText))
end;

function TPdfLib.convert_to_unicode(const inputformat: AnsiString;
  const input: AnsiString; const optlist: AnsiString): AnsiString;
var
  tempInput: AnsiString;
  pSize: Integer;
begin
  tempInput:= Utf8bom(input);
  Result:= PDF_convert_to_unicode(FPDF ,PAnsiChar(inputformat),
     PAnsiChar(tempInput), 0, pSize, PAnsiChar(optlist));
end;

constructor TPdfLib.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPDF:= PDF_new;
  set_option('stringformat=utf8');
  set_parameter('compatibility', '1.7');
end;

function TPdfLib.create_3dview(const username, optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(username);
  Result:= PDF_create_3dview(FPDF, PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.create_action(const type_, optlist: AnsiString): Integer;
begin
  Result:= PDF_create_action(FPDF, PAnsiChar(type_), PAnsiChar(optlist))
end;

procedure TPdfLib.create_annotation(llx, lly, urx, ury: Double; const type_,
  optlist: AnsiString);
begin
  PDF_create_annotation(FPDF, llx, lly, urx, ury, PAnsiChar(type_), PAnsiChar(optlist));
end;

function TPdfLib.create_bookmark(const text, optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(text);
  Result:= PDF_create_bookmark(FPDF, PAnsiChar(temp), 0, PAnsiChar(optlist))
end;

function TPdfLib.create_devicen(const optlist: AnsiString): Integer;
begin
  Result:= PDF_create_devicen(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.create_field(llx, lly, urx, ury: Double; const name, type_,
  optlist: AnsiString);
var
  temp: AnsiString;
begin
  temp:= Utf8bom(name);
  PDF_create_field(FPDF, llx, lly, urx, ury, PAnsiChar(temp), 0,PAnsiChar(type_),PAnsiChar(optlist));
end;

procedure TPdfLib.create_fieldgroup(const name, optlist: AnsiString);
var
  temp: AnsiString;
begin
  temp:= Utf8bom(name);
  PDF_create_fieldgroup(FPDF, PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.create_gstate(const optlist: AnsiString): Integer;
begin
  Result:= PDF_create_gstate(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.create_pvf(const filename: AnsiString; const data: OleVariant;
  const optlist: AnsiString);
var
  tempFileName: AnsiString;
  tempData: AnsiString;
begin
  tempFileName:= Utf8bom(filename);
  tempData:= Utf8bom(data);
  PDF_create_pvf(FPDF, PAnsiChar(tempFileName), 0, POleVariant(tempData), PAnsiChar(optlist));
end;

function TPdfLib.create_textflow(const text, optlist: AnsiString): Integer;
var
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  Result:= PDF_create_textflow(FPDF, PAnsiChar(tempText), 0, PAnsiChar(optlist));
end;

procedure TPdfLib.curveto(x1, y1, x2, y2, x3, y3: Double);
begin
  PDF_curveto(FPDF, x1, y1, x2, y2, x3, y3);
end;

function TPdfLib.define_layer(const name, optlist: AnsiString): Integer;
var
  tName: string;
begin
  tName:= Utf8bom(name);
  Result:= PDF_define_layer(FPDF, PAnsiChar(tName), 0, PAnsiChar(optlist));
end;

procedure TPdfLib.delete_path(path: Integer);
begin
  PDF_delete_path(FPDF, path);
end;

function TPdfLib.delete_pvf(const filename: AnsiString): Integer;
var
  tfilename: string;
begin
  tfilename:= Utf8bom(filename);
  Result:= PDF_delete_pvf(FPDF, PAnsiChar(tfilename), 0);
end;

procedure TPdfLib.delete_table(table: Integer; const optlist: AnsiString);
begin
  PDF_delete_table(FPDF, table, PAnsiChar(optlist));
end;

procedure TPdfLib.delete_textflow(textflow: Integer);
begin
  PDF_delete_textflow(FPDF, textflow);
end;

destructor TPdfLib.Destroy;
begin
  PDF_delete(FPDF);
  FPDF:= nil;
  inherited;
end;

procedure TPdfLib.draw_path(path: Integer; x, y: Double;
  const optlist: AnsiString);
begin
  PDF_draw_path(FPDF, path, x, y, PAnsiChar(optlist));
end;

procedure TPdfLib.ellipse(x, y, rx, ry: Double);
begin
  PDF_ellipse(FPDF, x, y, rx, ry);
end;

procedure TPdfLib.elliptical_arc(x, y, rx, ry: Double;
  const optlist: AnsiString);
begin
  PDF_elliptical_arc(FPDF, x, y, rx, ry, PAnsiChar(optlist));
end;

procedure TPdfLib.encoding_set_char(const encoding: AnsiString; slot: Integer;
  const glyphname: AnsiString; uv: Integer);
begin
  PDF_encoding_set_char(FPDF, PAnsiChar(encoding), slot, PAnsiChar(glyphname), uv);
end;

procedure TPdfLib.endpath;
begin
  PDF_endpath(FPDF);
end;

procedure TPdfLib.end_document(const optlist: AnsiString);
begin
  PDF_end_document(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.end_dpart(const optlist: AnsiString);
begin
  PDF_end_dpart(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.end_font;
begin
  PDF_end_font(FPDF);
end;

procedure TPdfLib.end_glyph;
begin
  PDF_end_glyph(FPDF);
end;

procedure TPdfLib.end_item(id: Integer);
begin
  PDF_end_item(FPDF, id);
end;

procedure TPdfLib.end_layer;
begin
  PDF_end_layer(FPDF);
end;

procedure TPdfLib.end_mc;
begin
  PDF_end_mc(FPDF);
end;

procedure TPdfLib.end_page;
begin
  PDF_end_page(FPDF);
end;

procedure TPdfLib.end_page_ext(const optlist: AnsiString);
begin
  PDF_end_page_ext(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.end_pattern;
begin
  PDF_end_pattern(FPDF);
end;

procedure TPdfLib.end_template;
begin
  PDF_end_template(FPDF);
end;

procedure TPdfLib.end_template_ext(width, height: Double);
begin
  PDF_end_template_ext(FPDF, width, height);
end;

procedure TPdfLib.fill;
begin
  PDF_fill(FPDF);
end;

function TPdfLib.fill_graphicsblock(page: Integer; const blockname: AnsiString;
  graphics: Integer; const optlist: AnsiString): Integer;
begin
  Result:= PDF_fill_graphicsblock(FPDF, page, PAnsiChar(blockname), graphics, PAnsiChar(optlist));
end;

function TPdfLib.fill_imageblock(page: Integer; const blockname: AnsiString;
  image: Integer; const optlist: AnsiString): Integer;
begin
  Result:= PDF_fill_imageblock(FPDF, page, PAnsiChar(blockname), image, PAnsiChar(optlist));
end;

function TPdfLib.fill_pdfblock(page: Integer; const blockname: AnsiString;
  contents: Integer; const optlist: AnsiString): Integer;
begin
  Result:= PDF_fill_pdfblock(FPDF, page, PAnsiChar(blockname), contents, PAnsiChar(optlist));
end;

procedure TPdfLib.fill_stroke;
begin
  PDF_fill_stroke(FPDF);
end;

function TPdfLib.fill_textblock(page: Integer; const blockname, text,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(text);
  Result:= PDF_fill_textblock(FPDF, page, PAnsiChar(blockname), PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.findfont(const fontname, encoding: AnsiString;
  options: Integer): Integer;
var
  tempFont: AnsiString;
begin
  tempFont:= Utf8bom(fontname);
  Result:= PDF_findfont(FPDF, PAnsiChar(tempFont), PAnsiChar(encoding), options);
end;

procedure TPdfLib.fit_graphics(graphics: Integer; x, y: Double;
  const optlist: AnsiString);
begin
  PDF_fit_graphics(FPDF, graphics, x, y, PAnsiChar(optlist));
end;

procedure TPdfLib.fit_image(image: Integer; x, y: Double;
  const optlist: AnsiString);
begin
  PDF_fit_image(FPDF, image, x, y, PAnsiChar(optlist));
end;

procedure TPdfLib.fit_pdi_page(page: Integer; x, y: Double;
  const optlist: AnsiString);
begin
  PDF_fit_pdi_page(FPDF, page, x, y, PAnsiChar(optlist));
end;

function TPdfLib.fit_table(table: Integer; llx, lly, urx, ury: Double;
  const optlist: AnsiString): AnsiString;
begin
  Result:= PDF_fit_table(FPDF, table, llx, lly, urx, ury, PAnsiChar(optlist));
end;

function TPdfLib.fit_textflow(textflow: Integer; llx, lly, urx, ury: Double;
  const optlist: AnsiString): AnsiString;
begin
  Result:= PDF_fit_textflow(FPDF, textflow, llx, lly, urx, ury, PAnsiChar(optlist));
end;

procedure TPdfLib.fit_textline(const text: AnsiString; x, y: Double;
  const optlist: AnsiString);
var
  len: Integer;
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  len:= Length(tempText);
  PDF_fit_textline(FPDF, PAnsiChar(tempText), len, x, y, PAnsiChar(optlist));
end;

function TPdfLib.get_apiname: AnsiString;
var
  apiname: PAnsiChar;
begin
  apiname:= PDF_get_apiname(FPDF);
  Result:= StrPas(apiname);
end;

function TPdfLib.get_buffer: AnsiString;
var
  size: LongWord;
begin
  Result:=PDF_get_buffer(FPDF, size);
end;

function TPdfLib.get_errmsg: AnsiString;
var
  temp: PAnsiChar;
  size: PInteger;
begin
  temp:= PDF_get_errmsg(FPDF);
  Result:= StrPas(temp);
end;

function TPdfLib.get_errnum: Integer;
begin
  Result:= PDF_get_errnum(FPDF);
end;

function TPdfLib.get_option(const keyword, optlist: AnsiString): Double;
begin
  Result:= PDF_get_option(FPDF ,PAnsiChar(keyword),PAnsiChar(optlist));
end;

function TPdfLib.get_parameter(const key: AnsiString;
  modifier: Double): AnsiString;
begin
  Result:= PDF_get_parameter(FPDF, PAnsiChar(key), modifier)
end;

function TPdfLib.get_pdi_parameter(const key: AnsiString; doc, page,
  reserved: Integer): AnsiString;
begin
  Result:= PDF_get_pdi_parameter(FPDF, PAnsiChar(key), doc, page, reserved);
end;

function TPdfLib.get_pdi_value(const key: AnsiString; doc, page,
  reserved: Integer): Double;
begin
  Result:= PDF_get_pdi_value(FPDF, PAnsiChar(key), doc, page, reserved);
end;

function TPdfLib.get_AnsiString(idx: Integer;
  const optlist: AnsiString): AnsiString;
begin
  Result:= PDF_get_string(FPDF, idx, PAnsiChar(optlist));
end;

function TPdfLib.get_unicode_format: TPdfUnicodeFormat;
begin
  Result:= PDF_get_unicode_format(FPDF);
end;

function TPdfLib.get_value(const key: AnsiString; modifier: Double): Double;
begin
  Result:= PDF_get_value(FPDF, PAnsiChar(key), modifier);
end;

function TPdfLib.info_font(font: Integer; const keyword,
  optlist: AnsiString): Double;
begin
  Result:= PDF_info_font(FPDF, font, PAnsiChar(keyword), PAnsiChar(optlist));
end;

function TPdfLib.info_graphics(graphics: Integer; const keyword,
  optlist: AnsiString): Double;
begin
  Result:= PDF_info_graphics(FPDF, graphics, PAnsiChar(keyword), PAnsiChar(optlist));
end;

function TPdfLib.info_image(image: Integer; const keyword,
  optlist: AnsiString): Double;
begin
  Result:= PDF_info_image(FPDF, image, PAnsiChar(keyword), PAnsiChar(optlist));
end;

function TPdfLib.info_matchbox(const boxname: AnsiString; num: Integer;
  const keyword: AnsiString): Double;
begin
  Result:= PDF_info_matchbox(FPDF, PAnsiChar(boxname), 0, num, PAnsiChar(keyword));
end;

function TPdfLib.info_path(path: Integer; const keyword,
  optlist: AnsiString): Double;
begin
  Result:= PDF_info_path(FPDF, path, PAnsiChar(keyword), PAnsiChar(optlist));
end;

function TPdfLib.info_pdi_page(page: Integer; const keyword,
  optlist: AnsiString): Double;
begin
  Result:= PDF_info_pdi_page(FPDF, page, PAnsiChar(keyword), PAnsiChar(optlist));
end;

function TPdfLib.info_pvf(const filename, keyword: AnsiString): Double;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_info_pvf(FPDF, PAnsiChar(temp), 0, PAnsiChar(keyword));
end;

function TPdfLib.info_table(table: Integer; const keyword: AnsiString): Double;
begin
  Result:= PDF_info_table(FPDF, table, PAnsiChar(keyword));
end;

function TPdfLib.info_textflow(textflow: Integer;
  const keyword: AnsiString): Double;
begin
  Result:= PDF_info_textflow(FPDF, textflow, PAnsiChar(keyword));
end;

function TPdfLib.info_textline(const text, keyword,
  optlist: AnsiString): Double;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(text);
  Result:= PDF_info_textline(FPDF, PAnsiChar(temp), 0, PAnsiChar(keyword), PAnsiChar(optlist));
end;

procedure TPdfLib.initgraphics;
begin
  PDF_initgraphics(FPDF);
end;

procedure TPdfLib.lineto(x, y: Double);
begin
  PDF_lineto(FPDF, x, y);
end;

function TPdfLib.load_3ddata(const filename, optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_load_3ddata(FPDF, PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.load_asset(const type_, filename,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_load_asset(FPDF, PAnsiChar(type_), PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.load_font(const fontname: AnsiString; encoding,
  optlist: AnsiString): Integer;
var
  tempFont: AnsiString;
begin
  //encoding: 1、 'UniGB-UTF16-H' 2、'UniGB-UCS2-H' 3、'unicode' 4、'host' 5、'GB-EUC-H';
  tempFont:= Utf8bom(fontname);
  Result:= PDF_load_font(FPDF, PAnsiChar(tempFont), 0, PAnsiChar(encoding), PAnsiChar(optlist));
end;

function TPdfLib.load_graphics(const type_, filename,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_load_graphics(FPDF, PAnsiChar(type_), PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.load_iccprofile(const profilename,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(profilename);
  Result:= PDF_load_iccprofile(FPDF, PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.load_image(const imagetype, filename,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_load_image(FPDF, PAnsiChar(imagetype), PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.makespotcolor(const spotname: AnsiString): Integer;
//var
  //temp: AnsiString;
begin
  //temp:= Utf8bom(spotname);
  Result:= PDF_makespotcolor(FPDF, PAnsiChar(spotname), 0);
end;

procedure TPdfLib.mc_point(const tag, optlist: AnsiString);
begin
  PDF_mc_point(FPDF, PAnsiChar(tag), PAnsiChar(optlist));
end;

procedure TPdfLib.moveto(x, y: Double);
begin
  PDF_moveto(FPDF, x, y);
end;

function TPdfLib.open_CCITT(const filename: AnsiString; width, height,
  BitReverse, K, BlackIs1: Integer): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_open_CCITT(FPDF, PAnsiChar(temp), width, height,
    BitReverse, K, BlackIs1);
end;

function TPdfLib.open_file(const filename: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_open_file(FPDF, PAnsiChar(temp));
end;

function TPdfLib.open_image(const imagetype, source: AnsiString;
  const data: AnsiString; length, width, height, components, bpc: Integer;
  const params: AnsiString): Integer;
begin
  Result:= PDF_open_image(FPDF, PAnsiChar(imagetype), PAnsiChar(source),
    PAnsiChar(data), length, width, height, components, bpc, PAnsiChar(params));
end;

function TPdfLib.open_image_file(const imagetype, filename,
  optlist: AnsiString; intparam: Integer): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_open_image_file(FPDF, PAnsiChar(imagetype), PAnsiChar(temp),
    PAnsiChar(optlist),intparam);
end;

function TPdfLib.open_pdi(const filename, optlist: AnsiString;
  reserved: Integer): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_open_pdi(FPDF, PAnsiChar(temp), PAnsiChar(optlist), reserved);
end;

function TPdfLib.open_pdi_document(const filename,
  optlist: AnsiString): Integer;
var
  temp: AnsiString;
begin
  temp:= Utf8bom(filename);
  Result:= PDF_open_pdi_document(FPDF, PAnsiChar(temp), 0, PAnsiChar(optlist));
end;

function TPdfLib.open_pdi_page(doc, pagenumber: Integer;
  const optlist: AnsiString): Integer;
begin
  Result:= PDF_open_pdi_page(FPDF, doc, pagenumber, PAnsiChar(optlist));
end;

procedure TPdfLib.pcircle(x, y, r: Double);
begin
  //PDF_pcircle(FPDF, x, y, r);
end;

function TPdfLib.pcos_get_number(page: Integer; const path: AnsiString): Double;
begin
  Result:= PDF_pcos_get_number(FPDF, page, PAnsiChar(path));
end;

function TPdfLib.pcos_get_stream(page: Integer; const optlist,
  path: AnsiString): OleVariant;
begin
  Result:= PDF_pcos_get_stream(FPDF, page, PAnsiChar(optlist), PAnsiChar(path));
end;

function TPdfLib.pcos_get_AnsiString(page: Integer;
  const path: AnsiString): AnsiString;
begin
  Result:= PDF_pcos_get_string(FPDF, page, PAnsiChar(path));
end;

procedure TPdfLib.place_image(image: Integer; x, y, scale: Double);
begin
  PDF_place_image(FPDF, image, x, y, scale);
end;

procedure TPdfLib.place_pdi_page(page: Integer; x, y, sx, sy: Double);
begin
  PDF_place_pdi_page(FPDF, page, x, y, sx, sy);
end;

procedure TPdfLib.poca_delete(container: Integer; const optlist: AnsiString);
begin
  PDF_poca_delete(FPDF, container, PAnsiChar(optlist));
end;

procedure TPdfLib.poca_insert(container: Integer; const optlist: AnsiString);
begin
  PDF_poca_insert(FPDF, container, PAnsiChar(optlist));
end;

function TPdfLib.poca_new(const optlist: AnsiString): Integer;
begin
  Result:= PDF_poca_new(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.poca_remove(container: Integer; const optlist: AnsiString);
begin
  PDF_poca_remove(FPDF, container, PAnsiChar(optlist));
end;

function TPdfLib.process_pdi(doc, page: Integer;
  const optlist: AnsiString): Integer;
begin
  Result:= PDF_process_pdi(FPDF, doc, page, PAnsiChar(optlist));
end;

procedure TPdfLib.pscale(sx, sy: Double);
begin
  //PDF_pscale(FPDF, sx, sy);
end;

procedure TPdfLib.rect(x, y, width, height: Double);
begin
  PDF_rect(FPDF, x, y, width, height);
end;

procedure TPdfLib.restore;
begin
  PDF_restore(FPDF);
end;

procedure TPdfLib.resume_page(const optlist: AnsiString);
begin
  PDF_resume_page(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.rotate(phi: Double);
begin
  PDF_rotate(FPDF, phi);
end;

procedure TPdfLib.save;
begin
  PDF_save(FPDF);
end;

procedure TPdfLib.scale(sx, sy: Double);
begin
  PDF_scale(FPDF, sx, sy);
end;

procedure TPdfLib.setcolor(const fstype, colorspace: AnsiString; c1, c2, c3,
  c4: Double);
begin
  PDF_setcolor(FPDF, PAnsiChar(fstype),PAnsiChar(colorspace),c1, c2, c3, c4);
end;

procedure TPdfLib.setdash(b, w: Double);
begin
  PDF_setdash(FPDF, b, w);
end;

procedure TPdfLib.setdashpattern(const optlist: AnsiString);
begin
  PDF_setdashpattern(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.setflat(flatness: Double);
begin
  PDF_setflat(FPDF, flatness);
end;

procedure TPdfLib.setfont(font: Integer; fontsize: Double);
begin
  PDF_setfont(FPDF, font, fontsize);
end;

procedure TPdfLib.setlinecap(linecap: Integer);
begin
  PDF_setlinecap(FPDF, linecap);
end;

procedure TPdfLib.setlinejoin(linejoin: Integer);
begin
  PDF_setlinejoin(FPDF, linejoin);
end;

procedure TPdfLib.setlinewidth(width: Double);
begin
  PDF_setlinewidth(FPDF, width);
end;

procedure TPdfLib.setmatrix(a, b, c, d, e, f: Double);
begin
  PDF_setmatrix(FPDF, a, b, c, d, e, f);
end;

procedure TPdfLib.setmiterlimit(miter: Double);
begin
  PDF_setmiterlimit(FPDF, miter);
end;

procedure TPdfLib.setpolydash(const darray: OleVariant);
begin
  PDF_setpolydash(FPDF, darray);
end;

procedure TPdfLib.set_border_color(red, green, blue: Double);
begin
  PDF_set_border_color(FPDF, red, green, blue);
end;

procedure TPdfLib.set_border_dash(b, w: Double);
begin
  PDF_set_border_dash(FPDF, b, w);
end;

procedure TPdfLib.set_border_style(const style: AnsiString; width: Double);
begin
  PDF_set_border_style(FPDF, PAnsiChar(style), width);
end;

procedure TPdfLib.set_graphics_option(const optlist: AnsiString);
begin
  PDF_set_graphics_option(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.set_gstate(gstate: Integer);
begin
  PDF_set_gstate(FPDF, gstate);
end;

procedure TPdfLib.set_info(const key, value: AnsiString);
begin
  PDF_set_info(FPDF, PAnsiChar(key), PAnsiChar(value));
end;

procedure TPdfLib.set_layer_dependency(const type_, optlist: AnsiString);
begin
  PDF_set_layer_dependency(FPDF, PAnsiChar(type_), PAnsiChar(optlist));
end;

procedure TPdfLib.set_option(const optlist: AnsiString);
begin
  PDF_set_option(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.set_parameter(const key, value: AnsiString);
begin
  PDF_set_parameter(FPDF, PAnsiChar(key), PAnsiChar(value));
end;

procedure TPdfLib.set_text_option(const optlist: AnsiString);
begin
  PDF_set_text_option(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.set_text_pos(x, y: Double);
begin
  PDF_set_text_pos(FPDF, x, y);
end;

procedure TPdfLib.set_value(const key: AnsiString; value: Double);
begin
  PDF_set_value(FPDF, PAnsiChar(key), value);
end;

function TPdfLib.shading(const shtype: AnsiString; x0, y0, x1, y1, c1, c2, c3,
  c4: Double; const optlist: AnsiString): Integer;
begin
  Result:= PDF_shading(FPDF, PAnsiChar(shtype), x0, y0, x1, y1, c1, c2, c3, c4, PAnsiChar(optlist));
end;

function TPdfLib.shading_pattern(shading: Integer;
  const optlist: AnsiString): Integer;
begin
  Result:= PDF_shading_pattern(FPDF, shading, PAnsiChar(optlist));
end;

procedure TPdfLib.shfill(shading: Integer);
begin
  PDF_shfill(FPDF, shading);
end;

procedure TPdfLib.show(const text: AnsiString);
var
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  PDF_show(FPDF, PAnsiChar(tempText));
end;

function TPdfLib.show_boxed(const text: AnsiString; x, y, width, height: Double;
  const hmode, feature: AnsiString): Integer;
var
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  Result:= PDF_show_boxed(FPDF, PAnsiChar(tempText), x, y, width, height, PAnsiChar(hmode),PAnsiChar(feature));
end;

procedure TPdfLib.show_xy(const text: AnsiString; x, y: Double);
var
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  PDF_show_xy(FPDF, PAnsiChar(tempText), x, y);
end;

procedure TPdfLib.skew(alpha, beta: Double);
begin
  PDF_skew(FPDF, alpha, beta);
end;

function TPdfLib.AnsiStringwidth(const text: AnsiString; font: Integer;
  fontsize: Double): Double;
var
  tempText: AnsiString;
begin
  tempText:= Utf8bom(text);
  Result:= PDF_stringwidth(FPDF, PAnsiChar(tempText), font, fontsize);
end;

procedure TPdfLib.stroke;
begin
  PDF_stroke(FPDF);
end;

procedure TPdfLib.suspend_page(const optlist: AnsiString);
begin
  PDF_suspend_page(FPDF, PAnsiChar(optlist));
end;

procedure TPdfLib.translate(tx, ty: Double);
begin
  PDF_translate(FPDF, tx, ty);
end;

function TPdfLib.Utf8bom(AValue: ansiString): ansiString;
var
  bom: ansiString;
  P,PEndVal:PAnsiChar;
  flag: Boolean;
begin
  P := Pointer(AValue);
  PEndVal := P + Length(AValue);
  flag:= False;
  while P < PEndVal do
  begin
    if P^ > PdfTextChar then
    begin
      flag:= True;
      Break;
    end;
    Inc(P);
  end;
  if flag then
  begin  //中文字符需要添加 #EF#BB#BF;
    bom := ansiChar($EF) + ansiChar($BB) + ansiChar($BF);
    result := bom + UTF8Encode(AValue);
  end else
    result := AValue;
end;

end.
