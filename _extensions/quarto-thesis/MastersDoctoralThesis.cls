%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Masters/Doctoral Thesis 
% Class File
% Version 1.6 (27/8/17)
%
% This class was downloaded from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Vel (vel@latextemplates.com)
% Johannes Böttcher
%
% Notes:
% 1) This class file defines the structure and layout of the template file (main.tex).
% 2) It has been written in such a way that under most circumstances you should not need
% to edit it; updating it to a newer version will be harder. If you do make changes, please change the name of
% the file and add comments to make your changes more visible.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adapted by Theo Rashid

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{MastersDoctoralThesis}
\ProvidesClass{\classname}[2017/08/27 v1.6 LaTeXTemplates.com]
\providecommand{\baseclass}{book}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\newbool{nolistspace}
\newbool{chapteroneline}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport}
\newbool{headsepline}
\newbool{consistentlayout}

\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{headsepline}{\booltrue{headsepline}}
\DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax

\LoadClass{\baseclass}

\usepackage{titlesec}

% Secciones (1.1, etc.) sin negrita:
\titleformat{\section}%
  {\normalfont\Large}{\thesection}{1em}{}

% Subsecciones (1.1.1, etc.) en negrita:
\titleformat{\subsection}%
  {\bfseries\large}{\thesubsection}{1em}{}


%  Simple interface for the user  to customize the chapter titles 
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{10pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{10pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{10pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\raggedright}
\ProvideDocumentCommand{\chapterfont}{}{\Large\bfseries}
\ProvideDocumentCommand{\chapterprefixfont}{}{\Large\bfseries}
\DeclareDocumentCommand{\@makechapterhead}{ m }{%
  \abovechapterskip
  {\setlength{\parindent}{15pt} \chapteralign
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
         \chapterfont \thechapter\enspace #1
         \par\nobreak
      \fi
    \fi
    \chapterbelowskip
  }
  \thispagestyle{\chapter@p@gestyle}
}

% \DeclareDocumentCommand{\@makechapterhead}{ m }{%
% 	\abovechapterskip
% 	{\setlength{\parindent}{15pt} \chapteralign %\parindent \z@ \chapteralign \normalfont
% 		\ifnum \c@secnumdepth >\m@ne
% 		\if@mainmatter
% 		% \ifbool{chapteroneline}{%
% 		% 	\chapterfont \mdtChapapp\thechapter\autodot\enspace
% 		% }{%
% 		% 	\chapterprefixfont \@chapapp\space \thechapter
% 		% 	\par\nobreak
% 		% 	\chapterinbetweenskip
% 		% }%
% 		\ifbool{chapteroneline}{%
%      \chapterfont \thechapter\autodot\enspace
%     }{%
%       \chapterprefixfont \thechapter
%       \par\nobreak
%       \chapterinbetweenskip
%     }%
% 		\fi
% 		\fi
% 		\interlinepenalty\@M%
% 		\chapterfont #1\par\nobreak
% 		\chapterbelowskip
% 	}
% 	\thispagestyle{\chapter@p@gestyle}
% }

\def\@makeschapterhead#1{%
	\abovechapterskip
	{\setlength{\parindent}{15pt} \chapteralign%{\parindent \z@ \chapteralign
		\normalfont
		\interlinepenalty\@M
		\chapterfont  #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}


% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{parskip}{\RequirePackage{parskip}} % If the parskip option is passed to the class, require the parskip package 


\ifbool{listtoc}{% If the liststotoc option has been passed to the class, add the lists to the table of contents
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
}

\ifbool{toctoc}{% If the toctotoc options has been passed to the class, add the table of contents to the table of contents
	\patchcmd{\tableofcontents}{\@starttoc{toc}%
}{%
	\addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
}

\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}
	}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}
	}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}


%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage{babel} % Required for automatically changing names of document elements to languages besides english

\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements

\RequirePackage{scrhack} % Loads fixes for various packages

\RequirePackage{setspace} % Required for changing line spacing

\RequirePackage{longtable} % Required for tables that span multiple pages (used in the symbols, abbreviations and physical constants pages)

\RequirePackage{siunitx} % Required for \SI commands

\RequirePackage{graphicx} % Required to include images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images

\RequirePackage{booktabs} % Required for better table rules
\RequirePackage{float}
% \RequirePackage{helvet} % use Arial-like font (Helvetica) in thesis
% \renewcommand{\familydefault}{\sfdefault}
% \RequirePackage{amsmath}
% \RequirePackage{amssymb}
% \RequirePackage{bm}

