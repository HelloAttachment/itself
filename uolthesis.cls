
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uolthesis}[28/09/2012, modified from mitthesis.cls by Yue Gao at QMUL.]

%  Thesis looks much like report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}

%%%%%%%%%%%%%%% begin of packages %%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}           % set double or single space

%\RequirePackage[%sort&compress,      % sort the ref
%                numbers,            % use number for cite
%                sectionbib          % to generate bibiography as section instead of chapter
%                ]{natbib}           % to get citation like [1,2] and [3-5]
%\RequirePackage{chapterbib}         % create bibiography for each chapter
%\RequirePackage{hypernat}           % To solve the conflict between hyperref and natbib
\RequirePackage[natbibapa]{apacite}
\RequirePackage{hypernat}           % To solve the conflict between hyperref and natbib

\RequirePackage[titletoc            % Display the Appendix in table of contents
                ]{appendix}         % can use appendices environment for extra control at appendix
\RequirePackage{tocbibind}          % Add toc, lof, lot into table of contents

\RequirePackage{fancyhdr}           % fancy header
\RequirePackage{parskip}            % handle the parskip better for list, figs

\RequirePackage{graphicx}           % for displying figures
\RequirePackage{amsmath}            % for ams-math stuffs
\RequirePackage{amsfonts}           %
\RequirePackage{amssymb}            %
\RequirePackage{amsthm}             %
\RequirePackage{ragged2e}

\RequirePackage{rotating}           % for rotated table, \begin{sidewaystable}....\end{sidewaystable}
%\RequirePackage{subfigure}          % for sub-figures

%\RequirePackage[%dvipdfm,            % for dvi2pdf
%                colorlinks=false,   % no color for the link
%                pdfborder=001       % no border for the link
%                ]{hyperref}         % to generate links in pdf file

%%%%%%%%%%%%%%% end of packages %%%%%%%%%%%%%%%%%%%%%

%%%%%%%  Set up margins and formatting params %%%

% Margins.
%  Note we want 1in top margin assuming no header line, so push header
%   into 1in margin.
%  Draft mode brings the header back down.
\setlength{\oddsidemargin}{0.5in}       % 1.5in left margin
\setlength{\evensidemargin}{-0.25in}    % 0.75in left margin (even pages)
\setlength{\topmargin}{0.0in}           % 1in top margin
\setlength{\textwidth}{5.8in}           % 6.0in text - 1.25in rt margin
\setlength{\textheight}{8.8in}          % Body ht for 1in margins
\setlength{\headheight}{0.2in}          % Height of header
\addtolength{\topmargin}{\headsep}      % for header height and separation
\addtolength{\topmargin}{-\headheight}  % No header, so compensate

%\setlength{\parskip}{\baselineskip}    % set the vertical space between paragraphs
\setlength{\parskip}{10pt}              % set the vertical space between paragraphs
\setlength{\parindent}{16pt}            % set the indent of paragraphs (except the first one)

\onehalfspacing                          % Double spacing from the beginning

% By default, LaTeX doesn't like to fill more than 0.7 of a text page with tables and graphics,
% nor does it like too many figures per page. This behaviour can be changed by placing lines
% like the following before \begin{document}
\renewcommand{\textfraction}{0.0}
\renewcommand{\topfraction}{0.95}
\renewcommand{\bottomfraction}{0.95}
\renewcommand{\floatpagefraction}{0.95}
\setcounter{totalnumber}{50}
\setcounter{topnumber}{50}
\setcounter{bottomnumber}{50}

% use \nohyphens in text to stop auto-hyphens
%\def\nohyphenation{\hyphenpenalty=1000\exhyphenpenalty=1000}
\def\lesshyphenation{\lefthyphenmin =3 \righthyphenmin=3}
\def\nohyphenation{\lefthyphenmin =100 \righthyphenmin=100}
%
%%%%%%%  End of margins and formatting params %%%
     
