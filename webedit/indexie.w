/*E4GL-W*/ {src/web/method/e4gl.i} {&OUT} '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">~n'.
{&OUT} '<!--------------------------------------------------------------------~n'.
{&OUT} '* Copyright (C) 2000 by Progress Software Corporation. All rights    *~n'.
{&OUT} '* reserved. Prior versions of this work may contain portions         *~n'.
{&OUT} '* contributed by participants of Possenet.                           *~n'.
{&OUT} '*                                                                    *~n'.
{&OUT} '--------------------------------------------------------------------->~n'.
{&OUT} '<HTML>~n'.
{&OUT} '<HEAD>~n'.
{&OUT} '<TITLE>WebSpeed Editor</TITLE>~n'.
{&OUT} '<META NAME="wsoptions" CONTENT="compile">~n'.
{&OUT} '</HEAD>~n'.
{&OUT} '<FRAMESET FRAMEBORDER=1 ROWS="64,*">~n'.
{&OUT} '  <FRAME ID="WS_hdr" SRC="../webedit/headie.w"  ~n'.
{&OUT} '    MARGINHEIGHT=8 MARGINWIDTH=5 NORESIZE SCROLLING="no">~n'.
{&OUT} '  <FRAMESET FRAMEBORDER=1 COLS="135,100%,*">~n'.
{&OUT} '    <FRAME ID="WS_menu" SRC="../webedit/menu.w"  NORESIZE ~n'.
{&OUT} '      MARGINHEIGHT=5 MARGINWIDTH=5>>~n'.
{&OUT} '    <FRAME ID="WS_edit" SRC="../webedit/editorie.w" SCROLLING="no">~n'.
{&OUT} '    <FRAME ID="WS_file" SRC="' /*Tag=`*/ RootURL /*Tag=`*/ '/workshop/body.html" SCROLLING="no" ~n'.
{&OUT} '      NORESIZE FRAMEBORDER=0 MARGINHEIGHT=0 MARGINWIDTH=0>~n'.
{&OUT} '  </FRAMESET>~n'.

{&OUT} '  <NOFRAMES>~n'.
{&OUT} '    <BODY>~n'.
{&OUT} '    <P>This web page uses frames, but your browser doesn''t support them.</P>~n'.
{&OUT} '    </BODY>~n'.
{&OUT} '  </NOFRAMES>~n'.
{&OUT} '</FRAMESET>~n'.
{&OUT} '</HTML>~n'.

/************************* END OF HTML *************************/
/*
** File: src/main/abl/webedit/indexie.w
** Generated on: 2021-03-15 16:17:37
** By: WebSpeed Embedded SpeedScript Preprocessor
** Version: 2
** Source file: src/main/abl/webedit/indexie.html
** Options: compile,wsoptions-found,web-object
**
** WARNING: DO NOT EDIT THIS FILE.  Make changes to the original
** HTML file and regenerate this file from it.
**
*/
/********************* Internal Definitions ********************/

/* This procedure returns the generation options at runtime.
   It is invoked by src/web/method/e4gl.i included at the start
   of this file. */
PROCEDURE local-e4gl-options :
  DEFINE OUTPUT PARAMETER p_version AS DECIMAL NO-UNDO
    INITIAL 2.0.
  DEFINE OUTPUT PARAMETER p_options AS CHARACTER NO-UNDO
    INITIAL "compile,wsoptions-found,web-object":U.
  DEFINE OUTPUT PARAMETER p_content-type AS CHARACTER NO-UNDO
    INITIAL "text/html":U.
END PROCEDURE.

/* end */
