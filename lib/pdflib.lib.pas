//{$A8,B-,E-,F-,G+,H+,I+,J-,K-,M-,N-,P+,Q-,R-,S-,T-,U-,V+,X+,Z1}
unit pdflib.lib;

(*---------------------------------------------------------------------------*
 |          Copyright (c) 1997-2019 PDFlib GmbH. All rights reserved.        |
 +---------------------------------------------------------------------------+
 |    This software may not be copied or distributed except as expressly     |
 |    authorized by PDFlib GmbH's general license agreement or a custom      |
 |    license agreement signed by PDFlib GmbH.                               |
 |    For more information about licensing please refer to www.pdflib.com.   |
 *---------------------------------------------------------------------------*)

interface

uses Winapi.Windows;

(* Public function declarations for PDFlib, PDFlib+PDI, and PPS;
 * see PDFlib API Reference for details.*)

const
  PDFLIB_PRODUCTNAME   =  'PDFlib';

(* The version defines below can be used to check the version of the
 * include file against the library.*)

  PDFLIB_MAJORVERSION	        = 9;	        // major version number
  PDFLIB_MINORVERSION	        = 3;       	  // minor version number
  PDFLIB_REVISION		          = 0;       	  // revision number
  PDFLIB_SHORT_VERSIONSTRING  = '9';        // short version number
  PDFLIB_LONG_VERSIONSTRING   = '9.3.0';    // full version number


{$IFDEF CPUX64}
PDFLIB_API = 'pdflib64.dll';
{$ELSE}
PDFLIB_API = 'pdflib32.dll';
{$ENDIF CPUX64}


