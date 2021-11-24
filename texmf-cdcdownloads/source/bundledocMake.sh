#/bin/sh

source /etc/profile

cd /Users/Shared/Library/texmf-cdcdownloads/source/bundledoc
sudo ditto bundledoc /usr/local/bin
sudo ditto arlatex   /usr/local/bin
sudo ditto bundledoc.1 /usr/local/man/man1
sudo ditto arlatex.1   /usr/local/man/man1
mkdir /Users/Shared/Library/texmf-cdcdownloads/tex/latex/bundledoc
sudo ditto tetex.cfg /Users/Shared/Library/texmf-cdcdownloads/tex/latex/bundledoc
sudo ditto bundledoc.pdf /Users/Shared/Library/texmf-cdcdownloads/doc
sudo ditto arlatex.pdf   /Users/Shared/Library/texmf-cdcdownloads/doc
sudo texhash
