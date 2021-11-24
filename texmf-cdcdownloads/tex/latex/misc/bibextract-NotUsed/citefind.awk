### ====================================================================
###  @Awk-file{
###     author          = "Nelson H. F. Beebe",
###     version         = "1.02",
###     date            = "30 October 1992",
###     time            = "19:41:07 MST",
###     filename        = "citefind.awk",
###     address         = "Center for Scientific Computing
###                        Department of Mathematics
###                        University of Utah
###                        Salt Lake City, UT 84112
###                        USA",
###     telephone       = "+1 801 581 5254",
###     FAX             = "+1 801 581 4148",
###     checksum        = "40982 120 464 4322",
###     email           = "beebe@math.utah.edu (Internet)",
###     codetable       = "ISO/ASCII",
###     keywords        = "BibTeX, bibliography",
###     supported       = "yes",
###     abstract        = "This program extracts bibliography entries
###                        from one or more bibliography files for
###                        specified citation tags ",
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
###                             nawk -f citefind.awk foo.tags bibfile(s) \
###                                 >newbibfile
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
###                        This program should normally be run via
###                        the separate citefind shell script.
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
### [12-Apr-1989]       1.00    Original version

BEGIN {
    while (FILENAME == ARGV[1]) # process stdin only to get tags
    {
        if (getline <= 0)
            break;
        tagnames[$0] = $0;
    }
}

# @string and @preamble -- collect up to paired closing brace

/^@([Pp][Rr][Ee][Aa][Mm][Bb][Ll][Ee]|[sS][tT][rR][iI][nN][gG]){/        {
    printbraceditem();
    print "";
}

# "@keyword{tag," -- collect up to line starting with right brace
/^@[a-zA-Z0-9]*{/       {
        tag = substr($0,index($0,"{")+1);
        tag = substr(tag,1,index(tag,",")-1);
        if (tagnames[tag] != "")
        {
            printbraceditem();
            print "";
        }
    }

function bracecount(s, k,n)
{
    n = 0;
    for (k = 1; k <= length(s); ++k)
    {
        if (substr(s,k,1) == "{")
            n++;
        else if (substr(s,k,1) == "}")
            n--;
    }
    return (n);
}

# Starting with the current contents of $0, print lines until we
# reach a zero brace count.
function printbraceditem(count)
{
    count = bracecount($0);
    print $0;
    while (count != 0)
    {
        if (getline <= 0)
            break;
        print $0;
        count += bracecount($0);
    }
}
########################################################################
