#!/bin/sh
### ====================================================================
###  @UNIX-shell-file{
###     author          = "Nelson H. F. Beebe",
###     version         = "1.02",
###     date            = "30 October 1992",
###     time            = "19:45:16 MST",
###     filename        = "bibextract.sh",
###     address         = "Center for Scientific Computing
###                        Department of Mathematics
###                        University of Utah
###                        Salt Lake City, UT 84112
###                        USA",
###     telephone       = "+1 801 581 5254",
###     FAX             = "+1 801 581 4148",
###     checksum        = "26412 93 400 3829",
###     email           = "beebe@math.utah.edu (Internet)",
###     codetable       = "ISO/ASCII",
###     keywords        = "",
###     supported       = "yes",
###     abstract        = "",
###     docstring       = "Extract a subset of one or more bibtex
###                        files according to a regular expression
###                        pattern given on the command line, writing
###                        them on stdout.
###
###                        The pattern should avoid upper-case
###                        letters; the matching will be against a
###                        lower-cased copy of the BibTeX entry, to
###                        make letter case insignificant.
###
###                        Usage:
###                             bibextract 'keyword-pat' 'regexp-pat' \
###                                bibtex-file(s) >new-bibtex-file
###
###                        If the keyword-pat pattern is empty,
###                        matching occurs against the entire
###                        bibliographic entry.
###
###                        Here are some examples:
###
###                        Extract all entries mentioning chaos in any field:
###
###                             bibextract "" "chaos" file(s) >new-bibtex-file
###
###                        Extract entries with names Brown or Smith
###                        occurring in either of the author or editor
###                        fields:
###
###                             bibextract "author|editor" "brown|smith" \
###                                 file(s) >new-bibtex-file
###
###                        Extract entries for titles containing the
###                        letter z anywhere after a vowel; note that
###                        single quotes are necessary to provide the
###                        necessary protection from shell expansion:
###
###                             bibextract "title" '[aeiou].*z' file(s) \
###                                 >new-bibtex-file
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
### [30-Oct-1992]	1.02	Fix typographical error.
### [21-Oct-1992]       1.01    Update for public distribution.
### [08-May-1989]       1.00    Original version.

TMPFILE=/tmp/bibtextract.$$
LIBDIR=@LIBDIR@

trap '/bin/rm -f ${TMPFILE}' 2 1

# Make a new awk program with the patterns built in.
/bin/sed    -e "sKEYWORD$1"\
            -e "sPATTERN$2"\
            <@LIBDIR@/bibextract.awk >${TMPFILE}

# Discard first 2 arguments (keyword-pat and regexp-pat)
shift
shift

# Extract the bibliography subset
nawk -f ${TMPFILE} $*

# discard our temporary file
/bin/rm -f ${TMPFILE}