%%%%%%% Begin of header and footer %%%%%
% The next two macros compensate page style for headers and footers
% We only need them in page styles that USE headers and footers.
    % If we have a header, it must be 1in from top of page.
\def\pulldownheader{            % Shift header down 1in from top
    \addtolength{\topmargin}{\headheight}
    \addtolength{\topmargin}{\headsep}
    \addtolength{\textheight}{-\headheight}
    \addtolength{\textheight}{-\headsep}
}
    % If we have a footer, put it 1in up from bottom
\def\pullupfooter{              % Shift footer up
    \addtolength{\textheight}{-\footskip}
%    \addtolength{\textheight}{-\footheight}  %footheight doesn't
%                           exist in 2e
}

% new header with a line between header and text
%
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername \ \thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{{\thesection.\ #1}}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

\fancyhf{}                  % clear hearder setting

\if@twoside                 % If two-sided printing.
\fancyhead[LE,RO]{\thepage}
\fancyhead[LO]{\nouppercase{\emph{\rightmark}}}
\fancyhead[RE]{\nouppercase{\emph{\leftmark}}}
\fancyfoot{}                                    % clear all footer fields
\else                       % If one-sided printing.
\fancyhead[RO]{\thepage}
\fancyhead[LO]{\nouppercase{\emph{\leftmark}}}
\fancyfoot{}                                    % clear all footer fields
\fi
%
%%%%%%% End of header and footer %%%%%

%%%%%%%%%  Begin of Style parameters %%%%
%
% define the depth of sections
\setcounter{secnumdepth}{3}

% redefine table caption
\renewcommand{\thetable}{\arabic{chapter}-\Alph{table}}
% redefine figure caption
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
% redefine contents caption
\renewcommand{\contentsname}{Table of Contents}

\newdimen\bibindent
\bibindent=1.5em

% References setting, change its caption to References and add reference into contents
\def\thebibliography#1{\chapter*{References}%
    \addcontentsline{toc}{chapter}{References}%
    \setcounter{NAT@ctr}{0} % reset the reference counter
    \list{\@biblabel{#1}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep\relax
    \advance\leftmargin\bibindent
    \itemindent -\bibindent
    \listparindent \itemindent
    \itemsep -12pt plus .5pt\relax}} %
\def\newblock{\hskip .11em plus .33em minus .07em}%

% Redefine '/chapter' to always start on an odd page.
% Should make no difference in singleside mode.
%
\def\chapter{\cleardoublepage   % Starts new page.
   \thispagestyle{plain}    % Page style of chapter page is 'plain'
   \global\@topnum\z@       % Prevents figures from going at top of page.
   \@afterindentfalse       % Suppresses indent in first paragraph.  Change
   \secdef\@chapter\@schapter  % to \@afterindenttrue to have indent.
}

% define 'appendix' environment to display "Appendix" in page header
%
\def\appendix{
\renewcommand{\appendixname}{Appendix}
\renewcommand{\chaptername}{\appendixname}
\begin{appendices}
}
% for the use of \end{appendix}
\def\endappendix{
\end{appendices}
}
%%%%%%%%%  End of Style parameters %%%%

% Here's Gildea's Boilerplate Stuff.
% Copyright (c) 1987 by Stephen Gildea
% Permission to copy all or part of this work is granted, provided
% that the copies are not made or distributed for resale, and that
% the copyright notice and this notice are retained.

%% Define all the pieces that go on the title page and the abstract.

% \title and \author already exist
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}
\def\@prevdegrees{}

\def\department#1{\gdef\@department{#1}}
\def\college#1{\gdef\@college{#1}}

% If you are getting two degrees, use \and between the names.
\def\degree#1{\setbox0\hbox{#1}  %for side effect of setting \@degreeword
  \gdef\@degree{#1}}

% \and is used inside the \degree argument to separate two degrees
\def\and{\gdef\@degreeword{degrees} \par and \par}
\def\@degreeword{degree}

% The copyright notice stuff is a tremendous mess.
%
% \@copyrightnotice is used by \maketitle to actually put text on the
% page; it defaults to ``Copyright University of London 19xx.  All rights reserved.''
% \copyrightnoticetext takes an argument and defined \@copyrightnotice
% to that argument.  \copyrightnotice takes an argument, and calls
% \copyrightnoticetext with that argument, preceeded by a copyright
% symbol and followed by ``All rights reserved.'' and the standard
% permission notice.
%
% If you use the 'vi' option, \copyrightnoticetext is used to set the
% copyright to ``(C) Your Name, Current Year in Roman Numerals.''
% followed by the permission notice.

% If there is no \copyrightnotice command, it is asssumed that University of London
% holds the copyright.  This commands adds the copyright symbol to the
% beginning, and puts the standard permission notice below.
%% ``All rights reserved'' added.  Krishna Sethuraman (1990)
\def\copyrightnotice#1{\copyrightnoticetext{\copyright\ #1.  All rights
reserved.\par\permission}}

