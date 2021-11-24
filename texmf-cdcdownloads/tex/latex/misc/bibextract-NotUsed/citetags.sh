#!/bin/sh
### ====================================================================
###  @UNIX-shell-file{
###     author          = "Nelson H. F. Beebe",
###     version         = "1.02",
###     date            = "30 October 1992",
###     time            = "19:41:46 MST",
###     filename        = "citetags.sh",
###     address         = "Center for Scientific Computing
###                        Department of Mathematics
###                        University of Utah
###                        Salt Lake City, UT 84112
###                        USA",
###     telephone       = "+1 801 581 5254",
###     FAX             = "+1 801 581 4148",
###     checksum        = "04454 60 290 2796",
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
###                        Read a LaTeX file, or an .aux file, and
###                        extract the citation tags, outputting them
###                        one per line on stdout, in sorted order.
###
###                        The companion program, citefind, can be
###                        used to extract the complete BibTeX entries
###                        for those tags from a bibliography file.
###                        This is useful when a small bibtex file
###                        must be prepared from large citation
###                        databases.
###
###                        Usage:
###                             citetags latex-file--or--aux-file >newbibfile
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
### [21-Apr-1990]       1.00    Original version

LIBDIR=@LIBDIR@

# The sort step is optional; citetags will not output duplicate tags,
# but they will be in random order.

nawk -f ${LIBDIR}/citetags.awk $* | sort
### ====================================================================
