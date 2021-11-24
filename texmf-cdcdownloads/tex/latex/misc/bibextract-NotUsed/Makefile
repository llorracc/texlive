#=======================================================================
# Makefile for files in ~beebe/tex/bibextract.
#
# Current target list:
#	all			make txt and spell targets
#	bibextract.tar		tar archive file for ftp distribution
#	bibextract.zip		Info-zip archive file for ftp distribution
#	bibextract.zoo		zoo archive file for ftp distribution
#	clean			clean up temporary files
#	clobber			remove all files that can be remade by make
#	install			install programs in system directories
#	install.time		internal target
#	install-ftp		install programs in anonymous ftp directories
#	install-ftp.time	internal target
#	spell			make *.spl files from *.man files
#	test-version
#	txt			make *.txt files from *.man files
#	uninstall		remove programs from system directories
#	uninstall-ftp		remove programs from anonymous ftp directories
#	verify-checksums	verify checksums in all files that have them
#
# [02-Nov-1992]
#=======================================================================

# Change these to match local conventions:

BINDIR		= /usr/local/bin
FTPDIR		= /usr/spool/ftp/pub/tex/bib
LIBDIR		= /usr/local/lib/bibextract
MANDIR		= /usr/local/man/man1
MANEXT		= 1

#=======================================================================

AWK		= awk

AWKFILES	= bibextract.awk citefind.awk citetags.awk

BASENAMES	= $(AWKFILES:.awk=)

BINFILES	= $(AWKFILES:.awk=.sh)

# If you don't have checksum installed, use cat instead.
CHECKSUM	= cat

CHMOD		= chmod

COMPRESS	= compress

CP		= /bin/cp

DEROFF		= deroff

DIST-FILES	= README Makefile $(BINFILES) $(AWKFILES) \
		  $(MANFILES) $(PSFILES) $(TXTFILES) $(AWKFILES:.awk=.sok)

DITROFF		= ditroff	## AT&T
DITROFF		= groff		## GNU

HDRFILES	= $(BINFILES) $(AWKFILES) $(MANFILES)

LN		= /bin/ln

MANFILES	= $(AWKFILES:.awk=.man)

NROFF		= nroff

PSFILES		= $(MANFILES:.man=.ps)

RM		= /bin/rm -f

SED		= /usr/bin/sed

SEDCMD		= $(SED) -e 's=@LIBDIR@=$(LIBDIR)=g' \
			 -e 's=@BINDIR@=$(BINDIR)=g'

SHELL		= /bin/sh

SPLFILES	= $(AWKFILES:.awk=.spl)

TAR		= tar

TXTFILES	= $(AWKFILES:.awk=.txt)

UNZIP		= unzip

VERSION		= `$(AWK) '/^\#\#\#[ \t]*version *= *"[0-9.]+", *$$/ \
		{ gsub(/[^0-9.]/,"",$$4); print $$4 }' citefind.sh`

ZIP		= zip

ZOO		= zoo

#=======================================================================

.SUFFIXES:	.txt .spl .ps .man

.man.ps:
	$(SEDCMD) $< | $(DITROFF) -Tps -man - >$@

.man.spl:
	$(DEROFF) $< | spell +$*.sok >$*.spl
	@if [ -s $*.spl ] ; \
	then \
		echo "Spelling exceptions in $*.spl" ; \
		cat $*.spl ; \
	fi

.man.txt:
	$(SEDCMD) $< | $(NROFF) -man - | col -b | expand >$@

#=======================================================================

all:	spell txt ps

bibextract.tar:	$(DIST-FILES)
	-$(RM) bibextract.tar bibextract.tar-lst
	$(TAR) chf bibextract.tar $(DIST-FILES)
	-mkdir bibextract-$(VERSION)
	cd bibextract-$(VERSION); tar xf ../bibextract.tar
	$(TAR) cf bibextract-$(VERSION).tar bibextract-$(VERSION)
	-$(RM) -r bibextract-$(VERSION)
	-$(RM) bibextract.tar
	$(LN) bibextract-$(VERSION).tar bibextract.tar