% Occacionally you will need to exactly specify the text of the
% copyright notice.  The \copyrightnoticetext command is then useful.
\long\def\copyrightnoticetext#1{\gdef\@copyrightnotice{#1}}
\def\@copyrightnotice{\copyright\ \uol\ \@degreeyear.  All rights reserved.}

%% copyright information for compilation
\typeout{Thesis document copyright University of London unless otherwise (manually) specified}

% typically just a month and year
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
% dedication
\def\dedication#1{\gdef\@dedication{#1}}
\def\@dedication{TO MY FAMILY} % default value

%%%%%%%%%%%%%%%%% Define commands to make title pages %%%%%%%%%%%%%%%%%%%%
\def\maketitle{\begin{titlepage}
\vspace*{2cm}
{\def\baselinestretch{1.2}\huge\bf {\@title} \par}
\par
\vskip 2cm
{\LARGE by} \\
\vskip 0.5cm
{\LARGE \@author } \\
\vskip 3cm
\par
{\def\baselinestretch{1.2}\Large A thesis submitted to {\uol}
{for the}
{\@degreeword}
{of}
{\LARGE\@degree}\par}
\vskip 6cm
{\Large \@department\\
\@college\\
United Kingdom\\
\par
\vskip 1cm
{\large \@degreemonth\ \@degreeyear}}
\vfill
\end{titlepage}}

%%%%%%%%%%%%%%%%% Define commands to make dedication pages %%%%%%%%%%%%%%%%%%%%
\def\makededication{\begin{titlepage}
\vspace*{5cm}
{\bf\Large \@dedication}
\vfill
\end{titlepage}}

%%%%%%%%%%%%%%%%% Define commands to make declarartion pages %%%%%%%%%%%%%%%%%%%
\def\makedeclaration{\begin{titlepage}
\vspace*{2cm}
\justifying
My university requires me to make the following statement:

The copyright of this thesis rests with the author and no quotation from it or information derived from it may be published without the prior written consent of the author.

I add this:

I hereby grant permission to anyone to do anything they so please with the text of this thesis and any information they derive from it or meaning they find in it, with or without acknowledgement of the source.
\vfill
\end{titlepage}}

%%%%%%%%%%%%%%%%% declaration environment for abstract page %%%%%%%%%%%%%%%%%%%%
\def\declaration{
\clearpage
\section*{}     % To correct the wrong link in PDF file by hyperref
\begin{center}%{
%\Huge{Abstract}}
  \addcontentsline{toc}{chapter}{Abstract} % display Abstract in contents%
\end{center}
\vspace{0.5cm}
\par
\setlength{\parindent}{0pt}            % reset the indent of paragraphs (except the first one)
}
% for \end{abstract}
\def\endabstract{
\newpage
\setlength{\parindent}{16pt}            % set the indent of paragraphs (except the first one)
}

