#!/bin/sh
# 20211020: Add \llorraccio for html content at llorracc.github.io
# 20191212: Change TaxCorp to taxCorp in Shortcuts
# make "econtex" LaTeX files from raw sources

# First, make the handout version
cd /Volumes/Sync/Dropbox/Sys/Config/texlive/texmf-cdcpublicuse/tex/latex/
./handoutMake.sh

ditto handoutPreamble.cls  econtexPreamble.cls
ditto handoutBody.cls      econtexBody.cls
ditto handoutBibMake.tex   econtexBibMake.tex
ditto handoutShortcuts.sty econtexShortcuts.sty

# perpage package causes some problems sometimes that are particularly serious in the context of handouts
# so handoutMake.sh comments it out
# But it is needed to produce the first page of a paper
# So we uncomment it here

rpl '%\RequirePackage{perpage}' '\RequirePackage{perpage}' econtexBody.cls


rpl '[handout]' '[econtex]' econtexBody.cls
rpl  'handout'   'econtex'  econtexBody.cls
rpl  'handout'   'econtex'  econtexPreamble.cls
rpl  'handout'   'econtex'  econtexBibMake.tex


# 20170703: Add RequirePackage{shapshot} to bejournal.cls so that creation of public archives can exclude unused figures
echo "\ProvidesClass{econtex}[2017/08/01 LaTeX class for economics papers, handouts, and exam questions written by Christopher Carroll]" > econtexProvides.txt
# 20170801: In bejournal.cls, comment out \usepackage{bejournal} and pasted in its contents because it would not work when *.cls is invoked from a non-document-root path

if [ -e econtex.cls ]; then
    sudo chmod u+w econtex.cls # Below it is made read-only to remind that it is a generated file; but here is where it is generated, so needs to be writeable!
fi

sudo rm -f econtex.cls

cat econtexPreamble.cls econtexProvides.txt econtexBody.cls > econtex.cls 
cat `kpsewhich CDCDocStartForBE-WithoutPackageCDCShortcuts.tex` `kpsewhich econtexHeader.sty` `kpsewhich HandoutLinks.tex` `kpsewhich econtexNameMake.tex` `kpsewhich mathFactsList.defs` `kpsewhich examCDC.sty` > econtexSetup.sty
rm econtexProvides.txt

echo 'CDCShortcuts.sty'
cd "$(dirname $(kpsewhich CDCShortcuts.sty))"
ln -fs `kpsewhich CDCShortcuts.sty` ./econtexShortcuts.sty

chmod a-w econtex.cls  # Prevent editing so that user will look to econtexMake to modify

echo 'bejournal.sty'
cd "$(dirname $(kpsewhich bejournal.sty))"
ln -fs `kpsewhich bejournal.sty` ./handout.sty

sudo texhash
echo 'If you are ready to replace the master versions, copy and paste the command below:'
echo ''
echo 'cd ; sudo chmod u+w `kpsewhich econtex.cls`'
echo 'cd ; sudo ditto /Volumes/Sync/Dropbox/Sys/Config/texlive/texmf-cdcpublicuse/tex/latex/econtex.cls `kpsewhich econtex.cls`'
echo 'cd ; sudo chmod u-w `kpsewhich econtex.cls`'
echo 'cd ; sudo chmod u+w `kpsewhich econtexShortcuts.sty`'
echo 'cd ; sudo ditto /Volumes/Sync/Dropbox/Sys/Config/texlive/texmf-cdcpublicuse/tex/latex/econtexShortcuts.sty `kpsewhich econtexShortcuts.sty`'
echo 'cd ; sudo chmod u-w `kpsewhich econtexShortcuts.sty`'
echo 'cd ; sudo chmod u+w `kpsewhich econtexSetup.sty`'
echo 'cd ; sudo ditto /Volumes/Sync/Dropbox/Sys/Config/texlive/texmf-cdcpublicuse/tex/latex/econtexSetup.sty `kpsewhich econtexSetup.sty`'
echo 'cd ; sudo chmod u-w `kpsewhich econtexSetup.sty`'

echo 'cd; sudo chmod u+w `kpsewhich handout.cls`'
echo 'cd ; sudo ditto /Volumes/Sync/Dropbox/Sys/Config/texlive/texmf-cdcpublicuse/tex/latex/handout.cls `kpsewhich handout.cls`'
echo 'cd; sudo chmod u-w `kpsewhich handout.cls`'

echo 'cd; sudo chmod u+w `kpsewhich handoutShortcuts.sty`'
echo 'cd; sudo chmod u+w `kpsewhich handoutSetup.sty`'
echo 'cd ; sudo ditto /Volumes/Sync/Dropbox/Sys/Config/texlive/texmf-cdcpublicuse/tex/latex/handoutShortcuts.sty `kpsewhich handoutShortcuts.sty`'
echo 'cd ; sudo ditto /Volumes/Sync/Dropbox/Sys/Config/texlive/texmf-cdcpublicuse/tex/latex/handoutSetup.sty     `kpsewhich handoutSetup.sty`'
echo 'cd; sudo chmod u-w `kpsewhich handoutShortcuts.sty`'
echo 'cd; sudo chmod u-w `kpsewhich handoutSetup.sty`'

