% This template aims to simplify and improve the (Xe)LaTeX template provided
% by the TU Delft. Original template by TU Delft. Rewritten template by Daan
% Zwaneveld (https://dzwaneveld.github.io)
%
% This template by Daan Zwaneveld is licensed under CC BY-NC 4.0. To view a
% copy of this license, visit https://creativecommons.org/licenses/by-nc/4.0/.a
% No attribution is required in PDF outputs created using this template.
%
% This template was modified by Jesse Rodrigo to work for Project Chimera
% of the Delft Aerospace Rocket Engineering (DARE) based on the work of Stephen Goldebeld who originally made the template for Stratos V.

%% ----------------------------------------------------------------------
%%    Setting up the class, main packages and basic definitions
%% ----------------------------------------------------------------------

%% Class is based on the default book class and options will be passed
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dare_report}[04-09-2023 v1.1 DARE Report Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[11pt,oneside]{book}

%% Main packages in the document --- Some are imported later in the class file
\RequirePackage{amsmath}    % Mathematical package
\RequirePackage{mathtools}  % Mathematical tools to use with amsmath
\RequirePackage{amssymb}    % Extended symbol collection
\RequirePackage{siunitx}    % Comprehensive (SI) units package

\RequirePackage{tabularx}   % Tabulars with adjustable-width columns
\RequirePackage{booktabs}   % Publication quality tables
\RequirePackage{longtable}  % Allow tables to flow over page boundaries
\RequirePackage{multirow}   % Create tabular cells spanning multiple rows

\RequirePackage{graphicx}   % Enhanced support for images
\RequirePackage{float}      % Improved interface for floating objects
\RequirePackage[labelfont=bf,justification=centering,footnotesize]{caption} % Captions
\RequirePackage{subcaption} % Support for sub-captions
\RequirePackage{pdfpages}   % Include PDF documents

\RequirePackage[pdfusetitle,hidelinks]{hyperref} % Extensive support for hypertext
% Add names for hyperref
\newcommand*{\Appendixautorefname}{appendix}
\renewcommand{\appendixautorefname}{appendix}

\RequirePackage[noabbrev]{cleveref} % Intelligent cross-referencing
\RequirePackage{xcolor}     % Driver-independent color extensions
\RequirePackage{tikz}       % Create PostScript and PDF graphics
\usetikzlibrary{fadings}    % Create fade fills with tikz (for title page)
\RequirePackage{xspace}     % Define commands that appear not to eat spaces
\RequirePackage{microtype}  % Refinements towards typographical perfection

\RequirePackage{geometry}   % Customize document dimensions
\RequirePackage{titlesec}   % Select alternative section titles
\RequirePackage{titletoc}   % Alternative headings for toc
\RequirePackage{fancyhdr}   % Control of page headers and footers
\RequirePackage{enumitem}   % Control layout of itemize, enumerate, description
\RequirePackage{etoolbox}   % Toolbox of programming facilities
\RequirePackage{iftex}      % Adds if-else statements to support multiple compilers
\RequirePackage{ifthen}     % Create if/else statements
\RequirePackage{datetime}   % Change format of \today
\usepackage[toc,title]{appendix} % Create better appendix layout

\RequirePackage{parskip} % Indentation for paragraphs
\newcommand{\noskip}{\vspace{-\parskip}\hspace{15pt}} % Custom command to have an indent with no white space

%% Bibliography package and setup
\RequirePackage[backend=biber,style=numeric,url=true,citestyle=numeric,natbib=true,sorting=anyvt]{biblatex}
%% Spacing of sources
\setlength\bibitemsep{.5\baselineskip}
%% Prevent urls running into margins in bibliography
\setcounter{biburlnumpenalty}{7000}
\setcounter{biburllcpenalty}{7000}
\setcounter{biburlucpenalty}{7000}

\usepackage{listings}       % Small code listings
\RequirePackage{minted}     % Code blocks
\usemintedstyle{tango}      % Style for minted
\allowdisplaybreaks         % Allow multiple pages for code

\RequirePackage{subfiles}       % Allow compilation of subfiles

%% Additional packages and commands
\setlist{itemsep=-2pt} % Reducing white space in lists slightly
\renewcommand{\deg}{\si{\degree}\xspace} % Use \deg easily, everywhere

%% Set graphics path
\graphicspath{ {./images/} }

%% Establish commands for the subtitle, subject, affiliation, cover image and table of authors
\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand*{\subject}[1]{\def\@subject{#1}}
\newcommand*{\affiliation}[1]{\def\@affiliation{#1}}
\newcommand*{\coverimage}[1]{\def\@coverimage{#1}}
\newcommand*{\covertable}[1]{\def\@covertable{#1}}

%% Margins
\geometry{a4paper,top=4cm,bottom=2.5cm,right=2cm,left=2cm}

%% ----------------------------------------------------------------------
%%    Setting up the colors
%% ----------------------------------------------------------------------

\definecolor{DARE_BLUE}{RGB}{102,146,176}         % DARE Blue color
\definecolor{DARE_SAFETY}{RGB}{255,141,0}         % DARE Safety Orange color
\definecolor{AXO_RED}{RGB}{179,0,41}               % custom team color: 1
\definecolor{AXO_BEIGE}{RGB}{240,241,217}               % custom team color: 2
\definecolor{AXO_BLACK}{RGB}{0,0,0}               % custom team color: 3
\definecolor{AXO_GREEN}{RGB}{35,165,152}              % custom team color: 4
\definecolor{AXO_DARK_BEIGE}{RGB}{206,170,130}              % custom team color: 5
\definecolor{TITLE_TEXT_COLOR}{RGB}{255,255,255}  % default: light grey (231,231,231)
\definecolor{PAGE_HAZE_COLOR}{RGB}{0,0,0}   % default: same as DARE blue
\definecolor{CELL_WARN}{RGB}{255,172,70}          % default: step warning color

\definecolor{LINK}{RGB}{35,165,152}

\definecolor{lightblue}{RGB}{198,217,240}
\definecolor{midblue}{RGB}{141,180,226}
\definecolor{darkblue}{RGB}{79,129,189}
\definecolor{lightgreen}{RGB}{226,239,217}
\definecolor{darkgreen}{RGB}{99,190,123}
\definecolor{green}{RGB}{198,224,180}
\definecolor{lightred}{RGB}{255,199,206}
\definecolor{red}{RGB}{255,153,153}
\definecolor{yellow}{RGB}{255,242,204}
\definecolor{orange}{RGB}{244,177,131}

% Custom color for links in text
\hypersetup{colorlinks,linkcolor={LINK},citecolor={LINK},urlcolor={LINK}} 


%% ----------------------------------------------------------------------
%%    Setting up functions for document variables
%% ----------------------------------------------------------------------

\newcommand{\teamname}{TEAM NAME}
\newcommand{\setteamname}[1]{\renewcommand{\teamname}{#1}}

\renewcommand{\title}{Title}
\newcommand{\settitle}[1]{\renewcommand{\title}{#1}}

\newcommand{\documentid}{}
\newcommand{\setdocumentid}[1]{\renewcommand{\documentid}{#1}}

\renewcommand{\author}{}
\newcommand{\setauthor}[1]{\renewcommand{\author}{#1}}

\newcommand{\reviewer}{}
\newcommand{\setreviewer}[1]{\renewcommand{\reviewer}{#1}}

\newcommand{\version}{}
\newcommand{\setversion}[1]{\renewcommand{\version}{#1}}

\newcommand{\reportdate}{}
\newcommand{\setreportdate}[1]{\renewcommand{\reportdate}{#1}}

\newcommand{\authorlines}{0}
\newcommand{\setauthorlines}[1]{\renewcommand{\authorlines}{#1}}

\newcommand{\reviewerlines}{0}
\newcommand{\setreviewerlines}[1]{\renewcommand{\reviewerlines}{#1}}

%% ----------------------------------------------------------------------
%%    Setting up images
%% ----------------------------------------------------------------------

\newlength{\headimgx}

\newcommand{\backgroundimage}{}
\newcommand{\setbackgroundimage}[1]{\renewcommand{\backgroundimage}{#1}}

\newcommand{\compactlogo}{}
\newcommand{\setcompactlogo}[1]{\renewcommand{\compactlogo}{#1}}

\newcommand{\headerpatch}{}
\newcommand{\setheaderpatch}[1]{\renewcommand{\headerpatch}{#1}}

\newcommand{\missionpatch}{}
\newcommand{\setmissionpatch}[1]{\renewcommand{\missionpatch}{#1}}

% Compact logo (on titlepage and in header)
\setcompactlogo{} % leave empty or comment out to remove

% Header patch
\setheaderpatch{Axolotl_patch.png} % leave empty or comment out to remove

% Titlepage white mission patch
\setmissionpatch{Axolotl_patch.png}  % leave empty or comment out to remove

% Caption with bold numbering, with Sparrow color
\DeclareCaptionLabelFormat{mylabel}{\textcolor{COLOR1}{\textbf{#1 #2}}\hspace{1.5ex}}
\captionsetup{labelformat=mylabel,labelsep=none}

%% ----------------------------------------------------------------------
%%    Setting up the fonts
%% ----------------------------------------------------------------------

\ifPDFTeX
    %% With pdfLaTeX, use Paletino as the main font and Roboto Slab as title fonts
    \RequirePackage[T1]{fontenc}  % Select T1 font encoding
    \RequirePackage{newpxtext}    % Palatino-like font...
    \RequirePackage{newpxmath}    % ...with support for mathematics

    \newcommand{\titlestyle}{\fontfamily{RobotoSlab-TLF}\fontseries{light}\selectfont}
    \newcommand{\largetitlestyle}{\fontfamily{RobotoSlab-TLF}\fontseries{thin}\selectfont}
\else
    %% If XeLaTeX or LuaLaTeX is set as the compiler, the TU Delft house style fonts are used (see https://www.tudelft.nl/huisstijl/bouwstenen/typografie).
    \RequirePackage{fontspec} % Advanced font selection

    %% Use Arial as the main font and Roboto Slab as title fonts
    \setmainfont{Arial}
    \setmathsf{Arial}
    \setmathtt{Arial}

    \newfontfamily\titlestyle{Roboto Slab Light}
    \newfontfamily\largetitlestyle{Roboto Slab Thin}
\fi

\newcommand*{\montserratfont}{\fontfamily{Montserrat-TOsF}\selectfont}
\DeclareTextFontCommand{\textmontserrat}{\montserratfont}

%% ----------------------------------------------------------------------
%%    Formatting the titles and table of contents
%% ----------------------------------------------------------------------

% Chapter title
\titleformat{\chapter}{\montserratfont\LARGE\bfseries\color{AXO_RED}}{\thechapter}{1em}{}
\titlespacing*{\chapter}{0pt}{1.3ex plus 1ex minus .2ex}{0.3ex plus .2ex}{}

% Section title
\titleformat{\section}{\montserratfont\Large\bfseries\color{AXO_RED}}{\thesection}{1em}{}
\titlespacing*{\section}{0pt}{2.3ex plus 1ex minus .2ex}{0.8ex plus .2ex}{}

% Subsection title
\titleformat{\subsection}{\montserratfont\large\bfseries\color{AXO_GREEN}}{\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{2.3ex plus 1ex minus .2ex}{0.8ex plus .2ex}{}

% Subsubsection title
\titleformat{\subsubsection}{\montserratfont\normalsize\bfseries\color{AXO_DARK_BEIGE}}{\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{0pt}{2.3ex plus 1ex minus .2ex}{0.5ex plus .2ex}{}

%% ----------------------------------------------------------------------
%%    Formatting the header and footer
%% ----------------------------------------------------------------------

\newboolean{dareheader}

\newcommand{\headeraddress}{}
\newcommand{\setheaderaddress}[1]{\renewcommand{\headeraddress}{#1}}

\newcommand{\headerphone}{}
\newcommand{\setheaderphone}[1]{\renewcommand{\headerphone}{#1}}

\newcommand{\headeremail}{}
\newcommand{\setheaderemail}[1]{\renewcommand{\headeremail}{#1}}

\newcommand{\headerwebsite}{}
\newcommand{\setheaderwebsite}[1]{\renewcommand{\headerwebsite}{#1}}

\newlength{\headx}
\newlength{\heady}

\renewcommand{\headrulewidth}{0pt} % Remove black line from header
\setlength{\headheight}{33pt}
\fancypagestyle{plain}
{
    % Header
    \fancyhf{}
    {
        \ClearShipoutPicture
        \AddToShipoutPicture
        {
            % DARE or custom header
            \ifthenelse{\boolean{dareheader}}{
                % DARE style: single block in DARE blue, text vertically centered
                \setlength{\heady}{771pt}
                \put(0,757){\begin{tikzpicture}
                    \fill [DARE_BLUE] (0pt,0pt) rectangle (\paperwidth,60pt);
                \end{tikzpicture}}
                }{
                    % Custom style: accent color blocks, text aligned to top
                    \setlength{\heady}{775pt}
                    \put(0,757){\begin{tikzpicture}
                        \fill [AXO_BLACK] (0pt,8pt) rectangle (\paperwidth,60pt);
                        \fill [AXO_RED] (0pt,3pt) rectangle (\paperwidth,8pt);
                        \fill [AXO_GREEN] (0pt,0pt) rectangle (\paperwidth,4pt);
                    \end{tikzpicture}}
                }
            % With or without patch
            \StrLen{\headerpatch}[\headerpatchlength]
            \ifnum\headerpatchlength>0
                % With patch: white circle behind patch picture, text moved right
                \put(20,741.5){\begin{tikzpicture}
                \filldraw [white] (0,0) circle (45pt);
                \end{tikzpicture}}
                \put(23.5,745){\includegraphics[height=83pt]{\headerpatch}}
                \setlength{\headx}{140pt}
                \setlength{\headimgx}{510pt}
            \else
                % Without patch: text aligned left
                \setlength{\headx}{70pt}
                \setlength{\headimgx}{480pt}
            \fi
            
            % Place header text
            \put(\headx,\heady+24pt){\textcolor{white}{\scriptsize{\textmontserrat{Address}}}}%\faMapMarker
            \put(\headx+50pt,\heady+24pt){\textcolor{white}{\scriptsize{\textmontserrat{\headeraddress}}}}
            \put(\headx+ 6pt,\heady+16pt){\textcolor{white}{\scriptsize{\textmontserrat{Phone}}}}%\faPhone
            \put(\headx+50pt,\heady+16pt){\textcolor{white}{\scriptsize{\href{tel:\headerphone}{\textmontserrat{\textcolor{white}{\headerphone}}}}}}
            \put(\headx+ 9pt,\heady+8pt){\textcolor{white}{\scriptsize{\textmontserrat{Email}}}}%\faEnvelope
            \put(\headx+50pt,\heady+8pt){\textcolor{white}{\scriptsize{\href{mailto:\headeremail}{\textcolor{white}{\textmontserrat{\headeremail}}}}}}
            \put(\headx     ,\heady){\textcolor{white}{\scriptsize{\textmontserrat{Website}}}}%\faLink
            \put(\headx+50pt,\heady){\textcolor{white}{\scriptsize{\href{http://\headerwebsite}{\textmontserrat{\textcolor{white}{\headerwebsite}}}}}}
             
            % DARE logo on right (+ optional compact logo)
            \StrLen{\compactlogo}[\compactlogolength]
            \ifnum\compactlogolength>0
                \put(\headimgx,\heady-3pt){\includegraphics[height=32pt]{dare_logo_compact.png}}
                \put(\headimgx-100pt,\heady-4pt){\includegraphics[height=33pt]{\compactlogo}}
            \else
                \put(\headimgx-100pt,\heady-3pt){\includegraphics[height=32pt]{dare_logo.png}}
            \fi
        }
    }
    % Footer
    \fancyfoot[C]{\textcolor{gray}{\thepage}}
}

\setlength{\headheight}{33pt}
\fancypagestyle{appendix}
{
    \newgeometry{top=4cm,bottom=2cm,right=1.2cm,left=1.2cm}
    % Header
    \fancyhf{} % clear the headers
    {
        \ClearShipoutPicture
        \AddToShipoutPicture
    }
    % Footer
    \fancyfoot[C]{\textcolor{gray}{\thepage}}
    %\fancyhead[L]{\textcolor{black}{\leftmark\\\smallskip\textit{\rightmark\\}}}
}

%% ----------------------------------------------------------------------
%%    Setting up the \makecover command for the cover page
%% ----------------------------------------------------------------------

\newcommand\pagehazeopacity{0.2} % default: 0.85
\newcommand{\setpagehazeopacity}[1]{\renewcommand{\pagehazeopacity}{#1}}

\newcommand*{\makecover}{
    \begin{titlepage}
    
    % Background image
    \tikz[remember picture, overlay]
        \node[inner sep=0pt] at (current page.center){\includegraphics[width=\paperwidth, height=\paperheight]{\backgroundimage}};
    
    % Blue page haze
    \begin{tikzpicture}[remember picture, overlay]
        % Full page blue haze
        \node[shape=rectangle, fill=PAGE_HAZE_COLOR, opacity=\pagehazeopacity, minimum height=\paperheight, minimum width=\paperwidth, anchor=south west] at (current page.south west) {};
        % Fade between stronger and lighter haze
        \node[shape=rectangle, fill=PAGE_HAZE_COLOR, opacity=\pagehazeopacity-0.1, minimum height=0.4\paperheight, minimum width=\paperwidth, anchor=north west, path fading=south] at (current page.north west) {};
    \end{tikzpicture}
    
    % Main title
    \begin{tikzpicture}[remember picture, overlay]
        \node[inner sep=0pt, anchor=north west] at ([xshift=0.09\paperwidth, yshift=-0.07\paperheight]current page.north west){\LARGE\textcolor{AXO_RED}{\textmontserrat{\teamname}}};
        \node[draw=none, inner sep=0pt, anchor=north west, text width=0.8\paperwidth, align=flush left] at ([xshift=0.09\paperwidth, yshift=-0.1\paperheight]current page.north west){\Huge\textcolor{white}{\textbf{\textmontserrat{\title}}}};
    \end{tikzpicture}
    
    % Logos and patches
    \begin{tikzpicture}[remember picture, overlay]
        \node[inner sep=0pt, anchor=south west] at ([xshift=0.09\paperwidth, yshift=0.04\paperheight]current page.south west){\includegraphics[width=0.28\paperwidth]{dare_logo.png}};
        
        \StrLen{\compactlogo}[\compactlogolength]
        \ifnum\compactlogolength>0
            \node[inner sep=0pt, anchor=south west] at ([xshift=0.41\paperwidth, yshift=0.035\paperheight]current page.south west){\includegraphics[width=0.195\paperwidth]{\compactlogo}};
        \fi
        
        
        \StrLen{\missionpatch}[\missionpatchlength]
        \ifnum\missionpatchlength>0
            \node[inner sep=0pt, anchor=south east] at ([xshift=-0.05\paperwidth, yshift=0.03\paperheight]current page.south east){\includegraphics[width=0.29\paperwidth]{\missionpatch}};
    \end{tikzpicture}
    
    % Document info
    \begin{tikzpicture}[remember picture, overlay]
        \node[draw=none, inner sep=0pt, anchor=south west, text width=0.5\paperwidth, align=flush left] at ([xshift=0.09\paperwidth, yshift=0.18\paperheight]current page.south west){\Large\textcolor{TITLE_TEXT_COLOR}{\textmontserrat{\documentid}}};
        \node[draw=none, inner sep=0pt, anchor=south west, text width=0.5\paperwidth, align=flush left] at ([xshift=0.09\paperwidth, yshift=0.16\paperheight]current page.south west){\Large\textcolor{TITLE_TEXT_COLOR}{\textmontserrat{V\version}}};
        \node[draw=none, inner sep=0pt, anchor=south west, text width=0.5\paperwidth, align=flush left] at ([xshift=0.09\paperwidth, yshift=0.12\paperheight]current page.south west){\Large\textcolor{TITLE_TEXT_COLOR}{\textmontserrat{\reportdate}}};
    \end{tikzpicture}
    
    % Authors
    \begin{tikzpicture}[remember picture, overlay]
        % Dummy node which serves as anchor
        \StrLen{\missionpatch}[\missionpatchlength]
        \ifnum\missionpatchlength>0
            \node (A) [draw=none, inner sep=0pt, anchor=south east, text width=0.4\paperwidth, align=right] at ([xshift=-0.06\paperwidth, yshift=0.25\paperheight]current page.south east){\hspace*{\fill}~};
        \else
            \node (A) [draw=none, inner sep=0pt, anchor=south east, text width=0.4\paperwidth, align=right] at ([xshift=-0.06\paperwidth, yshift=0.04\paperheight]current page.south east){\hspace*{\fill}~};
        \fi
        
        % Reverse reviewer list (drawing from bottom up so last reviewer should be drawn first)
        \let\reversedreviewer\empty
        \foreach \x in \reviewer {
            \ifx\reversedreviewer\empty
                \xdef\reversedreviewer{{\x}}%
            \else
                \xdef\reversedreviewer{{\x}, \reversedreviewer}%
            \fi
        }
        
        % Draw the reviewers (leave out if no reviewers were set)
        \StrLen{\reviewer}[\reviewerlength]
        \ifnum\reviewerlength>0
            % Draw each reviewer
            \foreach \i in \reversedreviewer%
            {%
                \node (A) [inner sep=0pt, anchor=south east, text width=0.4\paperwidth, align=right] at ([yshift=0.5em]A.north east){\hspace*{\fill}~\large\textcolor{TITLE_TEXT_COLOR}{\textmontserrat{\i}}};%
            }%
            % Draw a 'Reviewed by' header
            \node (A) [inner sep=0pt, anchor=south east, text width=0.4\paperwidth, align=right] at ([yshift=0.7em]A.north east){\hspace*{\fill}~\Large\textcolor{TITLE_TEXT_COLOR}{\textmontserrat{\textbf{Reviewed by}}}};%
            % Create small spacing between reviewers and authors
            \node (A) [inner sep=0pt, anchor=south east, text width=0.4\paperwidth, align=right] at ([yshift=2em]A.north east){\hspace*{\fill}~};
        \fi
        
        % Reverse author list (drawing from bottom up so last author should be drawn first)
        \let\reversedauthor\empty
        \foreach \x in \author {
            \ifx\reversedauthor\empty
                \xdef\reversedauthor{{\x}}%
            \else
                \xdef\reversedauthor{{\x}, \reversedauthor}%
            \fi
        }
        
        % Draw each author
        \foreach \i in \reversedauthor
        {
            \node (A) [inner sep=0pt, anchor=south east, text width=0.4\paperwidth, align=right] at ([yshift=0.5em]A.north east){\hspace*{\fill}~\large\textcolor{TITLE_TEXT_COLOR}{\textmontserrat{\i}}};
        }
        
        % Draw 'Authors' title block
        \node (A) [inner sep=0pt, anchor=south east, text width=0.4\paperwidth, align=right] at ([yshift=0.7em]A.north east){\hspace*{\fill}~\Large\textcolor{TITLE_TEXT_COLOR}{\textmontserrat{\textbf{Authors}}}};
    \end{tikzpicture}

    \clearpage
    \end{titlepage}
}

%% ----------------------------------------------------------------------
%%    Setting up the nomenclature page format
%% ----------------------------------------------------------------------

\RequirePackage{nomencl}
\newlength{\nomitemorigsep}
\setlength{\nomitemorigsep}{\nomitemsep}
\setlength{\nomitemsep}{-\parsep}

% Create nomenclature format
\makenomenclature
\renewcommand\nomgroup[1]{%
  \itemsep\nomitemorigsep%
  \item[\bfseries\montserratfont
  \ifstrequal{#1}{C}{Constants}{%
  \ifstrequal{#1}{A}{Acronyms}{%
  \ifstrequal{#1}{G}{Greek Symbols}{%
  \ifstrequal{#1}{R}{Roman Symbols}{%
  }}}}%
  ]
  \itemsep\nomitemsep%
}
\newcommand{\nomunit}[1]{%
\renewcommand{\nomentryend}{\hspace*{\fill}#1}}