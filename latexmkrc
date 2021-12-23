#!/usr/bin/perl

$latex = 'lualatex -synctex=1 -halt-on-error';
$latex_silent = 'lualatex -synctex=1 -halt-on-error -interaction=nonstopmode';
# $bibtex = 'pbibtex';
# $biber = 'biber -uU --output-safechars';
# $dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mende %O -o %D %S';
$max_repeat = 5;
$pdf_mode = 3;
$pvc_view_file_via_temporary = 0;
$pdf_previewer = firefox;
