%%% LaTeX class for manuscripts submitted to the
%%% Berkeley Electronic Journals (BEPress)
%%%
%%% author: Christopher Carroll
%%% version: 1.0 (14 March 2009)
%%% license: LaTeX Project Public License 
%%%
%%% Modified from style itaxpf by Arne Henningsen
%%% version: 1.0 (09 July 2007)
%%% license: LaTeX Project Public License 
%%%
%%% Note: This is an unofficial style file that may not fully comply
%%% with the Formatting Instructions of the BEPress Journals
%%% in every detail.
%%% Further information is available at
%%% http://www.uni-kiel.de/agrarpol/ahenningsen/latex-bibtex.html
%%%
%%% This document class is based on the "scrartcl" class
%%% from the KOMA script bundle.
%%% Following additional packages are required:
%%% amsmath, babel, csquotes, endfloat, endnotes, fontenc, geometry,
%%% ifthen, lmodern, natbib, setspace, url
%%%
%%% The corresponding BibTeX style file "itaxpf.bst" should be used
%%% for the bibliography: \bibliographystyle{itaxpf}
%%%
%%% This class provides 2 options:
%%% titlepage = include a title page (with command "\maketitle")
%%% noendfloat = do not move "floats" (tables and figures) to the end
%%%
%%% This document class provides 4 new commands:
%%% \keywords can be used to show keywors below the abstract
%%% \jelclass can be used to show JEL classifications below the abstract
%%% \affiliation can be used specify the affiliation(s) of the author(s)
%%%    (only shown if option "titlepage" is used)
%%% \address can be used spefify the address of the corresponding author
%%%    (only shown if option "titlepage" is used)
%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bejournal}[2009/03/14 LaTeX class for the Berkeley Electronic Journals]

\RequirePackage{ifthen}

% permit double spacing
\RequirePackage{setspace}
%\doublespacing

% option to place floats not at the end
\newcounter{UseEndfloat}
\setcounter{UseEndfloat}{1}
\DeclareOption{noendfloat}{\setcounter{UseEndfloat}{0}}

% option to include a title page
\newcounter{IncludeTitlePage}
\setcounter{IncludeTitlePage}{0}
\DeclareOption{titlepage}{\setcounter{IncludeTitlePage}{1}}

% pass any options on to the scrartcl class and load this class with some options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass[12pt,english,numbers=noenddot,captions=tableheading,
   captions=nooneline]{scrartcl}
% pointlessnumbers = do not add final dot after ordinary section numbers
% tablecaptionabove = use \captionabove for tables
% noonelinecaption = do not treat one-line captions differently

% use new TeX encoding scheme (T1), which contains accented (European) letters,
% to make European hyphenations work
\RequirePackage[T1]{fontenc}

% use babel package and set language to english
\RequirePackage[english]{babel}

% page format, margins
\RequirePackage{geometry}
\geometry{letterpaper, tmargin=1.0in, bmargin=1.0in, lmargin=1.0in,
  rmargin=1.0in, headheight=0in, headsep=0in, footskip=0.5in }

% spacing around formulas
\AtBeginDocument{
\setlength{\abovedisplayshortskip}{6pt}
\setlength{\belowdisplayshortskip}{6pt}
\setlength{\abovedisplayskip}{6pt}
\setlength{\belowdisplayskip}{6pt}
\allowdisplaybreaks
}

% spacing around captions and floats
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{3pt}
\setlength{\floatsep}{0pt}
\setlength{\textfloatsep}{20pt}
\setlength{\intextsep}{15pt}

% amsmath
\RequirePackage{amsmath}

% font for URLs
\RequirePackage{url}
\def\UrlFont{\ttfamily}

%% formatting section headers
\setkomafont{section}{\normalfont \Large \bfseries}
\setkomafont{subsection}{\normalfont \large}
\setkomafont{subsubsection}{\normalfont \itshape}

% citations and bibliography
\RequirePackage[authoryear]{natbib}
\AtBeginDocument{\renewcommand{\refname}{\clearpage References}}


% captions of figures and tables
\setcapwidth[c]{\textwidth}
% \setcapindent*{0pt}
\setkomafont{captionlabel}{\centering \bfseries}
\setkomafont{caption}{\centering}
\renewcommand{\captionformat}{~ }

% move floats to the end of the paper
\ifthenelse{\equal{\theUseEndfloat}{1}}{
   \RequirePackage[heads,nolists,tablesfirst]{endfloat}
   \renewcommand{\figureplace}{%
      \begin{center}
      [\figurename~\thepostfig\ here]
      \end{center}
   }
   \renewcommand{\tableplace}{%
      \begin{center}
      [\tablename~\theposttbl\ here]
      \end{center}
   }
}{}

% titlepage with title, author, affiliation and date
\newcommand{\affiliation}[1]{\newcommand{\@affiliation}{#1}}
\newcommand{\address}[1]{\newcommand{\@address}{#1}}
\renewcommand{\and}{$\cdot$ }
\renewcommand{\maketitle}{
   \ifthenelse{\equal{\theIncludeTitlePage}{1}}{
      \thispagestyle{empty}
      \vspace*{25mm}
   }{}
   \begin{center}
   \begin{Large}
   \begin{spacing}{1.25}
   \textbf{\@title}
   \end{spacing}
   \end{Large}
   \vspace*{5mm}
   \ifthenelse{\equal{\theIncludeTitlePage}{1}}{
      \vspace*{7mm}
      \@author\\
      \ifthenelse{ \isundefined\@affiliation }{}{
         \vspace*{5mm}
         \textit{\@affiliation}\\
      }
      \ifthenelse{ \isundefined\@address }{}{
         \vspace*{10mm}
         \begin{spacing}{1}
         \@address\\
         \end{spacing}
      }
      \vspace*{3mm}
   }{}
   \end{center}
}


% abstract, keywords, JEL classification
\newcommand{\keywords}[1]{\newcommand{\@keywords}{#1}}
\newcommand{\jelclass}[1]{\newcommand{\@jelclass}{#1}}
\renewenvironment{abstract}{%
\noindent
\textbf{Abstract~}
}{%
\ifthenelse{ \isundefined\@keywords }{
\ClassWarningNoLine{bejournal}{No keywords specified.
   Please use the command \protect\keywords}
}{

\medskip \noindent
\textbf{Key words~} \@keywords
}
\ifthenelse{ \isundefined\@jelclass }{
\ClassWarningNoLine{bejournal}{No JEL classification specified.
   Please use the command \protect\jelclass}
}{

\medskip \noindent
\textbf{JEL classification~} \@jelclass
}
\clearpage
}

% avoid clubs and widows
\clubpenalty=10000
\widowpenalty=10000
% \displaywidowpenalty=10000

% increase stretchability of the spaces (avoid overful hboxes)
\setlength{\emergencystretch}{3em}
