#!/bin/sh
### ====================================================================
###  @UNIX-shell-file{
###     author          = "Nelson H. F. Beebe",
###     version         = "1.02",
###     date            = "30 October 1992",
###     time            = "19:43:51 MST",
###     filename        = "citefind.sh",
###     address         = "Center for Scientific Computing
###                        Department of Mathematics
###                        University of Utah
###                        Salt Lake City, UT 84112
###                        USA",
###     telephone       = "+1 801 581 5254",
###     FAX             = "+1 801 581 4148",
###     checksum        = "17317 76 327 3239",
###     email           = "beebe@math.utah.edu (Internet)",
###     codetable       = "ISO/ASCII",
###     keywords        = "BibTeX, bibliography",
###     supported       = "yes",
###     docstring       = "*********************************************
###                        This code is hereby placed in the PUBLIC
###                        DOMAIN and may be redistributed without any
###                        restrictions.
###                        *********************************************
###
###                        Read a list of cite tags from the file
###                        given by the first argument, then process
###                        each of the remaining file arguments as
###                        BibTeX bib files, looking up the
###                        bibentries, and output them to stdout.
###                        @preamble{} and @string{} entries are
###                        automatically output as well.
###
###                        Usage:
###                             citefind foo.tags bibfile(s) >newbibfile
###                        or
###                             citefind - bibfile(s) >newbibfile
###
###                        To be recognized, bib entries must look like
###
###                        @keyword{tag,
###                        ...
###                        }
###
###                        where the start @ appears in column 1, and
###                        the complete entry has balanced braces.
###
###                        The checksum field above contains a CRC-16
###                        checksum as the first value, followed by the
###                        equivalent of the standard UNIX wc (word
###                        count) utility output of lines, words, and
###                        characters.  This is produced by Robert
###                        Solovay's checksum utility.",
###  }
### ====================================================================

### Edit history (reverse chronological order):

### [21-Oct-1992]       1.01    Update for public distribution
### [21-Oct-1992]       1.00    Original version.

LIBDIR=@LIBDIR@

if [ "xx$1" = "xx-" ]         # make a temporary copy of stdin
then
        INPUTFILE=/tmp/citefind.$$
        trap '/bin/rm -f ${INPUTFILE}' 2 1
        cat >${INPUTFILE}
        shift
        nawk -f ${LIBDIR}/citefind.awk $*
        /bin/rm -f ${INPUTFILE}
else
        nawk -f ${LIBDIR}/citefind.awk $*
fi
### ====================================================================
