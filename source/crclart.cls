\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{crclart}[2024/01/02 LaTeX class for articles of the CRCL journal]

% Base class
\LoadClass[10pt,a4paper]{article}


% Options
\DeclareOption{law}{\PassOptionsToPackage{style=oscola}{biblatex}}
\DeclareOption{csauthoryear}{\PassOptionsToPackage{style=acmauthoryear}{biblatex}}
\DeclareOption{csnumeric}{\PassOptionsToPackage{style=acmnumeric}{biblatex}}
\ProcessOptions*


% Preamble
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc} % Use 8-bit encoding that has 256 glyphs
\RequirePackage{fourier}
\RequirePackage[backend=biber,doi=false,isbn=false,url=false]{biblatex}
\RequirePackage[style=british]{csquotes}
\appto\biburlsetup{\Urlmuskip=0mu\relax} % Fix URLs being stretch e d
\RequirePackage{url}
\RequirePackage{multicol}
\linespread{1.2} % Line spacing - Palatino needs more space between lines [1.05]
\RequirePackage[protrusion=compatibility]{microtype}
\RequirePackage[english]{babel}
\RequirePackage{abstract} % Allows abstract customization
\setlength{\absleftindent}{0mm}
\setlength{\absrightindent}{0mm}
\renewcommand{\abstractnamefont}{\vspace{-8mm}\normalfont\large\bfseries} % Set the "Abstract" text to bold
\renewcommand{\abstracttextfont}{\vspace{2mm}\normalfont\normalsize} % Set the abstract itself to small italic text
\RequirePackage{tikz}
\RequirePackage{wrapfig}
\RequirePackage[hmarginratio=1:1,top=32mm,bottom=32mm,left=30mm]{geometry}
\RequirePackage[hang,small,labelfont=bf,up,textfont=it,up]{caption}
\RequirePackage{booktabs} % Horizontal rules in tables
\RequirePackage[vskip=1em,font={small}]{quoting} % For quotations
\RequirePackage{enumitem} % Customized lists
\setlist[itemize]{noitemsep} % Make itemize lists more compact
\RequirePackage[all]{nowidow}
\RequirePackage[hidelinks]{hyperref}


% Headings
\RequirePackage[compact]{titlesec}
\titleformat{\section}{\linespread{1}\ifnum\thesection>1{\titlerule[.05cm]\vspace{1em}}\fi\raggedright\fontfamily{put}\selectfont\Large\bfseries}{}{0cm}{}
\titlespacing{\section}{0cm}{1.2cm}{1.6em}
\titleformat{\subsection}{\linespread{1}\raggedright\fontfamily{put}\selectfont\large}{}{0cm}{}
\titlespacing{\subsection}{0pt}{1.75em}{1.5em}
\titleformat{\subsubsection}{\linespread{1}\raggedright\fontfamily{put}\selectfont\itshape}{}{0cm}{}
\titlespacing{\subsubsection}{0pt}{2em}{.5em}

\RequirePackage{titling} % Customizing the title section

\RequirePackage[parfill]{parskip}
\parskip=10pt
\RequirePackage{etoolbox} % Quote styles
\AtBeginEnvironment{quote}{\small}
\settowidth{\thanksmarkwidth}{*}
\setlength{\thanksmargin}{0em}


% Headers and footers
\newgeometry{hmarginratio=1:1,top=32mm,bottom=32mm,columnsep=20pt,left=18mm}
\RequirePackage{fancyhdr}
\pagestyle{fancy} % All pages have headers and footers
\fancyhead{} % Blank out the default header
\renewcommand{\footrulewidth}{0.4pt}
\fancyfoot[C]{} % Custom footer text
\fancyfoot[R]{\thepage} % Custom footer text
\setlength{\skip\footins}{.75cm} % Footnote spacing
\RequirePackage{xcolor}
\definecolor{header-grey}{HTML}{777777} % Banner background colour
\definecolor{light-grey}{HTML}{bbbbbb} % Lighter grey
\RequirePackage{graphicx}
\RequirePackage[absolute,overlay]{textpos}
% Geometry of first page
\newgeometry{hmarginratio=1:1,top=32mm,bottom=32mm,left=30mm}

\RequirePackage[hang,norule,stable]{footmisc}
\RequirePackage[numberlinked=true]{footnotebackref}
\setlength{\footnotemargin}{.5cm}


% Body text footnotes
\addtolength{\footnotesep}{.5mm}
{\makeatletter}	% Author affiliation footnotes
\def\@fnsymbol#1{\ensuremath{\ifcase#1\or *\or **\or
      ***\or \dagger\or \ddagger\or \dagger\dagger
    \or \ddagger\ddagger \else\@ctrerr\fi}}
{\makeatother}

\fancyhead[L]{\@crclVolume}
\fancyhead[R]{\the\year{}}
\setcounter{page}{1}

\interfootnotelinepenalty=10000

