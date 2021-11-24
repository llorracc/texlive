### ====================================================================
###  @Awk-file{
###     author          = "Nelson H. F. Beebe",
###     version         = "1.02",
###     date            = "30 October 1992",
###     time            = "19:40:41 MST",
###     filename        = "bibextract.awk",
###     address         = "Center for Scientific Computing
###                        Department of Mathematics
###                        University of Utah
###                        Salt Lake City, UT 84112
###                        USA",
###     telephone       = "+1 801 581 5254",
###     FAX             = "+1 801 581 4148",
###     checksum        = "42574 172 674 6104",
###     email           = "beebe@math.utah.edu (Internet)",
###     codetable       = "ISO/ASCII",
###     keywords        = "BibTeX, bibliography",
###     supported       = "yes",
###     abstract        = "This file is a template for bibextract.sh
###                        to produce a temporary awk program for
###                        extracting bibliography entries selected
###                        by particular keywords.",
###     docstring       = "*********************************************
###                        This code is hereby placed in the PUBLIC
###                        DOMAIN and may be redistributed without any
###                        restrictions.
###                        *********************************************
###
###                        NB: This file is not used directly by awk,
###                        but rather is a template for bibextract.sh
###                        to produce a temporary file with an awk
###                        program to do the work.  This subterfuge is
###                        necessary because there is no convenient
###                        way to provide a pattern for an awk program
###                        at run time.  The strings replaced by
###                        bibextract.sh are upper-case versions of
###                        'keyword' and 'pattern'.
###
###                        Matching entries are found in each of the
###                        file arguments as BibTeX bib files and
###                        output to stdout.  @preamble{} and
###                        @string{} entries are automatically output
###                        as well.
###
###                        Usage:
###                             nawk -f bibtextract.awk bibfile(s) >newbibfile
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
### [08-May-1989]       1.00    original version

# @string and @preamble -- collect up to paired closing brace

/^@([Pp][Rr][Ee][Aa][Mm][Bb][Ll][Ee]|[sS][tT][rR][iI][nN][gG]){/        {
    printbraceditem();
    print "";
}

# "@keyword{tag," -- collect up to line starting with right brace
/^@[a-zA-Z0-9]*{/       {
    item = collectbraceditem();
    if ("KEYWORD" == "")        # line is changed by bibextract.sh
    {
        if (lowercase(item) ~ /PATTERN/) # line is changed by bibextract.sh
            print item;
    }
    else                        # match against text of selected field(s)
    {
        lcitem = lowercase(item);
        match(lcitem,/KEYWORD[ \t]*=[ \t]*"[^"]*"/);
        while (RLENGTH > 0)
        {                       # loop over all keyword-pattern matches
            field = substr(lcitem,RSTART,RLENGTH);
#           if (RLENGTH > 0)
#               printf ("%%DEBUG%% %s\n",field);
            if (field ~ /PATTERN/) # line is changed by bibextract.sh
            {
                print item;
                break;          # exit loop after printing
            }
            lcitem = substr(lcitem,RSTART+RLENGTH);
            match(lcitem,/KEYWORD[ \t]*=[ \t]*"[^"]*"/);
        }
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

# Starting with the current contents of $0, collect lines until we
# reach a zero brace count, and return the complete entry as a string
# value.

function collectbraceditem(count,item)
{
    count = bracecount($0);
    item = $0;
    while (count != 0)
    {
        if (getline <= 0)
            break;
        item = item "\n" $0;
        count += bracecount($0);
    }
    return (item);
}


# Return a lower-cased copy of the argument string.

function lowercase(s, t,k,letter)
{
    t = s;
    for (k = 1; k <= length(s); ++k)
    {
        letter = substr(t,k,1);
        if (("A" <= letter) && (letter <= "Z"))
        {
            letter = substr("abcdefghijklmnopqrstuvwxyz",
                index("ABCDEFGHIJKLMNOPQRSTUVWXYZ",letter),1);
            t = substr(t,1,k-1) letter substr(t,k+1);
        }
    }
#   printf ("%%DEBUG%% %s\n",t);
    return (t);
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
### ====================================================================