% ------------------------------------------------------------------------
% FONTS CONFIGURATION SIMILAR TO OVERLEAF's ABNTEX2 TEMPLATE
% ------------------------------------------------------------------------
\RequirePackage[T1]{fontenc}       % Encodificación de salida T1
\RequirePackage[utf8]{inputenc}    % Soporte UTF-8 en pdfLaTeX
\RequirePackage{lmodern}           % Latin Modern (texto y math)
\renewcommand{\familydefault}{\sfdefault} % Texto en "Latin Modern Sans"
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{bm} 
%\RequirePackage{placeins}
\RequirePackage{array}
\RequirePackage{multirow}    % Para \bm
\RequirePackage{tabu}
\RequirePackage{caption} % Required for customising the captions
\captionsetup{justification=justified,font=small,labelfont=bf,margin=50pt}

\RequirePackage{tikz}
\usetikzlibrary{shapes, arrows.meta, positioning}

%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM THESIS INFORMATION COMMANDS
%----------------------------------------------------------------------------------------

\NewDocumentCommand{\thesistitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\ttitle{#2}%
}
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorname}{#1}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supname}{#1}}
\NewDocumentCommand{\examiner}{m}{\newcommand{\examname}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreename}{#1}}
\NewDocumentCommand{\addresses}{m}{\newcommand{\addressname}{#1}}
\NewDocumentCommand{\university}{m}{\newcommand{\univname}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\deptname}{#1}}
\NewDocumentCommand{\group}{m}{\newcommand{\groupname}{#1}}
\NewDocumentCommand{\faculty}{m}{\newcommand{\facname}{#1}}
\NewDocumentCommand{\subject}{m}{\newcommand{\subjectname}{#1}}
\NewDocumentCommand{\keywords}{m}{\newcommand{\keywordnames}{#1}}

\newcommand{\checktoopen}{% New command to move content to the next page which prints to the next odd page if twosided mode is active  
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}% The \phantomsection command is necessary for hyperref to jump to the correct page
}

\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}} % New command to make the lines in the title page
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}} % New command for a rule to be used under figures

\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{#1}%
}

%----------------------------------------------------------------------------------------
%	COLOURS
%----------------------------------------------------------------------------------------

\usepackage{xcolor} % Required for specifying custom colours

\colorlet{mdtRed}{red!50!black}

%----------------------------------------------------------------------------------------
%	PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\RequirePackage[markcase=used]{scrlayer-scrpage}
\providepairofpagestyles{thesisSimple}{%
	\clearpairofpagestyles%
	\automark[chapter]{chapter}
	\ihead{}% Inner header
	%\ihead{\headmark}%  <- Aquí imprime "Chapter 1. INTRODUCTION"
	\ohead[\pagemark]{\pagemark}% Outer header
}
\ifoot{}% Inner footer
\ofoot{}% Outer footer
\pagestyle{thesisSimple}
\providepairofpagestyles[thesisSimple]{thesis}{%
	\automark*[section]{}%
}
\providepairofpagestyles[thesisSimple]{review}{%
	\ofoot[\shorttitle/\authorname]{\shorttitle/\authorname}
	\ifoot[\today]{\today}
}
\pagestyle{thesis}
\ifbool{headsepline}{\KOMAoption{headsepline}{true}}{}
\PreventPackageFromLoading[\ClassError{\classname}{Package `fancyhdr' is
incompatible\MessageBreak with this class}{The pagesyles are defined 
	using package `scrlayer-scrpage', please consult the\MessageBreak 
KOMA-script documentation for details.}]{fancyhdr}


\newcommand{\blank@p@gestyle}{plain}
\newcommand{\chapter@p@gestyle}{plain}
\NewDocumentCommand{\blankpagestyle}{ m }{%
	\ClassWarning{\classname}{\string\blankpagestyle\space is
	obsolete,\MessageBreak use \string\setblankpagestyle \space  instead}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{ m }{\renewcommand{\chapter@p@gestyle}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

%----------------------------------------------------------------------------------------
%	ABBREVIATIONS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\abbrevname}{List of Abbreviations}
\providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
\providecaptionname{ngerman,german,austrian,naustrian}{\abbrevname}{Abk\"urzungsverzeichnis}
\NewDocumentEnvironment{abbreviations}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\abbrevname}}{\addchap*{\MakeUppercase{\abbrevname}}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------

\DeclareDocumentCommand{\abstractauthorfont}{}{}
\DeclareDocumentCommand{\abstracttitlefont}{}{}
\newcommand{\byname}{by}
\newcommand{\abstractname}{ABSTRACT}
\providecaptionname{german,ngerman,austrian,naustrian}{\byname}{von}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\byname}{by}
\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{abstract}{ O{} }{%
		\addchap*{\MakeUppercase{\abstractname}}%
		%{\chapteralign\normalsize\abstractauthorfont \authorname \par}% Author name
		%\vspace{\baselineskip}
		%{\chapteralign\parbox{.7\linewidth}{\chapteralign\normalsize\itshape\abstracttitlefont\@title}\par}% Thesis title
		%\bigskip\noindent\ignorespaces
	}%
	{}%end alt-abstract
}{%
	\DeclareDocumentEnvironment{abstract}{ O{} }{
		\checktoopen
		\tttypeout{\abstractname}
		#1%added to be able to have abstract more than one page long
		\thispagestyle{plain}
		\begin{flushleft}{\bfseries\Large\abstractname\par}\end{flushleft}
	}
	{
		\vfil\vfil\null
	}
}

\DeclareDocumentEnvironment{extraAbstract}{ O{} }{
	\checktoopen
	\tttypeout{\abstractname}
	#1%added to be able to have abstract more than one page long
	\thispagestyle{plain}
	\begin{flushleft}{\bfseries\Large\abstractname\par}\end{flushleft}
}
{
	\vfil\vfil\null
}


%----------------------------------------------------------------------------------------
%	RESUMO PAGE DESIGN (Similar to Abstract)
%----------------------------------------------------------------------------------------

\DeclareDocumentCommand{\resumoauthorfont}{}{}
\DeclareDocumentCommand{\resumotitlefont}{}{}
\newcommand{\resumobyname}{por} % Traducción de "by" al portugués
\newcommand{\resumoname}{RESUMO} % Título en portugués

\providecaptionname{brazil,portuguese,portuges}{\resumobyname}{por}

\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{resumo}{ O{} }{%
		\addchap*{\MakeUppercase{\resumoname}}%
		%{\chapteralign\normalsize\resumoauthorfont \authorname \par}% Author name
		%\vspace{\baselineskip}
		%{\chapteralign\parbox{.7\linewidth}{\chapteralign\normalsize\itshape\resumotitlefont\@title}\par}% Thesis title
		%\bigskip\noindent\ignorespaces
	}%
	{}%end alt-resumo
}{%
	\DeclareDocumentEnvironment{resumo}{ O{} }{
		\checktoopen
		\tttypeout{\resumoname}
		#1 % Allow for multi-page resumo
		\thispagestyle{plain}
		\begin{flushleft}{\bfseries\Large\resumoname\par}\end{flushleft}
	}
	{
		\vfil\vfil\null
	}
}

\DeclareDocumentEnvironment{extraResumo}{ O{} }{
	\checktoopen
	\tttypeout{\resumoname}
	#1 % Allow for multi-page resumo
	\thispagestyle{plain}
	\begin{flushleft}{\bfseries\Large\resumoname\par}\end{flushleft}
}
{
	\vfil\vfil\null
}

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\usepackage{xcolor}
\colorlet{mdtRed}{red!50!black}
\newcommand{\acknowledgementname}{ACKNOWLEDGEMENTS}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish} {\acknowledgementname}{Acknowledgements} % Acknowledgement text for English countries
\providecaptionname{german,ngerman,austrian,naustrian}{\acknowledgementname}{Danksagung} % Acknowledgement text for Germanic countries

\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{acknowledgements}{}{%
		\tttypeout{\acknowledgementname}
		\addchap*{\MakeUppercase{\acknowledgementname}}
	}
}
{
	\DeclareDocumentEnvironment{acknowledgements}{}{%
		\checktoopen
		\tttypeout{\acknowledgementname}
		\thispagestyle{plain}
		\begin{flushleft}{\bfseries\Large\acknowledgementname\par}\end{flushleft}
	}
	{
		\vfil\vfil\null
	}
}

%----------------------------------------------------------------------------------------
%	COPYRIGHT PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\copyrightname}{Copyright}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\copyrightname}{Copyright}

\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{copyright}{}{
		\tttypeout{\copyrightname}
		\addchap*{\copyrightname}
		}{}%
}{
	\DeclareDocumentEnvironment{copyright}{}{
		\checktoopen
		\tttypeout{\copyrightname}
		\thispagestyle{plain}
		\begin{flushleft}{\huge\copyrightname\par}\end{flushleft}
	}{}
}

%----------------------------------------------------------------------------------------
%	DECLARATION PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\authorshipname}{Declaration of Authorship}
\providecaptionname{american,australian,british,canadian,english,newzealand,UKenglish,USenglish}{\authorshipname}{Declaration of Authorship} % Declaration of Authorship text for English countries
\providecaptionname{german,ngerman,austrian,naustrian}{\authorshipname}{Eidesstattliche Erkl\"arung} % Declaration of Authorship text for Germanic countries

\ifbool{consistentlayout}{
	\DeclareDocumentEnvironment{declaration}{}{
		\addchap*{\authorshipname}
		}{}%
}{
	\DeclareDocumentEnvironment{declaration}{}{
		\checktoopen
		\tttypeout{\authorshipname}
		\thispagestyle{plain}
		\begin{flushleft}{\huge\authorshipname\par}\end{flushleft}
	}{}
}

%----------------------------------------------------------------------------------------
%	DEDICATION PAGE DESIGN
%----------------------------------------------------------------------------------------

% \ifbool{consistentlayout}{
% 	\DeclareDocumentCommand{\dedicatory}{
% 		m O{\vspace*{.7\textheight} }  }{
% 			\checktoopen\tttypeout{Dedicatory}
% 			\markboth{}{}
% 			#2
% 			{\hfill\parbox{.4\textwidth}{\flushright#1\par}}
% 		}
% }{
% 	\newcommand\dedicatory[1]{
% 		\checktoopen
% 		\tttypeout{Dedicatory}
% 		\null\vfil
% 		\thispagestyle{plain}
% 		\begin{center}{\Large\slshape #1}\end{center}
% 		\vfil\null
% 	}
% }

% \DeclareDocumentCommand{\dedicatory}{ m O{\vfill} }{
%     \checktoopen\tttypeout{Dedicatory}
%     \markboth{}{}
%     #2
%     {\hfill\parbox{.4\textwidth}{\flushright#1\par}}
% }

\ifbool{consistentlayout}{
  \DeclareDocumentCommand{\dedicatory}{ m O{\vfill} }{
    \checktoopen\tttypeout{Dedicatory}
    \markboth{}{}
    #2
    {\hfill\parbox{.4\textwidth}{\flushright#1\par}}
  }
}{
  \newcommand\dedicatory[1]{
    \checktoopen
    \tttypeout{Dedicatory}
    \null\vfil
    \thispagestyle{plain}
    \begin{center}{\Large\slshape #1}\end{center}
    \vfil\null
  }
}

%----------------------------------------------------------------------------------------
%	PHYSICAL CONSTANTS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\constantsname}{Physical Constants}
\providecaptionname{english,british,american}{\constantsname}{Physical Constants}
\providecaptionname{ngerman,german,austrian,naustrian}{\constantsname}{Physikalische Konstanten}

\NewDocumentEnvironment{constants}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\constantsname}}{\addchap*{\constantsname}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------
%	SYMBOLS PAGE DESIGN
%----------------------------------------------------------------------------------------

\newcommand{\symbolsname}{List of Symbols}
\providecaptionname{english,british,american}{\symbolsname}{List of Symbols}
\providecaptionname{ngerman,german,austrian,naustrian}{\symbolsname}{Symbolverzeichnis}

\NewDocumentEnvironment{symbols}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\symbolsname}}{\addchap*{\MakeUppercase{\symbolsname}}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
}

%----------------------------------------------------------------------------------------

\ifbool{hyperrefsupport}{% If the nohyperref class option has not been specified
\AtEndPreamble{\RequirePackage{hyperref}
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true,
bookmarksopenlevel=0,
hypertexnames=false,
pdfstartview={FitV},
unicode,
breaklinks=true,
}

\pdfstringdefDisableCommands{% If there is an explicit linebreak in a section heading (or anything printed to the pdf-bookmarks), it is replaced by a space
	\let\\\space%
}
	}
}{%nothing
}

%----------------------------------------------------------------------------------------

\endinput
% lazyLizardTracer