bibextract.zip:	$(DIST-FILES)
	-$(RM) bibextract*.zip
	-$(RM) bibextract*.zip-lst
	$(ZIP) bibextract-$(VERSION).zip $(DIST-FILES)
	$(UNZIP) -v bibextract-$(VERSION).zip >bibextract-$(VERSION).zip-lst
	$(LN) bibextract-$(VERSION).zip bibextract.zip

bibextract.zoo:	$(DIST-FILES)
	-$(RM) bibextract*.zoo
	-$(RM) bibextract*.zoo-lst
	$(ZOO) a bibextract-$(VERSION).zoo $(DIST-FILES)
	$(ZOO) v bibextract-$(VERSION).zoo >bibextract-$(VERSION).zoo-lst
	$(LN) bibextract-$(VERSION).zoo bibextract.zoo
clean:
	-$(RM) *.ps
	-$(RM) *.spl
	-$(RM) *.tar
	-$(RM) *.tar-lst
	-$(RM) *.txt
	-$(RM) *.zip
	-$(RM) *.zip-lst
	-$(RM) *.zoo
	-$(RM) *.zoo-lst
	-$(RM) *~
	-$(RM) \#*
	-$(RM) a.out core

clobber:	clean
	-$(RM) install.time install-ftp.time

install:	install.time

install.time:	$(AWKFILES) $(BINFILES) $(MANFILES)
	-if [ ! -d $(LIBDIR) ] ; then mkdir $(LIBDIR) ; fi
	for f in $(BASENAMES) ; \
	do \
		$(SEDCMD) $$f.sh | $(CHECKSUM) > $(BINDIR)/$$f ; \
		$(SEDCMD) $$f.awk | $(CHECKSUM) > $(LIBDIR)/$$f.awk ; \
		$(SEDCMD) $$f.man | $(CHECKSUM) > $(MANDIR)/$$f.$(MANEXT) ; \
		$(CHMOD) 775 $(BINDIR)/$$f ; \
		$(CHMOD) 664 $(LIBDIR)/$$f.awk ; \
		$(CHMOD) 664 $(MANDIR)/$$f.$(MANEXT) ; \
	done
	date >install.time

install-ftp:	install-ftp.time

install-ftp.time:	bibextract.tar bibextract.zip bibextract.zoo
	$(TAR) tvf bibextract-$(VERSION).tar >$(FTPDIR)/bibextract-$(VERSION).tar-lst
	$(COMPRESS) <bibextract-$(VERSION).tar \
		>$(FTPDIR)/bibextract-$(VERSION).tar.z
	$(CP) bibextract-$(VERSION).zip $(FTPDIR)
	$(CP) bibextract-$(VERSION).zip-lst $(FTPDIR)
	$(CP) bibextract-$(VERSION).zoo $(FTPDIR)
	$(CP) bibextract-$(VERSION).zoo-lst $(FTPDIR)
	ls -l $(FTPDIR)/bibextract*
	date >install-ftp.time

ps:	$(PSFILES)

spell:	$(SPLFILES)

test-version:
	@echo "Version number is ""'"$(VERSION)"'"

txt:	$(TXTFILES)

uninstall:
	-for f in $(BINFILES) ; \
	do \
		$(RM) $(BINDIR)/$$f $(LIBDIR)/$$f $(MANDIR)/$$f.$(MANEXT) ; \
	done
	-$(RM) install.time

uninstall-ftp:
	-$(RM) $(FTPDIR)/bibextract-$(VERSION).tar.z
	-$(RM) $(FTPDIR)/bibextract-$(VERSION).tar-lst
	-$(RM) $(FTPDIR)/bibextract-$(VERSION).zip
	-$(RM) $(FTPDIR)/bibextract-$(VERSION).zip-lst
	-$(RM) $(FTPDIR)/bibextract-$(VERSION).zoo
	-$(RM) $(FTPDIR)/bibextract-$(VERSION).zoo-lst
	-$(RM) install-ftp.time

verify-checksums:
	for f in $(HDRFILES) ; \
	do \
		echo $$f ; \
		$(CHECKSUM) -v $$f ; \
	done

#=======================================================================
