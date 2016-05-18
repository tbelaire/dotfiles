$pdf_previewer = "open -a Skim.app";
# $pdflatex = 'xelatex %O %S -file-line-error -synctex=1';
$pdflatex = 'pdflatex -file-line-error -synctex=1 -interaction=nonstopmod';
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;
#$aux_dir = 'aux';
$out_dir = 'out';
