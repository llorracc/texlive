#!/bin/sh
# 2014-09-02 modified to fix an incompatibility between TexLive 2013 and hyperref; see http://tex.stackexchange.com/questions/120768/using-label-causes-error-with-htlatex-when-hyperref-is-used-in-tl-2013
# make "handout" LaTeX files from raw sources

cd /Volumes/Sync/Dropbox/Sys/Config/texlive/texmf-cdcpublicuse/tex/latex/

if [ -e handout.cls ]; then
    sudo chmod u+w handout.cls # below it is made read-only to remind that it is generated not editable; but here is where it is being generated, so allow writing
fi

touch   handout.cls
sudo rm handout.cls
sudo rm handout.sty
ditto bejournalBody.cls handoutBody.cls
rpl --fixed-strings 'bejournal' 'handout' handoutBody.cls
rpl --fixed-strings '[BE]' '[handout]' handoutBody.cls
rpl --fixed-strings '\RequirePackage{perpage}' '%\RequirePackage{perpage}' handoutBody.cls

# 20170126: perpage package conflicts with something else so is removed in handoutMake.sh
# perpage is used only for footnotes on first page of an article, so is not needed for a handout 

echo "% Made by handoutMake.sh" > handoutProvides.txt
echo "\ProvidesClass{handout}[2023/03/05 LaTeX class for handouts written by Christopher Carroll]" >> handoutProvides.txt

cat handoutPreamble.cls handoutProvides.txt handoutBody.cls > handout.cls 

cat `kpsewhich CDCDocStartForBE.tex` `kpsewhich handoutHeader.sty` `kpsewhich HandoutLinks.tex` `kpsewhich handoutNameMake.tex` `kpsewhich MathFactsList.defs` `kpsewhich examCDC.sty` `kpsewhich Fix-TexLive-2013-hyperref-bug.txt` > handoutSetup.sty

chmod u+w handoutShortcuts.sty # It is read-only to remind it's a generated file
echo '% Generated originally from CDCShortcuts.sty' > handoutShortcuts.sty
cat `kpsewhich CDCShortcuts.sty` >> handoutShortcuts.sty
chmod a-w handoutShortcuts.sty

rm handoutProvides.txt

rpl --fixed-strings 'bejournal' 'handout' handoutSetup.sty
rpl --fixed-strings '[BE]' '[handout]' handoutSetup.sty
rpl --fixed-strings 'CDCShortcuts' 'handoutShortcuts' handoutSetup.sty

chmod a-w handout.cls

cd $(dirname $(kpsewhich bejournal.sty))
ln -fs `kpsewhich bejournal.sty` ./handout.sty

# cat `kpsewhich CDCShortcuts.sty` `kpsewhich CDCDocStartForBE.tex` `kpsewhich handoutHeader.sty` `kpsewhich HandoutLinks.tex` `kpsewhich handoutNameMake.tex` `kpsewhich mathFactsList.defs` `kpsewhich examCDC.sty` > handoutSetup.sty

# rpl --fixed-strings '\usepackage{CDCShortcuts}' ' ' handoutSetup.sty

# excluded `kpsewhich handoutTitleMake.tex` because there are problems with embedding verbatimwrite

sudo texhash