type

  /// <summary>
  /// enums for the return values of unsupported function PDF_get_unicode_format()
  /// </summary>
  TPdfUnicodeFormat =
  (
      pdf_uni_none     = 0,   // no Unicode format
      pdf_uni_utf8     = 5,   // UTF-8
      pdf_uni_utf16    = 7,   // UTF-16
      pdf_uni_utf16be  = 8,   // UTF-16 BE
      pdf_uni_utf16le  = 9,   // UTF-16 LE
      pdf_uni_utf32    = 10   // UTF-32
  );

  // Auxiliary structure for try/catch
  TjmpBuf = array[0..7] of LongInt;
  PPdfJmpbuf = ^TPdfJmpbuf;
  TPdfJmpbuf = record
    jbuf: TjmpBuf;
  end;

  PDF = ^TPDF_s;
  TPDF_s = record end;

  function PDF_new():PDF cdecl; external PDFLIB_API;
  procedure PDF_delete(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_activate_item(p: PDF; id: Integer); cdecl; external PDFLIB_API;
  function PDF_add_bookmark(p: PDF; const text: PAnsiChar; parent: Integer;
      open: Integer): Integer; cdecl; external PDFLIB_API;
  function PDF_add_bookmark2(p: PDF; const text: PAnsiChar; len: Integer; parent: Integer;
      open: Integer): Integer; cdecl; external PDFLIB_API;
  procedure PDF_add_launchlink(p: PDF; llx: Double; lly: Double; urx: Double; ury: Double;
      const filename: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_add_locallink(p: PDF; llx: Double; lly: Double;
      urx: Double; ury: Double; page: Integer;
      const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_add_nameddest(p: PDF; const name: PAnsiChar; len: Integer;
      const optlist: PAnsiChar); cdecl; external PDFLIB_API;

  procedure PDF_add_note(p: PDF; llx: Double; lly: Double; urx: Double; ury: Double;
                     const contents: PAnsiChar; const title: PAnsiChar; const icon: PAnsiChar;
                     open: Integer); cdecl; external PDFLIB_API;
  function PDF_add_path_point(p: PDF; path: Integer; x: Double; y: Double; const type_: PAnsiChar;
                          const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_add_pdflink(p: PDF; llx: Double; lly: Double; urx: Double; ury: Double;
                        const filename: PAnsiChar; page: Integer; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_add_portfolio_file(p: PDF; folder: Integer; const filename: PAnsiChar;
      len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_add_portfolio_folder(p: PDF; parent: Integer; const foldername: PAnsiChar;
      len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_add_table_cell(p: PDF; table: Integer; column: Integer; row: Integer; const text: PAnsiChar;
      len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_add_textflow(p: PDF; textflow: Integer; const text: PAnsiChar;
      len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_add_thumbnail(p: PDF; image: Integer); cdecl; external PDFLIB_API;
  procedure PDF_add_weblink(p: PDF; llx: Double; lly: Double; urx: Double; ury: Double; const url: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_align(p: PDF; dx: Double; dy: Double); cdecl; external PDFLIB_API;
  procedure PDF_arc(p: PDF; x: Double; y: Double; r: Double; alpha: Double; beta: Double); cdecl; external PDFLIB_API;
  procedure PDF_arcn(p: PDF; x: Double; y: Double; r: Double; alpha: Double; beta: Double); cdecl; external PDFLIB_API;
  procedure PDF_attach_file(p: PDF; llx: Double; lly: Double; urx: Double; ury: Double;
     const filename: PAnsiChar; const description: PAnsiChar;
     const author: PAnsiChar; const mimetype: PAnsiChar;
     const icon: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_begin_document(p: PDF; const filename: PAnsiChar; len: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_begin_dpart(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_begin_font(p: PDF; const fontname: PAnsiChar; len: Integer;
      a: Double; b: Double; c: Double; d: Double; e: Double; f: Double;
      const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_begin_glyph(p: PDF; const glyphname: PAnsiChar; wx: Double; llx: Double; lly: Double;
                        urx: Double; ury: Double); cdecl; external PDFLIB_API;
  procedure PDF_begin_glyph_ext(p: PDF; uv: Integer; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_begin_item(p: PDF; const tag: PAnsiChar; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_begin_layer(p: PDF; layer: Integer); cdecl; external PDFLIB_API;
  procedure PDF_begin_mc(p: PDF; const tag: PAnsiChar; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_begin_page(p: PDF; width: Double; height: Double); cdecl; external PDFLIB_API;
  procedure PDF_begin_page_ext(p: PDF; width: Double; height: Double; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_begin_pattern(p: PDF; width: Double; height: Double; xstep: Double; ystep: Double;
                         painttype: Integer): Integer; cdecl; external PDFLIB_API;
  function PDF_begin_template(p: PDF; width: Double; height: Double): Integer; cdecl; external PDFLIB_API;
  function PDF_begin_template_ext(p: PDF; width: Double; height: Double; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_circle(p: PDF; x: Double; y: Double; r: Double); cdecl; external PDFLIB_API;
  //procedure PDF_pcircle(p: PDF; x: Double; y: Double; r: Double); cdecl; external PDFLIB_API;
  procedure PDF_circular_arc(p: PDF; x_1: Double; y_1: Double; x_2: Double; y_2: Double); cdecl; external PDFLIB_API;
  procedure PDF_clip(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_close(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_close_font(p: PDF; font: Integer); cdecl; external PDFLIB_API;
  procedure PDF_close_graphics(p: PDF; graphics: Integer); cdecl; external PDFLIB_API;
  procedure PDF_close_image(p: PDF; image: Integer); cdecl; external PDFLIB_API;
  procedure PDF_close_pdi(p: PDF; doc: Integer); cdecl; external PDFLIB_API;
  procedure PDF_close_pdi_document(p: PDF; doc: Integer); cdecl; external PDFLIB_API;
  procedure PDF_close_pdi_page(p: PDF; page: Integer); cdecl; external PDFLIB_API;
  procedure PDF_closepath(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_closepath_fill_stroke(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_closepath_stroke(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_concat(p: PDF; a: Double; b: Double; c: Double; d: Double; e: Double; f: Double); cdecl; external PDFLIB_API;
  procedure PDF_continue_text(p: PDF; const text: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_continue_text2(p: PDF; const text: PAnsiChar; len: Integer); cdecl; external PDFLIB_API;
  function PDF_create_3dview(p: PDF; const username: PAnsiChar; len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_create_action(p: PDF; const type_: PAnsiChar; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_create_annotation(p: PDF; llx: Double; lly: Double; urx: Double; ury: Double;
      const type_: PAnsiChar; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_create_bookmark(p: PDF; const text: PAnsiChar; len: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_create_field(p: PDF; llx: Double; lly: Double; urx: Double; ury: Double;
      const name: PAnsiChar; len: Integer; const type_: PAnsiChar;
      const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_create_fieldgroup(p: PDF; const name: PAnsiChar; len: Integer;
      const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_create_gstate(p: PDF; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_create_pvf(p: PDF; const filename: PAnsiChar; len: Integer;
      const data: POleVariant; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_create_textflow(p: PDF; const text: PAnsiChar; len: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_curveto(p: PDF; x1: Double; y1: Double; x2: Double; y2: Double; x3: Double; y3: Double); cdecl; external PDFLIB_API;
  function PDF_define_layer(p: PDF; const name: PAnsiChar; len: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_deflate_unicode(p: PDF; const utfstring: PAnsiChar; len: Integer;
      charsize: Integer; highchar: PINT): PAnsiChar; cdecl; external PDFLIB_API;
  procedure PDF_delete_path(p: PDF; path: Integer); cdecl; external PDFLIB_API;
  function PDF_delete_pvf(p: PDF; const filename: PAnsiChar; len: Integer): Integer; cdecl; external PDFLIB_API;
  procedure PDF_delete_table(p: PDF; table: Integer; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_delete_textflow(p: PDF; textflow: Integer); cdecl; external PDFLIB_API;
  procedure PDF_draw_path(p: PDF; path: Integer; x: Double; y: Double; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_ellipse(p: PDF; x: Double; y: Double; rx: Double; ry: Double); cdecl; external PDFLIB_API;
  procedure PDF_elliptical_arc(p: PDF; x: Double; y: Double; rx: Double; ry: Double; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_encoding_set_char(p: PDF; const encoding: PAnsiChar; slot: Integer;
                              const glyphname: PAnsiChar; uv: Integer); cdecl; external PDFLIB_API;
  procedure PDF_end_document(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_end_dpart(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_end_font(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_end_glyph(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_end_item(p: PDF; id: Integer); cdecl; external PDFLIB_API;
  procedure PDF_end_layer(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_end_mc(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_end_page(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_end_page_ext(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_end_pattern(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_end_template(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_end_template_ext(p: PDF; width: Double; height: Double); cdecl; external PDFLIB_API;
  procedure PDF_endpath(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_fill(p: PDF); cdecl; external PDFLIB_API;
  function PDF_fill_graphicsblock(p: PDF; page: Integer; const blockname: PAnsiChar; graphics: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_fill_imageblock(p: PDF; page: Integer; const blockname: PAnsiChar; image: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_fill_pdfblock(p: PDF; page: Integer; const blockname: PAnsiChar; contents: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_fill_stroke(p: PDF); cdecl; external PDFLIB_API;
  function PDF_fill_textblock(p: PDF; page: Integer; const blockname: PAnsiChar;
      const text: PAnsiChar; len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_findfont(p: PDF; const fontname: PAnsiChar; const encoding: PAnsiChar; options: Integer): Integer; cdecl; external PDFLIB_API;
  procedure PDF_fit_graphics(p: PDF; graphics: Integer; x: Double; y: Double; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_fit_image(p: PDF; image: Integer; x: Double; y: Double; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_fit_pdi_page(p: PDF; page: Integer; x: Double; y: Double; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_fit_table(p: PDF; table: Integer; llx: Double; lly: Double; urx: Double; ury: Double;
                     const optlist: PAnsiChar): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_fit_textflow(p: PDF; textflow: Integer; llx: Double; lly: Double; urx: Double; ury: Double;
                        const optlist: PAnsiChar): PAnsiChar; cdecl; external PDFLIB_API;
  procedure PDF_fit_textline(p: PDF; const text: PAnsiChar; len: Integer; x: Double; y: Double; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_get_apiname(p: PDF): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_get_buffer(p: PDF; var size: LongWord): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_get_errmsg(p: PDF): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_get_errnum(p: PDF): Integer; cdecl; external PDFLIB_API;
  function PDF_get_option(p: PDF; const keyword: PAnsiChar; const optlist: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_get_parameter(p: PDF; const key: PAnsiChar; modifier: Double): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_get_pdi_parameter(p: PDF; const key: PAnsiChar; doc: Integer; page: Integer; reserved: Integer): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_get_pdi_value(p: PDF; const key: PAnsiChar; doc: Integer; page: Integer; reserved: Integer): Double; cdecl; external PDFLIB_API;
  function PDF_get_string(p: PDF; idx: Integer; const optlist: PAnsiChar): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_get_value(p: PDF; const key: PAnsiChar; modifier: Double): Double; cdecl; external PDFLIB_API;
  function PDF_info_font(p: PDF; font: Integer; const keyword: PAnsiChar; const optlist: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_graphics(p: PDF; graphics: Integer; const keyword: PAnsiChar; const optlist: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_image(p: PDF; image: Integer; const keyword: PAnsiChar; const optlist: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_matchbox(p: PDF; const boxname: PAnsiChar; len: Integer;
      num: Integer; const keyword: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_path(p: PDF; path: Integer; const keyword: PAnsiChar; const optlist: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_pdi_page(p: PDF; page: Integer; const keyword: PAnsiChar; const optlist: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_pvf(p: PDF; const filename: PAnsiChar; len: Integer;
      const keyword: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_table(p: PDF; table: Integer; const keyword: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_textflow(p: PDF; textflow: Integer; const keyword: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_info_textline(p: PDF; const text: PAnsiChar; len: Integer;
      const keyword: PAnsiChar; const optlist: PAnsiChar): Double; cdecl; external PDFLIB_API;
  procedure PDF_initgraphics(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_lineto(p: PDF; x: Double; y: Double); cdecl; external PDFLIB_API;
  function PDF_load_asset(p: PDF; const type_: PAnsiChar; const filename: PAnsiChar;
      len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_load_font(p: PDF; const fontname: PAnsiChar; len: Integer; const encoding: PAnsiChar;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_load_graphics(p: PDF; const type_: PAnsiChar; const filename: PAnsiChar;
      len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_load_iccprofile(p: PDF; const profilename: PAnsiChar; len: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_load_3ddata(p: PDF; const filename: PAnsiChar; len: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_load_image(p: PDF; const imagetype: PAnsiChar; const filename: PAnsiChar;
      len: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_makespotcolor(p: PDF; const spotname: PAnsiChar; len: Integer): Integer; cdecl; external PDFLIB_API;
  procedure PDF_mc_point(p: PDF; const tag: PAnsiChar; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_moveto(p: PDF; x: Double; y: Double); cdecl; external PDFLIB_API;
  function PDF_open_CCITT(p: PDF; const filename: PAnsiChar; width: Integer; height: Integer;
      BitReverse: Integer; K: Integer; BlackIs1: Integer): Integer; cdecl; external PDFLIB_API;
  function PDF_open_file(p: PDF; const filename: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_open_image(p: PDF; const imagetype: PAnsiChar; const source: PAnsiChar;
      const data: PAnsiChar; length: Integer; width: Integer; height: Integer;
      components: Integer; bpc: Integer; const params: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_open_image_file(p: PDF; const imagetype: PAnsiChar; const filename: PAnsiChar;
      const stringparam: PAnsiChar; intparam: Integer): Integer; cdecl; external PDFLIB_API;
  function PDF_open_pdi(p: PDF; const filename: PAnsiChar; const optlist: PAnsiChar;
      len: Integer): Integer; cdecl; external PDFLIB_API;
  function PDF_open_pdi_document(p: PDF; const filename: PAnsiChar; len: Integer;
      const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_open_pdi_page(p: PDF; doc: Integer; pagenumber: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_pcos_get_number(p: PDF; page: Integer; const path: PAnsiChar): Double; cdecl; external PDFLIB_API;
  function PDF_pcos_get_stream(p: PDF; page: Integer; const optlist: PAnsiChar; const path: PAnsiChar): OleVariant; cdecl; external PDFLIB_API;
  function PDF_pcos_get_string(p: PDF; page: Integer; const path: PAnsiChar): PAnsiChar; cdecl; external PDFLIB_API;
  procedure PDF_place_image(p: PDF; image: Integer; x: Double; y: Double; scale: Double); cdecl; external PDFLIB_API;
  procedure PDF_place_pdi_page(p: PDF; page: Integer; x: Double; y: Double; sx: Double; sy: Double); cdecl; external PDFLIB_API;
  procedure PDF_poca_delete(p: PDF; container: Integer; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_poca_insert(p: PDF; container: Integer; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_poca_new(p: PDF; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_poca_remove(p: PDF; container: Integer; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  function PDF_process_pdi(p: PDF; doc: Integer; page: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_rect(p: PDF; x: Double; y: Double; width: Double; height: Double); cdecl; external PDFLIB_API;
  procedure PDF_restore(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_resume_page(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_rotate(p: PDF; phi: Double); cdecl; external PDFLIB_API;
  procedure PDF_save(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_scale(p: PDF; sx: Double; sy: Double); cdecl; external PDFLIB_API;
  //procedure PDF_pscale(p: PDF; sx: Double; sy: Double); cdecl; external PDFLIB_API;
  procedure PDF_set_border_color(p: PDF; red: Double; green: Double; blue: Double); cdecl; external PDFLIB_API;
  procedure PDF_set_border_dash(p: PDF; b: Double; w: Double); cdecl; external PDFLIB_API;
  procedure PDF_set_border_style(p: PDF; const style: PAnsiChar; width: Double); cdecl; external PDFLIB_API;
  procedure PDF_set_graphics_option(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_set_gstate(p: PDF; gstate: Integer); cdecl; external PDFLIB_API;
  procedure PDF_set_info(p: PDF; const key: PAnsiChar; const value: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_set_info2(p: PDF; const key: PAnsiChar; const value: PAnsiChar; len: Integer); cdecl; external PDFLIB_API;
  procedure PDF_set_layer_dependency(p: PDF; const type_: PAnsiChar; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_set_option(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_set_parameter(p: PDF; const key: PAnsiChar; const value: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_set_text_option(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_set_text_pos(p: PDF; x: Double; y: Double); cdecl; external PDFLIB_API;
  procedure PDF_set_value(p: PDF; const key: PAnsiChar; value: Double); cdecl; external PDFLIB_API;
  procedure PDF_setcolor(p: PDF; const fstype: PAnsiChar; const colorspace: PAnsiChar; c1: Double;
                     c2: Double; c3: Double; c4: Double); cdecl; external PDFLIB_API;
  procedure PDF_setdash(p: PDF; b: Double; w: Double); cdecl; external PDFLIB_API;
  procedure PDF_setdashpattern(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_setflat(p: PDF; flatness: Double); cdecl; external PDFLIB_API;
  procedure PDF_setfont(p: PDF; font: Integer; fontsize: Double); cdecl; external PDFLIB_API;
  procedure PDF_setlinecap(p: PDF; linecap: Integer); cdecl; external PDFLIB_API;
  procedure PDF_setlinejoin(p: PDF; linejoin: Integer); cdecl; external PDFLIB_API;
  procedure PDF_setlinewidth(p: PDF; width: Double); cdecl; external PDFLIB_API;
  procedure PDF_setmatrix(p: PDF; a: Double; b: Double; c: Double; d: Double; e: Double; f: Double); cdecl; external PDFLIB_API;
  procedure PDF_setmiterlimit(p: PDF; miter: Double); cdecl; external PDFLIB_API;
  procedure PDF_setpolydash(p: PDF; const darray: OleVariant); cdecl; external PDFLIB_API;
  function PDF_shading(p: PDF; const shtype: PAnsiChar; x0: Double; y0: Double; x1: Double; y1: Double;
                   c1: Double; c2: Double; c3: Double; c4: Double; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_shading_pattern(p: PDF; shading: Integer; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_shfill(p: PDF; shading: Integer); cdecl; external PDFLIB_API;
  procedure PDF_show(p: PDF; const text: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_show2(p: PDF; const text: PAnsiChar; len: Integer); cdecl; external PDFLIB_API;
  function PDF_show_boxed(p: PDF; const text: PAnsiChar; x: Double; y: Double; width: Double;
     height: Double; const hmode: PAnsiChar; const feature: PAnsiChar): Integer;
     cdecl; external PDFLIB_API;
  function PDF_show_boxed2(p: PDF; const text: PAnsiChar; len: Integer;
     x: Double; y: Double; width: Double; height: Double; const hmode: PAnsiChar;
     const feature: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  procedure PDF_show_xy(p: PDF; const text: PAnsiChar; x: Double; y: Double); cdecl; external PDFLIB_API;
  procedure PDF_show_xy2(p: PDF; const text: PAnsiChar; len: Integer;
      x: Double; y: Double); cdecl; external PDFLIB_API;
  procedure PDF_skew(p: PDF; alpha: Double; beta: Double); cdecl; external PDFLIB_API;
  function PDF_stringwidth(p: PDF; const text: PAnsiChar; font: Integer; fontsize: Double): Double; cdecl; external PDFLIB_API;
  function PDF_stringwidth2(p: PDF; const text: PAnsiChar; len: Integer; font: Integer; fontsize: Double): Double; cdecl; external PDFLIB_API;
  procedure PDF_stroke(p: PDF); cdecl; external PDFLIB_API;
  procedure PDF_suspend_page(p: PDF; const optlist: PAnsiChar); cdecl; external PDFLIB_API;
  procedure PDF_translate(p: PDF; tx: Double; ty: Double); cdecl; external PDFLIB_API;
  function PDF_begin_pattern_ext(p: PDF; width: Double; height: Double; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_create_devicen(p: PDF; const optlist: PAnsiChar): Integer; cdecl; external PDFLIB_API;
  function PDF_utf16_to_utf8(p: PDF; const utf16string: PAnsiChar; len: Integer;
     var size: Integer): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_utf8_to_utf16(p: PDF; const utf8string: PAnsiChar; const ordering: PAnsiChar;
     var size: Integer): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_utf32_to_utf8(p: PDF; const utf32string: PAnsiChar; len: Integer;
     var size: Integer): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_utf8_to_utf32(p: PDF; const utf8string: PAnsiChar; const ordering: PAnsiChar;
     var size: Integer): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_utf16_to_utf32(p: PDF; const utf16string: PAnsiChar; len: Integer;
     const ordering: PAnsiChar; var size: Integer): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_utf32_to_utf16(p: PDF; const utf32string: PAnsiChar; len: Integer;
     const ordering: PAnsiChar; var size: Integer): PAnsiChar; cdecl; external PDFLIB_API;
  procedure PDF_shutdown; cdecl; external PDFLIB_API;
  procedure PDF_xshow(p: PDF; const text: PAnsiChar; len: Integer;
     const xadvancelist: PDouble); cdecl; external PDFLIB_API;
  function PDF_convert_to_unicode(p: PDF; const inputformat,inputstring: PAnsiChar;
     inputlen: Integer; var outputlen: Integer;
     const optlist: PAnsiChar): PAnsiChar; cdecl; external PDFLIB_API;
  function PDF_get_unicode_format(p: PDF): TPdfUnicodeFormat; cdecl; external PDFLIB_API;
  function pdf_jbuf(p: PDF): PPdfJmpbuf; cdecl; external PDFLIB_API;
  procedure pdf_exit_try(p: PDF); cdecl; external PDFLIB_API;
  function pdf_catch(p: PDF): Integer cdecl; external PDFLIB_API;
  procedure pdf_rethrow(p: PDF); cdecl; external PDFLIB_API;
  procedure pdf_throw(p: PDF; const binding,apiname,errmsg: PAnsiChar); cdecl; external PDFLIB_API;


(*
/*
 * ----------------------------------------------------------------------
 * Function prototypes for all supported API functions
 * ----------------------------------------------------------------------
 */

/* Activate a previously created structure element or other content item. */
PDFLIB_API void PDFLIB_CALL
PDF_activate_item(PDF *p, int id);

/* Deprecated, use PDF_create_bookmark(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_add_bookmark(PDF *p, const char *text, int parent, int open));

/* Deprecated, use PDF_create_bookmark(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_add_bookmark2(PDF *p, const char *text, int len, int parent, int open));

/* Deprecated, use PDF_create_action() and PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_add_launchlink(PDF *p, double llx, double lly, double urx, double ury,
    const char *filename));

/* Deprecated, use PDF_create_action() and PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_add_locallink(PDF *p, double llx, double lly, double urx, double ury,
    int page, const char *optlist));

/* Create a named destination on a page in the document. */
PDFLIB_API void PDFLIB_CALL
PDF_add_nameddest(PDF *p, const char *name, int len, const char *optlist);

/* Deprecated, use PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_add_note(PDF *p, double llx, double lly, double urx, double ury,
    const char *contents, const char *title, const char *icon, int open));

/* Deprecated, use PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_add_note2(PDF *p, double llx, double lly, double urx, double ury,
    const char *contents, int len_cont, const char *title, int len_title,
    const char *icon, int open));

/* Add a point to a new or existing path object.
   Returns: A path handle which can be used in subsequent path-related calls.
*/
PDFLIB_API int PDFLIB_CALL
PDF_add_path_point(PDF *p, int path, double x, double y,
    const char *type, const char *optlist);

/* Deprecated, use PDF_create_action() and PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_add_pdflink(PDF *p, double llx, double lly, double urx, double ury,
    const char *filename, int page, const char *optlist));

/* Add a file to a portfolio folder or a package (requires PDF 1.7).
   Returns: -1 (in PHP: 0) on error, and 1 otherwise.
*/
PDFLIB_API int PDFLIB_CALL
PDF_add_portfolio_file(PDF *p, int folder, const char *filename, int len,
    const char *optlist);

/* Add a folder to a new or existing portfolio (requires PDF 1.7ext3).
   Returns: A folder handle which can be used in subsequent
   portfolio-related calls.
*/
PDFLIB_API int PDFLIB_CALL
PDF_add_portfolio_folder(PDF *p, int parent, const char *foldername, int len,
    const char *optlist);

/* Add a cell to a new or existing table.
   Returns: A table handle which can be used in subsequent table-related calls.
*/
PDFLIB_API int PDFLIB_CALL
PDF_add_table_cell(PDF *p, int table, int column, int row, const char *text,
    int len, const char *optlist);

/* Create a Textflow object, or add text and explicit options to an existing
   Textflow.
   Returns: A Textflow handle, or -1 (in PHP: 0) on error.
*/
PDFLIB_API int PDFLIB_CALL
PDF_add_textflow(PDF *p, int textflow, const char *text, int len,
    const char *optlist);

/* Deprecated */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_add_thumbnail(PDF *p, int image));

/* Deprecated, use PDF_create_action() and PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_add_weblink(PDF *p, double llx, double lly, double urx, double ury,
    const char *url));

/* Align the coordinate system with a relative vector. */
PDFLIB_API void PDFLIB_CALL
PDF_align(PDF *p, double dx, double dy);

/* Draw a counterclockwise circular arc segment. */
PDFLIB_API void PDFLIB_CALL
PDF_arc(PDF *p, double x, double y, double r, double alpha, double beta);

/* Draw a clockwise circular arc segment. */
PDFLIB_API void PDFLIB_CALL
PDF_arcn(PDF *p, double x, double y, double r, double alpha, double beta);

/* Deprecated, use PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_attach_file(PDF *p, double llx, double lly, double urx, double ury,
    const char *filename, const char *description, const char *author,
    const char *mimetype, const char *icon));

/* Deprecated, use PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_attach_file2(PDF *p, double llx, double lly, double urx, double ury,
    const char *filename, int len_filename, const char *description,
    int len_descr, const char *author, int len_auth, const char *mimetype,
    const char *icon));

/* Create a new PDF document subject to various options.
   Returns: -1 (in PHP: 0) on error, and 1 otherwise.
*/
PDFLIB_API int PDFLIB_CALL
PDF_begin_document(PDF *p, const char *filename, int len, const char *optlist);

/* Create a new PDF document subject to various options. */
typedef size_t (*writeproc_t)(PDF *p1, void *data, size_t size);
PDFLIB_API void PDFLIB_CALL
PDF_begin_document_callback(PDF *p, writeproc_t writeproc, const char *optlist);

/* Create a new node in the document part hierarchy (requires PDF/VT or
   PDF 2.0).
*/
PDFLIB_API void PDFLIB_CALL
PDF_begin_dpart(PDF *p, const char *optlist);

/* Start a Type 3 font definition. */
PDFLIB_API void PDFLIB_CALL
PDF_begin_font(PDF *p, const char *fontname, int len,
    double a, double b, double c, double d, double e, double f,
    const char *optlist);

/* Deprecated, use PDF_begin_glyph_ext(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_begin_glyph(PDF *p, const char *glyphname, double wx,
    double llx, double lly, double urx, double ury));

/* Start a glyph definition for a Type 3 font. */
PDFLIB_API void PDFLIB_CALL
PDF_begin_glyph_ext(PDF *p, int uv, const char *optlist);

/* Open a structure element or other content element for Tagged PDF.
   Returns: An item handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_begin_item(PDF *p, const char *tagname, const char *optlist);

/* Start a layer for subsequent output on the page (requires PDF 1.5). */
PDFLIB_API void PDFLIB_CALL
PDF_begin_layer(PDF *p, int layer);

/* Begin a marked content sequence with optional properties. */
PDFLIB_API void PDFLIB_CALL
PDF_begin_mc(PDF *p, const char *tagname, const char *optlist);

/* Deprecated, use PDF_begin_page_ext(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_begin_page(PDF *p, double width, double height));

/* Add a new page to the document, and specify various options. */
PDFLIB_API void PDFLIB_CALL
PDF_begin_page_ext(PDF *p, double width, double height, const char *optlist);

/* Deprecated, use PDF_begin_pattern_ext(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_begin_pattern(PDF *p,
    double width, double height, double xstep, double ystep, int painttype));

/* Start the definition of a tiling pattern with options.
   Returns: A pattern handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_begin_pattern_ext(PDF *p,
    double width, double height, const char *optlist);

/* Deprecated, use PDF_begin_template_ext(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_begin_template(PDF *p, double width, double height));

/* Start a template definition.
   Returns: A template handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_begin_template_ext(PDF *p, double width, double height,
    const char *optlist);

/* Deprecated, and not required. */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_boot(void));

/* Check the validity of a PDFlib context (unsupported). */
PDFLIB_API int PDFLIB_CALL
PDF_check_context(PDF *p);

/* Draw a circle. */
PDFLIB_API void PDFLIB_CALL
PDF_circle(PDF *p, double x, double y, double r);

/* Draw a circular arc segment defined by three points. */
PDFLIB_API void PDFLIB_CALL
PDF_circular_arc(PDF *p, double x1, double y1, double x2, double y2);

/* Use the current path as clipping path, and terminate the path. */
PDFLIB_API void PDFLIB_CALL
PDF_clip(PDF *p);

/* Deprecated, use PDF_end_document(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_close(PDF *p));

/* Close an open font handle which has not yet been used in the document. */
PDFLIB_API void PDFLIB_CALL
PDF_close_font(PDF *p, int font);

/* Close vector graphics. */
PDFLIB_API void PDFLIB_CALL
PDF_close_graphics(PDF *p, int graphics);

/* Close an image or template. */
PDFLIB_API void PDFLIB_CALL
PDF_close_image(PDF *p, int image);

/* Deprecated, use PDF_close_pdi_document(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_close_pdi(PDF *p, int doc));

/* Close all open PDI page handles, and close the input PDF document. */
PDFLIB_API void PDFLIB_CALL
PDF_close_pdi_document(PDF *p, int doc);

/* Close the page handle and free all page-related resources. */
PDFLIB_API void PDFLIB_CALL
PDF_close_pdi_page(PDF *p, int page);

/* Close the current path. */
PDFLIB_API void PDFLIB_CALL
PDF_closepath(PDF *p);

/* Close the path, fill, and stroke it. */
PDFLIB_API void PDFLIB_CALL
PDF_closepath_fill_stroke(PDF *p);

/* Close the path, and stroke it. */
PDFLIB_API void PDFLIB_CALL
PDF_closepath_stroke(PDF *p);

/* Apply a transformation matrix to the current coordinate system. */
PDFLIB_API void PDFLIB_CALL
PDF_concat(PDF *p, double a, double b, double c, double d, double e, double f);

/* Print text at the next line. */
PDFLIB_API void PDFLIB_CALL
PDF_continue_text(PDF *p, const char *text);

/* Same as PDF_continue_text(), but with explicit string length. */
PDFLIB_API void PDFLIB_CALL
PDF_continue_text2(PDF *p, const char *text, int len);

/* Convert a string in an arbitrary encoding to a Unicode string in various
   formats.
   Returns: The converted Unicode string.
*/
PDFLIB_API const char * PDFLIB_CALL
PDF_convert_to_unicode(PDF *p, const char *inputformat,
    const char *inputstring, int inputlen, int *outputlen, const char *optlist);

/* Create a 3D view (requires PDF 1.6).
   Returns: A 3D view handle, or -1 (in PHP: 0) on error.
*/
PDFLIB_API int PDFLIB_CALL
PDF_create_3dview(PDF *p, const char *username, int len, const char *optlist);

/* Create an action which can be applied to various objects and events.
   Returns: An action handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_create_action(PDF *p, const char *type, const char *optlist);

/* Create an annotation on the current page. */
PDFLIB_API void PDFLIB_CALL
PDF_create_annotation(PDF *p, double llx, double lly, double urx, double ury,
    const char *type, const char *optlist);

/* Create a DeviceN colorspace with an arbitrary number of color components.
   Returns: A DeviceN color space handle, or -1 (in PHP: 0) on error.
 */
PDFLIB_API int PDFLIB_CALL
PDF_create_devicen(PDF *p, const char *optlist);

/* Create a bookmark subject to various options.
   Returns: A handle for the generated bookmark.
*/
PDFLIB_API int PDFLIB_CALL
PDF_create_bookmark(PDF *p, const char *text, int len, const char *optlist);

/* Create a form field on the current page subject to various options. */
PDFLIB_API void PDFLIB_CALL
PDF_create_field(PDF *p, double llx, double lly, double urx, double ury,
    const char *name, int len, const char *type, const char *optlist);

/* Create a form field group subject to various options. */
PDFLIB_API void PDFLIB_CALL
PDF_create_fieldgroup(PDF *p, const char *name, int len, const char *optlist);

/* Create a graphics state object subject to various options.
   Returns: A graphics state handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_create_gstate(PDF *p, const char *optlist);

/* Create a named virtual read-only file from data provided in memory. */
PDFLIB_API void PDFLIB_CALL
PDF_create_pvf(PDF *p, const char *filename, int len,
    const void *data, size_t size, const char *optlist);

/* Create a Textflow object from text contents, inline options, and explicit
   options.
   Returns: A Textflow handle, or -1 (in PHP: 0) on error.
*/
PDFLIB_API int PDFLIB_CALL
PDF_create_textflow(PDF *p, const char *text, int len, const char *optlist);

/* Draw a Bezier curve from the current point, using three more control
   points. */
PDFLIB_API void PDFLIB_CALL
PDF_curveto(PDF *p,
    double x1, double y1, double x2, double y2, double x3, double y3);

/* Create a new layer definition (requires PDF 1.5).
   Returns: A layer handle which can be used in subsequent layer-related calls.
*/
PDFLIB_API int PDFLIB_CALL
PDF_define_layer(PDF *p, const char *name, int len, const char *optlist);

/* Deflate a Unicode string (UTF-16 or UTF-32) to a byte string (unsupported)
*/
PDFLIB_API const char * PDFLIB_CALL
PDF_deflate_unicode(PDF *p, const char *utfstring, int len, int charsize,
    int *highchar);

/* Delete a PDFlib object and free all internal resources. */
PDFLIB_API void PDFLIB_CALL
PDF_delete(PDF *p);

/* Delete a path object. */
PDFLIB_API void PDFLIB_CALL
PDF_delete_path(PDF *p, int path);

/* Delete a named virtual file and free its data structures (but not the
   contents).
   Returns: -1 (in PHP: 0) if the virtual file exists but is locked, and
   1 otherwise.
 */
PDFLIB_API int PDFLIB_CALL
PDF_delete_pvf(PDF *p, const char *filename, int len);

/* Delete a table and all associated data structures. */
PDFLIB_API void PDFLIB_CALL
PDF_delete_table(PDF *p, int table, const char *optlist);

/* Delete a Textflow and all associated data structures. */
PDFLIB_API void PDFLIB_CALL
PDF_delete_textflow(PDF *p, int textflow);

/* Draw a path object. */
PDFLIB_API void PDFLIB_CALL PDF_draw_path(PDF *p, int path, double x, double y,
    const char *optlist);

/* Draw an ellipse. */
PDFLIB_API void PDFLIB_CALL
PDF_ellipse(PDF *p, double x, double y, double rx, double ry);

/* Draw an elliptical arc segment from the current point. */
PDFLIB_API void PDFLIB_CALL
PDF_elliptical_arc(PDF *p, double x, double y, double rx, double ry,
    const char *optlist);

/* Add a glyph name and/or Unicode value to a custom 8-bit encoding. */
PDFLIB_API void PDFLIB_CALL
PDF_encoding_set_char(PDF *p, const char *encoding, int slot,
    const char *glyphname, int uv);

/* Close the generated PDF document and apply various options. */
PDFLIB_API void PDFLIB_CALL
PDF_end_document(PDF *p, const char *optlist);

/* Close a node in the document part hierarchy (requires PDF/VT or PDF 2.0). */
PDFLIB_API void PDFLIB_CALL
PDF_end_dpart(PDF *p, const char *optlist);

/* Terminate a Type 3 font definition. */
PDFLIB_API void PDFLIB_CALL
PDF_end_font(PDF *p);

/* Terminate a glyph definition for a Type 3 font. */
PDFLIB_API void PDFLIB_CALL
PDF_end_glyph(PDF *p);

/* Close a structure element or other content item. */
PDFLIB_API void PDFLIB_CALL
PDF_end_item(PDF *p, int id);

/* Deactivate all active layers (requires PDF 1.5). */
PDFLIB_API void PDFLIB_CALL
PDF_end_layer(PDF *p);

/* End the least recently opened marked content sequence. */
PDFLIB_API void PDFLIB_CALL
PDF_end_mc(PDF *p);

/* Deprecated, use PDF_end_page_ext(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_end_page(PDF *p));

/* Finish a page and apply various options. */
PDFLIB_API void PDFLIB_CALL
PDF_end_page_ext(PDF *p, const char *optlist);

/* Finish the definition of a tiling pattern. */
PDFLIB_API void PDFLIB_CALL
PDF_end_pattern(PDF *p);

/* Deprecated, use PDF_end_template_ext(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_end_template(PDF *p));

/* Finish a template definition. */
PDFLIB_API void PDFLIB_CALL
PDF_end_template_ext(PDF *p, double width, double height);

/* End the current path without filling or stroking it. */
PDFLIB_API void PDFLIB_CALL
PDF_endpath(PDF *p);

/* Fill the interior of the path with the current fill color. */
PDFLIB_API void PDFLIB_CALL
PDF_fill(PDF *p);

/* Fill a graphics Block with variable data according to its properties.
   Returns: -1 (in PHP: 0) on error, and 1 otherwise.
*/
PDFLIB_API int PDFLIB_CALL
PDF_fill_graphicsblock(PDF *p, int page, const char *blockname,
    int graphics, const char *optlist);

/* Fill an image block with variable data according to its properties.
   Returns: -1 (in PHP: 0) on error, and 1 otherwise.
*/
PDFLIB_API int PDFLIB_CALL
PDF_fill_imageblock(PDF *p, int page, const char *blockname,
    int image, const char *optlist);

/* Fill a PDF block with variable data according to its properties.
   Returns: -1 (in PHP: 0) on error, and 1 otherwise.
*/
PDFLIB_API int PDFLIB_CALL
PDF_fill_pdfblock(PDF *p, int page, const char *blockname,
    int contents, const char *optlist);

/* Fill and stroke the path with the current fill and stroke color. */
PDFLIB_API void PDFLIB_CALL
PDF_fill_stroke(PDF *p);

/* Fill a Textline or Textflow Block with variable data according to its
   properties.
   Returns: -1 (in PHP: 0) on error, and 1 otherwise.
*/
PDFLIB_API int PDFLIB_CALL
PDF_fill_textblock(PDF *p, int page, const char *blockname,
    const char *text, int len, const char *optlist);

/* Deprecated, use PDF_load_font(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_findfont(PDF *p, const char *fontname, const char *encoding, int embed));

/* Place vector graphics on a content stream, subject to various options. */
PDFLIB_API void PDFLIB_CALL
PDF_fit_graphics(PDF *p, int graphics, double x, double y, const char *optlist);

/* Place an image or template on the page, subject to various options. */
PDFLIB_API void PDFLIB_CALL
PDF_fit_image(PDF *p, int image, double x, double y, const char *optlist);

/* Place an imported PDF page on the output page subject to various options. */
PDFLIB_API void PDFLIB_CALL
PDF_fit_pdi_page(PDF *p, int page, double x, double y, const char *optlist);

/* Fully or partially place a table on the page.
   Returns: A string which specifies the reason for returning.
*/
PDFLIB_API const char * PDFLIB_CALL
PDF_fit_table(PDF *p, int table, double llx, double lly,
    double urx, double ury, const char *optlist);

/* Format the next portion of a Textflow.
   Returns: A string which specifies the reason for returning.
*/
PDFLIB_API const char * PDFLIB_CALL
PDF_fit_textflow(PDF *p, int textflow, double llx, double lly,
    double urx, double ury, const char *optlist);

/* Place a single line of text at position (x, y) subject to various options. */
PDFLIB_API void PDFLIB_CALL
PDF_fit_textline(PDF *p, const char *text, int len, double x, double y,
    const char *optlist);

/*
 * Retrieve a structure with PDFlib API function pointers (mainly for DLLs).
 * Although this function is published here, it is not supposed to be used
 * directly by clients. Use PDF_new_dl() in pdflibdl.c instead.
 */
PDFLIB_API const PDFlib_api * PDFLIB_CALL
PDF_get_api(void);

/* Get the name of the API function which threw the last exception or failed.
   Returns: Name of an API function.
*/
PDFLIB_API const char * PDFLIB_CALL
PDF_get_apiname(PDF *p);

/* Get the contents of the PDF output buffer.
   Returns: A buffer full of binary PDF data for consumption by the client.
*/
PDFLIB_API const char * PDFLIB_CALL
PDF_get_buffer(PDF *p, long *size);

/* Get the text of the last thrown exception or the reason of a failed
   function call.
   Returns: Text containing the description of the most recent error condition.
*/
PDFLIB_API const char * PDFLIB_CALL
PDF_get_errmsg(PDF *p);

/* Get the number of the last thrown exception or the reason of a failed
   function call.
   Returns: The error code of the most recent error condition.
*/
PDFLIB_API int PDFLIB_CALL
PDF_get_errnum(PDF *p);

/* Request the amount of kerning between two glyphs (unsupported). */
PDFLIB_API double PDFLIB_CALL
PDF_get_kern_amount(PDF *p, int font, int gidleft, int gidright);

/* Deprecated, use PDF_get_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_get_majorversion(void));

/* Deprecated, use PDF_get_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_get_minorversion(void));

/* Fetch the opaque application pointer stored in PDFlib.
   Returns: The opaque application pointer stored in PDFlib.
*/
PDFLIB_API void * PDFLIB_CALL
PDF_get_opaque(PDF *p);

/* Retrieve some option or other value.
   Returns: The value of some option value as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_get_option(PDF *p, const char *keyword, const char *optlist);

/* Deprecated, use PDF_get_option() and PDF_get_string(). */
PDFLIB_DEPRECATED(
PDFLIB_API const char * PDFLIB_CALL
PDF_get_parameter(PDF *p, const char *key, double modifier));

/* Deprecated, use PDF_pcos_get_string(). */
PDFLIB_DEPRECATED(
PDFLIB_API const char * PDFLIB_CALL
PDF_get_pdi_parameter(PDF *p, const char *key, int doc, int page,
    int reserved, int *len));

/* Deprecated, use PDF_pcos_get_number. */
PDFLIB_DEPRECATED(
PDFLIB_API double PDFLIB_CALL
PDF_get_pdi_value(PDF *p, const char *key, int doc, int page, int reserved));

/* Retrieve a string value.
   Returns: a string identified by a string index returned by another
   function. */
PDFLIB_API const char * PDFLIB_CALL
PDF_get_string(PDF *p, int idx, const char *optlist);

/* Get the type of the Unicode format which belongs to the Unicode string
   returned from the last API function (unsupported)
*/
PDFLIB_API pdf_unicode_format PDFLIB_CALL
PDF_get_unicode_format(
    PDF *p);

/* Deprecated, use PDF_get_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API double PDFLIB_CALL
PDF_get_value(PDF *p, const char *key, double modifier));

/* Query detailed information about a loaded font.
   Returns: The value of some font property as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_font(PDF *p, int font, const char *keyword, const char *optlist);

/* Format vector graphics and query metrics and other properties.
   Returns: The value of some graphics metrics as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_graphics(PDF *p, int graphics, const char *keyword,
    const char *optlist);

/* Format an image and query metrics and other image properties.
   Returns: The value of some image metrics as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_image(PDF *p, int image, const char *keyword, const char *optlist);

/* Query information about a matchbox on the current page.
   Returns: The value of some matchbox parameter as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_matchbox(PDF *p, const char *boxname, int len, int num,
    const char *keyword);

/* Query the results of drawing a path object without actually drawing it.
   Returns: The value of some geometrical values as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_path(PDF *p, int path, const char *keyword, const char *optlist);

/* Perform formatting calculations for a PDI page and query the resulting
   metrics.
   Returns: The value of some page metrics as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_pdi_page(PDF *p, int page, const char *keyword, const char *optlist);

/* Query properties of a virtual file or the PDFlib Virtual Filesystem (PVF)
   Returns: The value of some file parameter as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_pvf(PDF *p, const char *filename, int len, const char *keyword);

/* Query table information related to the most recently placed table
   instance.
   Returns: The value of some table parameter as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_table(PDF *p, int table, const char *keyword);

/* Query the current state of a Textflow after a call to PDF_fit_textflow().
   Returns: The value of some table parameter as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_textflow(PDF *p, int textflow, const char *keyword);

/* Perform textline formatting without creating output and query the resulting
   metrics.
   Returns: The value of some text metric value as requested by keyword.
*/
PDFLIB_API double PDFLIB_CALL
PDF_info_textline(PDF *p, const char *text, int len, const char *keyword,
    const char *optlist);

/* Deprecated, use PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_initgraphics(PDF *p));

/* Draw a line from the current point to another point. */
PDFLIB_API void PDFLIB_CALL
PDF_lineto(PDF *p, double x, double y);

/* Load a 3D model from a disk-based or virtual file (requires PDF 1.6).
   Returns: A 3D handle, or -1 (in PHP: 0) on error.
*/
PDFLIB_API int PDFLIB_CALL
PDF_load_3ddata(PDF *p, const char *filename, int len, const char *optlist);

/* Load a rich media asset or file attachment from a disk-based or virtual
   file.
   Returns: An asset handle, or -1 (in PHP: 0) on error.
 */
PDFLIB_API int PDFLIB_CALL
PDF_load_asset(PDF *p, const char *type, const char *filename,
        int len, const char *optlist);

/* Search for a font and prepare it for later use.
   Returns: A font handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_load_font(PDF *p, const char *fontname, int len,
    const char *encoding, const char *optlist);

/* Open a disk-based or virtual vector graphics file subject to various options.
   Returns: A graphics handle, or -1 (in PHP: 0) on error.
*/
PDFLIB_API int PDFLIB_CALL
PDF_load_graphics(PDF *p, const char *type, const char *filename,
    int len, const char *optlist);

/* Search for an ICC profile and prepare it for later use.
   Returns: A profile handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_load_iccprofile(PDF *p, const char *profilename, int len,
    const char *optlist);

/* Open a disk-based or virtual image file subject to various options.
   Returns: An image handle, or -1 (in PHP: 0) on error.
*/
PDFLIB_API int PDFLIB_CALL
PDF_load_image(PDF *p, const char *imagetype, const char *filename,
    int len, const char *optlist);

/* Find a built-in spot color name, or make a named spot color from the
   current fill color.
   Returns: A color handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_makespotcolor(PDF *p, const char *spotname, int reserved);

/* Add a marked content point with optional properties. */
PDFLIB_API void PDFLIB_CALL
PDF_mc_point(PDF *p, const char *tagname, const char *optlist);

/* Set the current point for graphics output. */
PDFLIB_API void PDFLIB_CALL
PDF_moveto(PDF *p, double x, double y);

/* Create a new PDFlib object.
   Returns: A handle to a PDFlib object.
*/
PDFLIB_API PDF * PDFLIB_CALL
PDF_new(void);

/* Create a new PDFlib object with client-supplied error handling and memory
   allocation routines.
   Returns: A handle to a PDFlib object.
*/
typedef void  (*errorproc_t)(PDF *p1, int errortype, const char *msg);
typedef void* (*allocproc_t)(PDF *p2, size_t size, const char *caller);
typedef void* (*reallocproc_t)(PDF *p3,
                void *mem, size_t size, const char *caller);
typedef void  (*freeproc_t)(PDF *p4, void *mem);

PDFLIB_API PDF * PDFLIB_CALL
PDF_new2(errorproc_t errorhandler, allocproc_t allocproc,
        reallocproc_t reallocproc, freeproc_t freeproc, void *opaque);

/* Deprecated, use PDF_load_image(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_open_CCITT(PDF *p, const char *filename, int width, int height,
    int BitReverse, int K, int BlackIs1));

/* Deprecated, use PDF_begin_document(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_open_file(PDF *p, const char *filename));

/* Deprecated, use PDF_load_image() with virtual files. */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_open_image(PDF *p, const char *imagetype, const char *source,
    const char *data, long length, int width, int height, int components,
    int bpc, const char *params));

/* Deprecated, use PDF_load_image(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_open_image_file(PDF *p, const char *imagetype, const char *filename,
    const char *stringparam, int intparam));

/* Deprecated, use PDF_begin_document_callback(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_open_mem(PDF *p, writeproc_t writeproc));

/* Deprecated, use PDF_open_pdi_document(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_open_pdi(PDF *p, const char *filename, const char *optlist, int len));

/* Open a disk-based or virtual PDF document and prepare it for later use.
   Returns: A PDI document handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_open_pdi_document(PDF *p, const char *filename, int len,
    const char *optlist);

/* Platform- and compiler-specific file offset type for large files >2GB.
 * It must match the internal type pdc_off_t.
 */
#if defined(WIN32)
    #if defined(__BORLANDC__)
        typedef fpos_t  pdf_off_t;
    #else
        typedef __int64 pdf_off_t;
    #endif
#else
    /* LFS support available on non-Windows platform? */
    #if defined(_LARGE_FILES) || defined(_LARGEFILE_SOURCE) || _FILE_OFFSET_BITS==64
    #include <sys/types.h>
        typedef off_t   pdf_off_t;
    #else /* LFS support */
        typedef long    pdf_off_t;
    #endif /* LFS support */
#endif

/* Open a PDF document from a custom data source and prepare it for
   later use.
   Returns: A PDI document handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_open_pdi_callback(PDF *p, void *opaque, pdf_off_t filesize,
    size_t (*readproc)(void *opaque, void *buffer, size_t size),
    int (*seekproc)(void *opaque, pdf_off_t offset),
    const char *optlist);

/* Prepare a page for later use with PDF_fit_pdi_page().
   Returns: A page handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_open_pdi_page(PDF *p, int doc, int pagenumber, const char *optlist);

/* Get the value of a pCOS path with type number or boolean.
   Returns: The numerical value of the object identified by the pCOS path.
*/
PDFLIB_API double PDFLIB_CALL
PDF_pcos_get_number(PDF *p, int doc, const char *path, ...);

/* Get the value of a pCOS path with type name, number, string, or boolean.
   Returns: A string with the value of the object identified by the pCOS path.
*/
PDFLIB_API const char * PDFLIB_CALL
PDF_pcos_get_string(PDF *p, int doc, const char *path, ...);

/* Get the contents of a pCOS path with type stream, fstream, or string.
   Returns: The unencrypted data contained in the stream or string.
*/
PDFLIB_API const unsigned char * PDFLIB_CALL
PDF_pcos_get_stream(PDF *p, int doc, int *length, const char *optlist,
    const char *path, ...);

/* Deprecated, use PDF_fit_image(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_place_image(PDF *p, int image, double x, double y, double scale));

/* Deprecated, use PDF_fit_pdi_page(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_place_pdi_page(PDF *p, int page, double x, double y, double sx, double sy));

/* Delete a PDF container object. */
PDFLIB_API void PDFLIB_CALL
PDF_poca_delete(PDF *p, int container, const char *optlist);

/* Insert a simple or container object in a PDF container object. */
PDFLIB_API void PDFLIB_CALL
PDF_poca_insert(PDF *p, int container, const char *optlist);

/* Create a new PDF container object of type dictionary, array, or stream
   and insert objects.
   Returns: A container handle which can be used until it is deleted with
   PDF_poca_delete().
*/
PDFLIB_API int PDFLIB_CALL
PDF_poca_new(PDF *p, const char *optlist);

/* Remove a simple or container object from a PDF container object. */
PDFLIB_API void PDFLIB_CALL
PDF_poca_remove(PDF *p, int container, const char *optlist);

/* Process certain elements of an imported PDF document.
   Returns: -1 (in PHP: 0) on error, and 1 otherwise.
*/
PDFLIB_API int PDFLIB_CALL
PDF_process_pdi(PDF *p, int doc, int page, const char *optlist);

/* Draw a Bezier curve using relative coordinates (unsupported). */
PDFLIB_API void PDFLIB_CALL
PDF_rcurveto(PDF *p,
    double x1, double y1, double x2, double y2, double x3, double y3);

/* Draw a rectangle. */
PDFLIB_API void PDFLIB_CALL
PDF_rect(PDF *p, double x, double y, double width, double height);

/* Restore the most recently saved graphics state from the stack. */
PDFLIB_API void PDFLIB_CALL
PDF_restore(PDF *p);

/* Resume a page to add more content to it. */
PDFLIB_API void PDFLIB_CALL
PDF_resume_page(PDF *p, const char *optlist);

/* Draw a line from the current point to (cp + (x, y)) (unsupported). */
PDFLIB_API void PDFLIB_CALL
PDF_rlineto(PDF *p, double x, double y);

/* Set the new current point relative the old current point (unsupported). */
PDFLIB_API void PDFLIB_CALL
PDF_rmoveto(PDF *p, double x, double y);

/* Rotate the coordinate system. */
PDFLIB_API void PDFLIB_CALL
PDF_rotate(PDF *p, double phi);

/* Save the current graphics state to a stack. */
PDFLIB_API void PDFLIB_CALL
PDF_save(PDF *p);

/* Scale the coordinate system. */
PDFLIB_API void PDFLIB_CALL
PDF_scale(PDF *p, double sx, double sy);

/* Deprecated, use PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_set_border_color(PDF *p, double red, double green, double blue));

/* Deprecated, use PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_set_border_dash(PDF *p, double b, double w));

/* Deprecated, use PDF_create_annotation(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_set_border_style(PDF *p, const char *style, double width));

/* Set one or more graphics appearance options. */
PDFLIB_API void PDFLIB_CALL
PDF_set_graphics_option(PDF *p, const char *optlist);

/* Activate a graphics state object. */
PDFLIB_API void PDFLIB_CALL
PDF_set_gstate(PDF *p, int gstate);

/* Fill document information field key with value. */
PDFLIB_API void PDFLIB_CALL
PDF_set_info(PDF *p, const char *key, const char *value);

/* Like PDF_set_info(), but with explicit string length. */
PDFLIB_API void PDFLIB_CALL
PDF_set_info2(PDF *p, const char *key, const char *value, int len);

/* Define layer relationships (requires PDF 1.5). */
PDFLIB_API void PDFLIB_CALL
PDF_set_layer_dependency(PDF *p, const char *type, const char *optlist);

/* Set one or more global options. */
PDFLIB_API void PDFLIB_CALL
PDF_set_option(PDF *p, const char *optlist);

/* Deprecated, use PDF_set_option(), PDF_set_text_option(),
   and PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_set_parameter(PDF *p, const char *key, const char *value));

/* Set one or more text filter or text appearance options for simple text
   output functions. */
PDFLIB_API void PDFLIB_CALL
PDF_set_text_option(PDF *p, const char *optlist);

/* Set the position for simple text output */
PDFLIB_API void PDFLIB_CALL
PDF_set_text_pos(PDF *p, double x, double y);

/* Register a variable name (currently unsupported). */
PDFLIB_API int PDFLIB_CALL
PDF_set_textflow_variable(PDF *p, const char *varname, int namelen,
    const char *text, int textlen, const char *optlist);

/* Deprecated, use PDF_set_option(), PDF_set_text_option(),
   and PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_set_value(PDF *p, const char *key, double value));

/* Set the color space and color for the graphics and text state. */
PDFLIB_API void PDFLIB_CALL
PDF_setcolor(PDF *p, const char *fstype, const char *colorspace,
    double c1, double c2, double c3, double c4);

/* Deprecated, use PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setdash(PDF *p, double b, double w));

/* Deprecated, use PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setdashpattern(PDF *p, const char *optlist));

/* Deprecated, use PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setflat(PDF *p, double flatness));

/* Set the current font in the specified size. */
PDFLIB_API void PDFLIB_CALL
PDF_setfont(PDF *p, int font, double fontsize);

/* Deprecated, use PDF_setcolor(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setgray(PDF *p, double gray));

/* Deprecated, use PDF_setcolor(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setgray_fill(PDF *p, double gray));

/* Deprecated, use PDF_setcolor(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setgray_stroke(PDF *p, double gray));

/* Deprecated, use PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setlinecap(PDF *p, int linecap));

/* Deprecated, use PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setlinejoin(PDF *p, int linejoin));

/* Set the current linewidth. */
PDFLIB_API void PDFLIB_CALL
PDF_setlinewidth(PDF *p, double width);

/* Explicitly set the current transformation matrix. */
PDFLIB_API void PDFLIB_CALL
PDF_setmatrix(PDF *p, double a, double b, double c, double d,
    double e, double f);

/* Deprecated, use PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setmiterlimit(PDF *p, double miter));

/* Deprecated, use PDF_set_graphics_option(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setpolydash(PDF *p, float *dasharray, int length));

/* Deprecated, use PDF_setcolor(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setrgbcolor(PDF *p, double red, double green, double blue));

/* Deprecated, use PDF_setcolor(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setrgbcolor_fill(PDF *p, double red, double green, double blue));

/* Deprecated, use PDF_setcolor(). */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_setrgbcolor_stroke(PDF *p, double red, double green, double blue));

/* Define a shading (color gradient) between two or more colors.
   Returns: A shading handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_shading(PDF *p, const char *type, double x0, double y0, double x1,
    double y1, double c1, double c2, double c3, double c4,
    const char *optlist);

/* Define a shading pattern using a shading object.
   Returns: A pattern handle.
*/
PDFLIB_API int PDFLIB_CALL
PDF_shading_pattern(PDF *p, int shading, const char *optlist);

/* Fill an area with a shading. */
PDFLIB_API void PDFLIB_CALL
PDF_shfill(PDF *p, int shading);

/* Print text in the current font and size at the current position. */
PDFLIB_API void PDFLIB_CALL
PDF_show(PDF *p, const char *text);

/* Same as PDF_show() but with explicit string length. */
PDFLIB_API void PDFLIB_CALL
PDF_show2(PDF *p, const char *text, int len);

/* Deprecated, use PDF_fit_textline() or PDF_fit_textflow(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_show_boxed(PDF *p, const char *text, double left, double top,
    double width, double height, const char *hmode, const char *feature));

/* Deprecated, use PDF_fit_textline() or PDF_fit_textflow(). */
PDFLIB_DEPRECATED(
PDFLIB_API int PDFLIB_CALL
PDF_show_boxed2(PDF *p, const char *text, int len, double left, double top,
    double width, double height, const char *hmode, const char *feature));

/* Print text in the current font at the specified position. */
PDFLIB_API void PDFLIB_CALL
PDF_show_xy(PDF *p, const char *text, double x, double y);

/* Same as PDF_show_xy(), but with explicit string length. */
PDFLIB_API void PDFLIB_CALL
PDF_show_xy2(PDF *p, const char *text, int len, double x, double y);

/* Deprecated, and not required. */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_shutdown(void));

/* Skew the coordinate system. */
PDFLIB_API void PDFLIB_CALL
PDF_skew(PDF *p, double alpha, double beta);

/* Calculate the width of text in an arbitrary font.
   Returns: The width of text.
*/
PDFLIB_API double PDFLIB_CALL
PDF_stringwidth(PDF *p, const char *text, int font, double fontsize);

/* Same as PDF_stringwidth(), but with explicit string length.
   Returns: The width of text.
 */
PDFLIB_API double PDFLIB_CALL
PDF_stringwidth2(PDF *p, const char *text, int len, int font, double fontsize);

/* Stroke the path with the current line width and current stroke color,
   and clear it. */
PDFLIB_API void PDFLIB_CALL
PDF_stroke(PDF *p);

/* Suspend the current page so that it can later be resumed. */
PDFLIB_API void PDFLIB_CALL
PDF_suspend_page(PDF *p, const char *optlist);

/* Translate the origin of the coordinate system. */
PDFLIB_API void PDFLIB_CALL
PDF_translate(PDF *p, double tx, double ty);

/* Deprecated, use PDF_convert_to_unicode() */
PDFLIB_DEPRECATED(
PDFLIB_API const char * PDFLIB_CALL
PDF_utf16_to_utf8(PDF *p, const char *utf16string, int len, int *size));

/* Deprecated, use PDF_convert_to_unicode() */
PDFLIB_DEPRECATED(
PDFLIB_API const char * PDFLIB_CALL
PDF_utf8_to_utf16(PDF *p, const char *utf8string, const char *ordering,
    int *size));

/* Deprecated, use PDF_convert_to_unicode() */
PDFLIB_DEPRECATED(
PDFLIB_API const char * PDFLIB_CALL
PDF_utf32_to_utf8(PDF *p, const char *utf32string, int len, int *size));

/* Deprecated, use PDF_convert_to_unicode() */
PDFLIB_DEPRECATED(
PDFLIB_API const char * PDFLIB_CALL
PDF_utf8_to_utf32(PDF *p, const char *utf8string, const char *ordering,
    int *size));

/* Deprecated, use PDF_convert_to_unicode() */
PDFLIB_DEPRECATED(
PDFLIB_API const char * PDFLIB_CALL
PDF_utf16_to_utf32(PDF *p, const char *utf16string, int len,
    const char *ordering, int *size));

/* Deprecated, use PDF_convert_to_unicode() */
PDFLIB_DEPRECATED(
PDFLIB_API const char * PDFLIB_CALL
PDF_utf32_to_utf16(PDF *p, const char *utf32string, int len,
    const char *ordering, int *size));

/* Deprecated, use PDF_fit_textline() with "xadvancelist" option */
PDFLIB_DEPRECATED(
PDFLIB_API void PDFLIB_CALL
PDF_xshow(PDF *p, const char *text, int len, const double *xadvancelist));

*)
(* ----------------------------------------------------------------------
 * PDFlib API structure with function pointers to all API functions
 * ----------------------------------------------------------------------*)

(* ----------------------------------------------------------------------
 * pCOS-specific enums and defines
 * ----------------------------------------------------------------------)

(* Guard against multiple definition of pcos_mode and pcos_object_type for the
 * case that multiple PDFlib products are used in the same program.*)
type
// document access levels.
TPcosMode = (
    pcos_mode_minimum	   = 0, // encrypted doc (opened w/o password)
    pcos_mode_restricted = 1, // encrypted doc (opened w/ user password)
    pcos_mode_full	     = 2  // unencrypted doc or opened w/ master password
);


// object types.

TPcosObjectType =
(
    pcos_ot_null	  = 0,
    pcos_ot_boolean	= 1,
    pcos_ot_number	= 2,
    pcos_ot_name  	= 3,
    pcos_ot_string	= 4,
    pcos_ot_array	  = 5,
    pcos_ot_dict	  = 6,
    pcos_ot_stream	= 7,
    pcos_ot_fstream	= 8
);


(* ------------------------------------------------------------------------
 * Deprecated: macros for page size formats
 * ------------------------------------------------------------------------*)

(* The page sizes are only available to the C and C++ bindings.
 * These are deprecated; corresponding options are supported in
 * PDF_begin_page_ext().*)

const
  a0_width	    = 2380.0;
  a0_height	    = 3368.0;
  a1_width	    = 1684.0;
  a1_height	    = 2380.0;
  a2_width	    = 1190.0;
  a2_height	    = 1684.0;
  a3_width	    = 842.0;
  a3_height	    = 1190.0;
  a4_width	    = 595.0;
  a4_height	    = 842.0;
  a5_width	    = 421.0;
  a5_height	    = 595.0;
  a6_width	    = 297.0;
  a6_height	    = 421.0;
  b5_width	    = 501.0;
  b5_height	    = 709.0;
  letter_width	= 612.0;
  letter_height	= 792.0;
  legal_width 	= 612.0;
  legal_height 	= 1008.0;
  ledger_width	= 1224.0;
  ledger_height	= 792.0;
  p11x17_width	= 792.0;
  p11x17_height	= 1224.0;

 (* ----------------------------------------------------------------------
 * Deprecated: Error classes
 * Old-style error handlers are still supported, but
 * they will always receive PDF_UnknownError.
 * ----------------------------------------------------------------------*)

  PDF_UnknownError = 12;

(* ----------------------------------------------------------------------
 * Private stuff, do not use explicitly but only via the macros above!
 * ----------------------------------------------------------------------*)
{
PDFLIB_API pdf_jmpbuf * PDFLIB_CALL
pdf_jbuf(PDF *p);

PDFLIB_API void PDFLIB_CALL
pdf_exit_try(PDF *p);

PDFLIB_API int PDFLIB_CALL
pdf_catch(PDF *p);

PDFLIB_API void PDFLIB_CALL
pdf_rethrow(PDF *p);

PDFLIB_API void PDFLIB_CALL
pdf_throw(PDF *p, const char *binding, const char *apiname, const char *errmsg);
}

implementation

end.
