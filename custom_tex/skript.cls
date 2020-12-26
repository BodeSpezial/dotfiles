\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{skript}[2020/10/08 Custom school scripts]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{article}

\RequirePackage{amsmath}

\RequirePackage[sfdefault,lining]{FiraSans}
\RequirePackage[fakebold]{firamath-otf}
\renewcommand*\oldstylenums[1]{{\firaoldstyle #1}}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{units}
\RequirePackage{color}
\RequirePackage{mathrsfs}
\RequirePackage[ngerman]{babel}
\RequirePackage{ulem}
\RequirePackage{glossaries}
\RequirePackage{contour}


%% German name for the content overview
\renewcommand*\contentsname{Inhalt}

%% Nicer Underline
%% The underlne is directly under the word even and leaves space for letters like p or y
\renewcommand{\ULdepth}{1.8pt}
\contourlength{0.8pt}

\newcommand{\ul}[1]{%
  \uline{\phantom{#1}}%
  \llap{\contour{white}{#1}}%
}

%% Break after the beginning of a new paragraph or subparagraph
\newcommand{\para}[1]{
    \paragraph{#1} \hspace{0pt} \\
}

\newcommand{\subpara}[1]{
    \subparagraph{#1} \hspace{0pt} \\
}



\makeglossaries

\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setcounter{secnumdepth}{3}

