#!/usr/bin/perl
$latex = "find . -type f -name '*.tex' -print0 | xargs -0 sed -i '' -e 's/、/，/g' -e 's/。/．/g'; platex";
#$latex ='platex -guess-input-enc -src-specials -interaction=nonstopmode -synctex=1';
$latex_silent = 'platex -interaction=batchmode';
$dvips = 'dvips';
$bibtex = 'pbibtex';
$makeindex = 'mendex -r -c -s jind.ist';
$dvi_previewer = 'start dviout';
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_previewer = 'xdg-open';
$preview_continuous_mode = 1;
$pdf_mode = 3;
$pdf_update_method = 4;


