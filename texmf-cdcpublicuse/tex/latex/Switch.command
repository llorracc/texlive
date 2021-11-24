#!/bin/sh

rm -f ~/Library/texmf/tex/latex/$1.txt 
echo "\provideboolean{$1TF}\setboolean{$1TF}{$2}\newcommand{\if$1}{\ifthenelse{\boolean{$1TF}}}" > ~/Library/texmf/tex/latex/$1.txt 
