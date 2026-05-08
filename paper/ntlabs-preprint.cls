% =============================================================================
%  ntlabs-preprint.cls
%  NTLabs.dev Preprint Template
%  Author: Anderson Henrique da Silva
%  Version: 1.0.0 (2026-05-08)
% =============================================================================
%  Class for academic preprints published by NTLabs.dev (Neural Thinkers Lab
%  AI Engineering LTDA). Designed for Zenodo / arXiv deposits and convertible
%  to ACM acmart, IEEEtran, SBC and Springer LNCS templates by swapping only
%  the documentclass and author block.
%
%  Aligned with NTL Design System:
%    brand color   #0D1B2A (deep navy)
%    accent color  #C9A96E (sand gold)
%
%  Required packages (all in TeX Live full):
%    fontenc, inputenc, lmodern, helvet, geometry, microtype, xcolor,
%    hyperref, authblk, orcidlink, fancyhdr, titlesec, lastpage, graphicx
%
%  Usage:
%    \documentclass{ntlabs-preprint}
%    \title{...}
%    \author[1,2]{Anderson Henrique da Silva\,\orcidlink{0009-0001-7144-4974}}
%    \affil[1]{\href{https://ntlabs.dev}{NTLabs.dev}}
%    \affil[2]{IFSULDEMINAS, Minas Gerais, Brasil}
%    \affil[ ]{\href{mailto:anderson@ntlabs.dev}{anderson@ntlabs.dev}}
%    \ntlabsversion{v1.0.0}
%    \date{May 2026}
%    \begin{document}\maketitle ... \end{document}
% =============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntlabs-preprint}[2026/05/08 v1.0.0 NTLabs.dev Preprint]

% Inherit from article (broadly compatible with arXiv, Zenodo)
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[11pt,a4paper]{article}

% --- Encoding & fonts -------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}                 % serif body
\RequirePackage{helvet}                  % sans for headings (NTL DS: Helvetica)
\RequirePackage[scaled=0.9]{beramono}    % monospace for code/email/orcid
\RequirePackage{textcomp}                % extra text symbols
\RequirePackage{newunicodechar}          % map common Unicode glyphs

% Common Unicode glyphs in academic papers — let authors type them naturally
\newunicodechar{σ}{\ensuremath{\sigma}}
\newunicodechar{μ}{\ensuremath{\mu}}
\newunicodechar{α}{\ensuremath{\alpha}}
\newunicodechar{β}{\ensuremath{\beta}}
\newunicodechar{γ}{\ensuremath{\gamma}}
\newunicodechar{δ}{\ensuremath{\delta}}
\newunicodechar{ε}{\ensuremath{\varepsilon}}
\newunicodechar{θ}{\ensuremath{\theta}}
\newunicodechar{λ}{\ensuremath{\lambda}}
\newunicodechar{π}{\ensuremath{\pi}}
\newunicodechar{ρ}{\ensuremath{\rho}}
\newunicodechar{τ}{\ensuremath{\tau}}
\newunicodechar{φ}{\ensuremath{\varphi}}
\newunicodechar{ω}{\ensuremath{\omega}}
\newunicodechar{Σ}{\ensuremath{\Sigma}}
\newunicodechar{Ω}{\ensuremath{\Omega}}
\newunicodechar{×}{\ensuremath{\times}}
\newunicodechar{÷}{\ensuremath{\div}}
\newunicodechar{±}{\ensuremath{\pm}}
\newunicodechar{≤}{\ensuremath{\leq}}
\newunicodechar{≥}{\ensuremath{\geq}}
\newunicodechar{≈}{\ensuremath{\approx}}
\newunicodechar{≠}{\ensuremath{\neq}}
\newunicodechar{∞}{\ensuremath{\infty}}
\newunicodechar{→}{\ensuremath{\rightarrow}}
\newunicodechar{←}{\ensuremath{\leftarrow}}
\newunicodechar{⇒}{\ensuremath{\Rightarrow}}
\newunicodechar{⇐}{\ensuremath{\Leftarrow}}
\newunicodechar{∈}{\ensuremath{\in}}
\newunicodechar{∉}{\ensuremath{\notin}}
\newunicodechar{∀}{\ensuremath{\forall}}
\newunicodechar{∃}{\ensuremath{\exists}}
\newunicodechar{—}{---}                  % em-dash
\newunicodechar{–}{--}                   % en-dash
\newunicodechar{…}{\ldots}
\newunicodechar{“}{``}
\newunicodechar{”}{''}

% --- Layout -----------------------------------------------------------------
\RequirePackage[margin=1in,headheight=14pt,headsep=18pt]{geometry}
\RequirePackage{microtype}
\RequirePackage{graphicx}
\RequirePackage{lastpage}

% --- Palette (monochrome, sober academic) -----------------------------------
\RequirePackage{xcolor}
\definecolor{ntlabsbrand}{HTML}{000000}
\definecolor{ntlabsgray}{HTML}{555555}

% --- Hyperlinks (all black for print-friendly academic style) ---------------
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
  colorlinks  = true,
  linkcolor   = black,
  urlcolor    = black,
  citecolor   = black,
  filecolor   = black,
  pdfborder   = {0 0 0}
}

% --- Author block (multi-affiliation) and ORCID -----------------------------
\RequirePackage{authblk}
\renewcommand\Authfont{\normalsize}
\renewcommand\Affilfont{\small\itshape\color{ntlabsgray}}
\setlength\affilsep{0.4em}
\RequirePackage{orcidlink}

% --- Section styling (black, sans-serif headings) ---------------------------
\RequirePackage{titlesec}
\titleformat{\section}
  {\normalfont\sffamily\large\bfseries\color{black}}
  {\thesection}{0.6em}{}
\titleformat{\subsection}
  {\normalfont\sffamily\normalsize\bfseries\color{black}}
  {\thesubsection}{0.6em}{}
\titleformat{\subsubsection}
  {\normalfont\sffamily\normalsize\bfseries\color{black}}
  {\thesubsubsection}{0.6em}{}

% --- Title styling ----------------------------------------------------------
\renewcommand{\maketitle}{%
  \begingroup
    \begin{center}
      {\sffamily\bfseries\Large \@title \par}
      \vspace{0.7em}
      {\@author \par}
      \vspace{0.4em}
      {\small\color{ntlabsgray} \@date \ifx\@ntlabsversion\@empty\else\quad\textbullet\quad\@ntlabsversion\fi \par}
    \end{center}
    \vspace{1.4em}
  \endgroup
}

% --- Version metadata (optional) --------------------------------------------
\newcommand{\@ntlabsversion}{}
\newcommand{\ntlabsversion}[1]{\renewcommand{\@ntlabsversion}{#1}}

% --- Page header / footer (minimal, page number only) -----------------------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\small\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\AtBeginDocument{%
  \fancypagestyle{plain}{%
    \fancyhf{}%
    \fancyfoot[C]{\small\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
    \renewcommand{\footrulewidth}{0pt}%
  }%
}

% --- Abstract styling -------------------------------------------------------
\renewenvironment{abstract}{%
  \begin{center}\sffamily\bfseries Abstract\end{center}%
  \vspace{-0.4em}%
  \begin{quote}\small\noindent\ignorespaces
}{%
  \end{quote}%
  \vspace{0.8em}%
}

% --- Helper: keywords block -------------------------------------------------
\newcommand{\keywordsblock}[1]{%
  \vspace{0.3em}%
  \noindent\sffamily\small\textbf{Keywords:} \textit{#1}\par%
  \vspace{0.6em}%
  \rmfamily%
}

\endinput