%%%%%%%%%%%%%%%%%%% abstract environment for abstract page %%%%%%%%%%%%%%%%%%%%
\def\abstract{
\clearpage
\section*{}     % To correct the wrong link in PDF file by hyperref
\begin{center}{
\Huge{Abstract}}
  \addcontentsline{toc}{chapter}{Abstract} % display Abstract in contents%
\end{center}
\vspace{0.5cm}
\par
\setlength{\parindent}{0pt}            % reset the indent of paragraphs (except the first one)
}
% for \end{abstract}
\def\endabstract{
\newpage
\setlength{\parindent}{16pt}            % set the indent of paragraphs (except the first one)
}

%%%%%%%%%%%%%%%%%%% context environment for abstract page %%%%%%%%%%%%%%%%%%%%
\def\context{
\clearpage
\section*{}     % To correct the wrong link in PDF file by hyperref
\begin{center}{
\Huge{A Note on Context}}
  \addcontentsline{toc}{chapter}{A Note on Context} % display Abstract in contents%
\end{center}
\vspace{0.5cm}
\par
\setlength{\parindent}{0pt}            % reset the indent of paragraphs (except the first one)
}
% for \end{abstract}
\def\endabstract{
\newpage
\setlength{\parindent}{16pt}            % set the indent of paragraphs (except the first one)
}

%%%%%%%%%%%%%%%%%%% glossary environment for abstract page %%%%%%%%%%%%%%%%%%%%
\def\glossary{
\clearpage
\section*{}     % To correct the wrong link in PDF file by hyperref
\begin{center}{
\Huge{Glossary}}
  \addcontentsline{toc}{chapter}{Glossary} % display Abstract in contents%
\end{center}
\vspace{0.5cm}
\par
\setlength{\parindent}{0pt}            % reset the indent of paragraphs (except the first one)
}
% for \end{abstract}
\def\endabstract{
\newpage
\setlength{\parindent}{16pt}            % set the indent of paragraphs (except the first one)
}
 
%%%%%%%%%%%%%%%%%%%%%%%%% acknowledgments environment %%%%%%%%%%%%%%%%%%%%%%%%
\def\acknowledgments{
\clearpage
\section*{}     % To correct the wrong link in PDF file by hyperref
\begin{center}{
\Huge{Acknowledgments}}
\end{center}
  \addcontentsline{toc}{chapter}{Acknowledgments}   % display Acknowledgments in contents%
\vspace{0.5cm}
\par
\setlength{\parindent}{0pt}            % reset the indent of paragraphs (except the first one)
}
% for \end{acknowledgments}
\def\endacknowledgments{
\newpage
\setlength{\parindent}{16pt}            % set the indent of paragraphs (except the first one)
}
 
%%%%%%%%%%%%%%%%%%%%%%%%% Abbreviations environment %%%%%%%%%%%%%%%%%%%%%%%%
\def\abbreviations{
\clearpage
\chapter*{List of Abbreviations}
  \addcontentsline{toc}{chapter}{List of Abbreviations} % display List of Abbreviations in contents%
\setlength{\parindent}{0pt}            % reset the indent of paragraphs (except the first one)
}
% for \end{abbreviations}
\def\endabbreviations{
\newpage
\setlength{\parindent}{16pt}            % set the indent of paragraphs (except the first one)
}

% You can use the titlepage environment to do it all yourself if you
% don't want to use \maketitle.  If the titlepage environment, the
% paragraph skip is infinitely stretchable, so if you leave a blank line
% between lines that you want space between, the space will stretch so
% that the title page fills up the entire page.
\def\titlepage{\cleardoublepage\centering
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
% The \kern0pt pushes any depth into the height.  Thanks to Richard Stone.
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}

\def\UOL{QUEEN MARY UNIVERSITY OF LONDON}
\def\uol{Queen Mary University of London}

\def\permission{\par\noindent{\centering
   The author hereby grants to University of London permission to reproduce and
   distribute publicly paper and electronic copies of this thesis
   document in whole or in part.}\par}