% New title
\renewcommand{\maketitle}{%
  \def \@makefnmark
  {\@textsuperscript{\normalfont\tamark }}
  \def\tamark{\@fnsymbol{\@thefnmark}}
  \long\def\thanksfootmark{
    { \normalfont \thanksscript {\thanksfootpre \tamark \thanksfootpost}}
  }
  \long \def \@makefntext ##1{\makethanksmark ##1}
  \thispagestyle{empty}
  \begin{textblock*}{\paperwidth}(0mm,0mm)
    \textblockcolour{header-grey}
    \vspace{6mm}
    \href{https://journalcrcl.org}{\hspace{34mm}\includegraphics[width=.5\linewidth]{crcl-logo}}
    \vspace{10mm}
  \end{textblock*}
  \null \vskip 2em\vspace *{\droptitle }
  \maketitlehooka {\@bspretitle \linespread{.75}\centering\huge\bfseries\fontfamily{put}\selectfont{\@title}
    \@bsposttitle } \maketitlehookb \vskip 2em
    {\@bspreauthor \@author \@bspostauthor }
  \maketitlehookc {\@bspredate
    \@bspostdate } \par \vskip 1.5em
  \begin{abstract}
    \@abstractText
    \par
    \par
    \bfseries{Keywords:}\normalfont\ \@keywords
    \par
    \par
    \large{\bfseries{Replier:}\ \normalfont{\@replier\ \textbullet{} \@replierBio.}}
    \maketitlehookd
    \vspace{2em}%\newline
    \begin{center}
      \normalfont \emph{Journal of Cross-disciplinary Research in Computational Law}\\
      {\textcopyright} \the\year{} {\@authorNames}\\
      DOI: \href{}{\@doiNumber{}}\\
      Licensed under a \href{https://creativecommons.org/licenses/by-nc/4.0/}{Creative Commons BY-NC 4.0 license}\\
      \href{https://journalcrcl.org}{www.journalcrcl.org}
    \end{center}
  \end{abstract}
  \@thanks
  \def\tamark{\@thefnmark{}}
  \@bscontmark
  \newgeometry{hmarginratio=1:1,top=32mm,bottom=32mm,columnsep=20pt,left=18mm}
  \clearpage
  \begin{refsection}
    \begin{multicols}{2}}

      \AtEndDocument{
    \end{multicols}
  \end{refsection}
}


% Metadata
\date{} % Ignore this line!
\makeatletter
\def\replier#1{\gdef\@replier{#1}}
\def\@replierBio{\@latex@warning@no@line{No \noexpand\replierBio given}}

\def\replierBio#1{\gdef\@replierBio{#1}}
\def\@replierBio{\@latex@warning@no@line{No \noexpand\replierBio given}}

\def\authorNames#1{\gdef\@authorNames{#1}}
\def\@authorNames{\@latex@warning@no@line{No \noexpand\authorNames given}}

\def\doiNumber#1{\gdef\@doiNumber{#1}}
\def\@doiNumber{\@latex@warning@no@line{No \noexpand\doiNumber given}}

\def\crclVolume#1{\gdef\@crclVolume{#1}}
\def\@crclVolume{\@latex@warning@no@line{No \noexpand\crclVolume given}}

\def\abstractText#1{\gdef\@abstractText{#1}}
\def\@abstractText{\@latex@warning@no@line{No \noexpand\abstractText given}}

\def\keywords#1{\gdef\@keywords{#1}}
\def\@keywords{\@latex@warning@no@line{No \noexpand\keywords given}}

\AtBeginDocument{
  \hypersetup{
    pdftitle={\@title},
    pdfauthor={\@authorNames},
  }
}
\makeatother

% Reply and response command :

\makeatletter
\newcommand{\reply}[1]{%
  \end{multicols}
  \end{refsection}
  \clearpage
  \pdfbookmark[0]{Reply}{sec:reply}
  \bgroup\setlength{\parindent}{0pt}
  \begin{flushleft}
    \linespread{1}\selectfont\huge\textbf{\textcolor{header-grey}{A reply:} #1}\\
    \vspace{.25cm}
    \renewcommand{\baselinestretch}{.6}{\large \textbf{\@replier} \textbullet{} \@replierBio}
  \end{flushleft}
  \egroup
  \textcolor{light-grey}{\hrule height .2cm} % Grey bar below title
  \vspace{.5cm}
  \begin{refsection}
    \begin{multicols}{2}
      }

      \newcommand{\response}[1]{
    \end{multicols}
  \end{refsection}
  \clearpage
  \pdfbookmark[0]{Response}{sec:response}
  \bgroup\setlength{\parindent}{0pt}
  \begin{flushleft}
    \linespread{1}\selectfont\huge\textbf{\textcolor{header-grey}{Author's reponse} #1}\\
    \vspace{.25cm}
    \renewcommand{\baselinestretch}{.6}{\large \textbf{\@authorNames}}
  \end{flushleft}
  \egroup
  \textcolor{light-grey}{\hrule height .2cm} % Grey bar below title
  \vspace{.5cm}
  \begin{refsection}
  \begin{multicols}{2}
}
\makeatother
