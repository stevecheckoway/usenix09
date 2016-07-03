%%
%% This is file `usenix09.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% usenix09.dtx 
%% Copyright (C) 2009-2011 by Stephen Checkoway <s@cs.ucsd.edu>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in:
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status 'maintained'.
%% 
%% The Current Maintainer of this work is Stephen Checkoway.
%% 
%% This work consists of usenix09.dtx and the derived file
%% usenix09.cls.
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{usenix09}
    [2011/01/29 v1.3 USENIX09 formatting]
\newif\ifusenix@onecolumn \usenix@onecolumnfalse
\newif\ifusenix@nofonts \usenix@nofontsfalse
\newif\ifusenix@nofontenc \usenix@nofontencfalse
\newif\ifusenix@tight \usenix@tightfalse
\newif\ifusenix@titlecompat \usenix@titlecompatfalse
\newif\ifusenix@pagenumbers \usenix@pagenumbersfalse
\newif\ifusenix@noflushend \usenix@noflushendfalse
\DeclareOption{onecolumn}{\usenix@onecolumntrue}
\DeclareOption{tight}{\usenix@tighttrue\PassOptionsToPackage{compact}{titlesec}}
\DeclareOption{titlecompat}{\usenix@titlecompattrue}
\DeclareOption{footasend}{
    \AtBeginDocument{\let\footnote\endnote}
    \AtEndDocument{\theendnotes}}
\DeclareOption{nofonts}{\usenix@nofontstrue\ExecuteOptions{nofontenc}}
\DeclareOption{nofontenc}{\usenix@nofontenctrue}
\DeclareOption{pagenumbers}{\usenix@pagenumberstrue}
\DeclareOption{noflushend}{\usenix@noflushendtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt,letterpaper]{article}
\RequirePackage{fixltx2e}
\ifusenix@noflushend\else
    \RequirePackage{flushend}
\fi
\ifusenix@nofonts\else
    \RequirePackage{mathptmx}
    \RequirePackage[scaled=.92]{helvet}
    \RequirePackage{courier}
\fi
\ifusenix@nofontenc\else
    \RequirePackage[T1]{fontenc}
\fi
\RequirePackage[letterpaper,margin=1in,nohead,columnsep=.25in]{geometry}
\RequirePackage{titlesec}
\RequirePackage[margin=10pt,font=small,labelfont=bf]{caption}
\RequirePackage{endnotes}
\let\enotesize\normalsize
\def\enoteformat{%
    \rightskip\z@
    \leftskip\z@
    \leavevmode\llap{\makeenmark}%
}
\ifusenix@pagenumbers\else
\geometry{nofoot}
\fi
\begingroup
\def\usenix@twocolumn{
    \ifusenix@onecolumn
        \ClassError{usenix09}{Cannot specify both twocolumn
        and onecolumn.}{At most one of twocolumn and onecolumn
        may be specified.}
    \fi}
\def\usenix@onecolumn{
    \ifusenix@onecolumn\else
        \ClassError{usenix09}{USENIX 2009 requires 2
        columns.\MessageBreak
        Pass option onecolumn to override.}{Single column
        requires the use of option onecolumn.}
    \fi}
\if@twocolumn
    \usenix@twocolumn
    \setlength\columnsep{0.25in}
\else
    \usenix@onecolumn
\fi
\endgroup
\ifusenix@pagenumbers
    \pagestyle{plain}
\else
    \pagestyle{empty}
\fi
\renewcommand\maketitle{\par
    \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent1em\noindent
        \hb@xt@1.8em{%
            \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
        \twocolumn[\@maketitle]%
    \else
        \newpage
        \global\@topnum\z@
        \@maketitle
    \fi
    \ifusenix@pagenumbers
        \thispagestyle{plain}%
    \else
        \thispagestyle{empty}%
    \fi
    \@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \begingroup
    \def\r##1{\global\let##1\@undefined}%
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \r\thanks
    \r\maketitle
    \r\@maketitle
    \r\title
    \r\author
    \r\date
    \r\and
    \r\addauthor
    \r\usenix@authorname
    \r\usenix@institutionname
    \r\usenix@extract
    \r\usenix@temp
    \r\usenix@layoutauthorcolumn
    \r\usenix@l@youtauthorcolumn
    \r\usenix@layoutauthors
    \r\authornewline
    \r\institutionnewline
    \global\usenix@currauthor\z@
    \loop\ifnum\count@<\usenix@numauthors
        \expandafter
        \r\csname usenix@author\the\usenix@currauthor\endcsname
        \global\advance\usenix@currauthor\@ne
    \repeat
    \endgroup
}
\renewcommand\@maketitle{%
    \newpage
    \ifusenix@titlecompat
        \vbox to2.5in{
            \vskip2em plus1fill
            \begin{center}%
                \let\footnote\thanks
                {\Large\bfseries\@title\par}%
                \vskip.375in minus.3in
                {\large\lineskip.5em \usenix@layoutauthors}%
            \end{center}%
            \par
            \vfill
        }%
    \else % usenix@titlecompat
        \null
        \ifusenix@tight\else
            \vskip2em
        \fi
        \begin{center}%
            \let\footnote\thanks
            {\Large\bfseries\@title\par}%
            \ifusenix@tight
                \vskip.75em
            \else
                \vskip1.5em
            \fi
            {\large\lineskip.5em \usenix@layoutauthors}%
            \ifusenix@tight
                \vskip.5em
            \else
                \vskip1em
            \fi
        \end{center}%
        \par
        \ifusenix@tight
            \vskip.75em
        \else
            \vskip1.5em
        \fi
    \fi % usenix@titlecompat
}
\renewcommand\and{\ClassError{usenix09}{\string\and\ is not supported.
Use \string\addauthor.}{\string\and\ does not work with usenix09.}}
\newcommand\addauthor[3][]{%
    \expandafter\def\csname usenix@author\the\usenix@numauthors\endcsname{%
        {#1}{#2}{#3}}
    \global\advance\usenix@numauthors\@ne
}
\global\let\author\addauthor
\newskip\authorsep \authorsep1em\@plus.17fil
\newskip\authorskip \authorskip.5em
\newcount\authorcolumns \authorcolumns\z@
\newcount\usenix@numauthors
\newcount\usenix@currauthor
\global\usenix@numauthors\z@
\providecommand\@firstofthree[3]{#1}
\providecommand\@secondofthree[3]{#2}
\providecommand\@thirdofthree[3]{#3}
\newcommand\usenix@extract[1]{\expandafter\expandafter\expandafter
    #1\csname usenix@author\the\usenix@currauthor\endcsname}
\newcommand\usenix@authorname{%
    \protected@edef\usenix@temp{\usenix@extract\@firstofthree}%
    \begingroup
    \upshape
    \usenix@extract\@secondofthree
    \endgroup
    \ifx\usenix@temp\@empty\else
        \footnotemark[\usenix@temp]%
    \fi
}
\newcommand\usenix@institutionname{\usenix@extract\@thirdofthree}
\newcommand\usenix@layoutauthors{%
    \global\usenix@currauthor\z@
    \loop\ifnum\usenix@currauthor<\usenix@numauthors
        \protected@edef\usenix@temp{\usenix@extract\@firstofthree}%
        \ifx\usenix@temp\@empty\else
            \stepcounter{footnote}%
            \protected@xdef\@thefnmark{\thefootnote}%
            \protected@xdef\@thanks{\@thanks
                \protect\footnotetext[\the\c@footnote]{\usenix@temp}}%
            \def\usenix@temp{\the\c@footnote}%
        \fi
        \toks@\expandafter\expandafter\expandafter\expandafter\expandafter
            \expandafter\expandafter{\expandafter\expandafter\expandafter
            \@gobble\csname usenix@author\the\usenix@currauthor\endcsname}
        \expandafter\edef
            \csname usenix@author\the\usenix@currauthor\endcsname{%
                {\usenix@temp}\the\toks@}
        \global\advance\usenix@currauthor\@ne
    \repeat
    \ifnum\usenix@numauthors=\z@
        \ClassError{usenix09}{At least one author is required.}{Use
        \string\addauthor\ to add an author.}
    \fi
    \ifnum\authorcolumns>\z@
        \ifnum\authorcolumns>\usenix@numauthors
            \authorcolumns\usenix@numauthors
        \fi
    \else
        \authorcolumns
        \ifcase\usenix@numauthors
        \or \@ne %1
        \or \tw@ %2
        \or \thr@@ %3
        \or 4 %4
        \or \thr@@ %5
        \or \thr@@ %6
        \or 4 %7
        \or 4 %8
        \or \thr@@ %9
        \else 4 % How many authors do you have??
        \fi
    \fi
    \begingroup
    \itshape
    \count@\usenix@numauthors
    \divide\count@\authorcolumns
    \multiply\count@\authorcolumns
    \count\z@\authorcolumns
    \advance\count\z@-\usenix@numauthors
    \advance\count\z@\count@
    \ifodd\count\z@
        \count\z@\authorcolumns
    \else
        \divide\count\z@\tw@
    \fi
    \count\tw@\count@
    \count4\z@
    \hb@xt@\textwidth{\hfil
    \loop\ifnum\count4<\authorcolumns
        \ifnum\count4>\z@
            \hskip\authorsep\relax
            \fi
        \ifnum\count\z@>\z@
            \usenix@layoutauthorcolumn{\count4}\usenix@numauthors
            \advance\count\z@\m@ne
        \else
            \usenix@layoutauthorcolumn{\count4}{\count\tw@}%
            \advance\count\tw@\@ne
        \fi
        \advance\count4\@ne
    \repeat
    \global\usenix@currauthor\count\tw@
    \hfil}%
    \ifnum\usenix@currauthor<\usenix@numauthors
        \par\vskip\authorskip\relax
        \hb@xt@\textwidth{\hfil
        \loop\ifnum\usenix@currauthor<\usenix@numauthors
            \begin{tabular}[t]{c}%
            \usenix@authorname\\
            \usenix@institutionname
            \end{tabular}%
            \global\advance\usenix@currauthor\@ne
            \ifnum\usenix@currauthor<\usenix@numauthors
                \hskip\authorsep\relax
            \fi
        \repeat
        \hfil}
    \fi
    \endgroup
}
\newcommand\usenix@layoutauthorcolumn[2]{%
    \global\usenix@currauthor#1
    \begin{tabular}[t]{c}%
    \usenix@l@youtauthorcolumn
    \global\usenix@currauthor#2
    \ifnum\usenix@currauthor<\usenix@numauthors
        \\[\authorskip]%
        \usenix@authorname\\
        \usenix@institutionname
    \fi
    \end{tabular}%
}
\newcommand\usenix@l@youtauthorcolumn{%
    \usenix@authorname\\
    \usenix@institutionname
    \global\advance\usenix@currauthor\authorcolumns
    \ifnum\usenix@currauthor<\count@
        \\[\authorskip]%
        \expandafter\usenix@l@youtauthorcolumn
    \fi
}
\newcommand*\authornewline{%
    \unskip
    \endgroup
    \tabularnewline
    \begingroup
    \upshape
    \ignorespaces
}
\newcommand*\institutionnewline{%
    \unskip
    \tabularnewline
    \ignorespaces
}
\titleformat\section{\bfseries\large}{\thetitle}{1em}{}{}
\titleformat\subsection{\bfseries\fontsize\@xipt{13}\selectfont}{\thetitle}{1em}{}{}
\titleformat\subsubsection{\bfseries}{\thetitle}{1em}{}{}
\endinput
%%
%% End of file `usenix09.cls'.
