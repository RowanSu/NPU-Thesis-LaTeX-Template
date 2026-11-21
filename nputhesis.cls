%% NPU-Thesis-LaTeX-Template
%% 西北工业大学硕博士学位论文LaTeX模板
%% Copyright (C) 2026 by Wanshun Su
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, version 1.3c or any later version.
%% https://www.latex-project.org/lppl.txt
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{nputhesis}[2026/11/20 v2.1 NPU-Thesis-LaTeX-Template]
% -- 文档选项 --
\RequirePackage{xkeyval} %
\newif\if@npu@lang@chs %
\newif\if@npu@type@phd %
\newif\if@npu@type@mst %
\newif\if@npu@type@bcl %
\newif\if@npu@academic %
\newif\if@npu@output@blindreview %
\def\set@lang@chs{\@npu@lang@chstrue} %
\def\set@lang@eng{\@npu@lang@chsfalse} %
\def\set@type@phd{\@npu@type@phdtrue\@npu@type@mstfalse\@npu@type@bclfalse}
\def\set@type@master{\@npu@type@phdfalse\@npu@type@msttrue\@npu@type@bclfalse}
\def\set@type@bachelor{\@npu@type@phdfalse\@npu@type@mstfalse\@npu@type@bcltrue}
\DeclareOptionX{lang}[chs]{\csname set@lang@#1\endcsname}
\DeclareOptionX{degree}[phd]{\csname set@type@#1\endcsname}
\DeclareOptionX{blindreview}[true]{\csname @npu@output@blindreview#1\endcsname}
\DeclareOptionX{adobe}[true]{\csname @npu@font@adobe#1\endcsname}
\DeclareOptionX{winfonts}[true]{\csname @npu@font@winfonts#1\endcsname}
\DeclareOptionX{academic}[true]{\csname @npu@academic#1\endcsname}
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{book}} %
\ExecuteOptionsX{lang=chs} %
\ExecuteOptionsX{degree=phd} %
\ExecuteOptionsX{academic=true} %
\ExecuteOptionsX{blindreview=false} %
\ProcessOptionsX \relax %
\let\@unusedoptionlist\@empty
\LoadClass[11pt, a4paper, openright, twoside]{book} % 正文各部分从奇数页开始
\RequirePackage{etoolbox} %
\RequirePackage{amssymb} %
% -- 盲评处理 --
\newcommand\@npu@replaceitwithblank[1]{{\setlength{%
                \fboxsep}{0pt}\colorbox{white}{\phantom{#1}}}}
\newcommand\@npu@replaceitwithblack[1]{{\setlength{%
                \fboxsep}{0pt}\colorbox{black}{\phantom{#1}}}}
\newcommand\@npu@replaceitwithstars{ *** } %
\newcommand{\blindreview}[1]{\if@npu@output@blindreview%
        \@npu@replaceitwithblank{#1}\relax\else #1\fi} %
\newcommand{\blackbox}[1]{\if@npu@output@blindreview%
        \@npu@replaceitwithblack{#1}\relax\else #1\fi} %
\newcommand{\markname}[1]{\if@npu@output@blindreview%
        \@npu@replaceitwithstars\relax\else #1\fi} %
% -- 页面布局 --
\RequirePackage{geometry} %
% 页眉盒与正文边界由 geometry 一次计算，页脚基线距纸边 17.5 mm。
\geometry{a4paper, %
    left=2.5cm, right=2.5cm, top=2.54cm, bottom=2.54cm, %
    headheight=25pt, headsep=\dimexpr10.4mm-25pt\relax, footskip=7.9mm} %
\RequirePackage[ %
    unicode=true, %
    colorlinks=false, %
    pdfborder={0 0 0}]{hyperref} %
\hypersetup{ %
    pdftoolbar=true, %
    pdfmenubar=true, %
    pdffitwindow=true, %
    pdfstartview={FitH}, %
    pdfnewwindow=true, %
} %
\RequirePackage{bookmark} %
% 字号与基线间距
\RequirePackage{type1cm} %
\newcommand{\sChuhao}{\fontsize{42pt}{63pt}\selectfont} % 初号，1.5 倍
\newcommand{\sYihao}{\fontsize{26pt}{36pt}\selectfont} % 一号，1.4 倍
\newcommand{\sErhao}{\fontsize{22pt}{28pt}\selectfont} % 二号，1.25 倍
\newcommand{\sXiaoer}{\fontsize{18pt}{18pt}\selectfont} % 小二，单倍
\newcommand{\sSanhao}{\fontsize{16pt}{24pt}\selectfont} % 三号，1.5 倍
\newcommand{\sSanhaoFixed}{\fontsize{16bp}{20bp}\selectfont} % 三号，固定行距 20 磅
\newcommand{\sXiaosan}{\fontsize{15pt}{22pt}\selectfont} % 小三，1.5 倍
\newcommand{\sSihao}{\fontsize{14pt}{21pt}\selectfont} % 四号，1.5 倍
\newcommand{\sSihaoFixed}{\fontsize{14bp}{20bp}\selectfont} % 四号，固定行距 20 磅
\newcommand{\sHgXiaosi}{\fontsize{13pt}{19pt}\selectfont} % 半小四，1.5 倍
\newcommand{\sLgXiaosi}{\fontsize{12.5pt}{13pt}\selectfont} % 半小四，约 1 倍
\newcommand{\sXiaosi}{\fontsize{12pt}{14.4pt}\selectfont} % 小四，1.2 倍
\newcommand{\sXiaosiFixed}{\fontsize{12bp}{20bp}\selectfont} % 小四，固定行距 20 磅
\newcommand{\sLargeWuhao}{\fontsize{11pt}{11pt}\selectfont} % 大五，单倍
\newcommand{\sWuhao}{\fontsize{10.5pt}{10.5pt}\selectfont} % 五号，单倍
\newcommand{\sXiaowu}{\fontsize{9pt}{9pt}\selectfont} % 小五，单倍
\newcommand{\sDefault}{\fontsize{12bp}{20bp}\selectfont} % 小四，固定行距 20 磅
% 字体：中文字体从 fonts/ 加载；西文字体使用系统 Times New Roman。
\newcommand\defaultSog{simsun.ttc} %
\newcommand\defaultHei{simhei.ttf} %
\newcommand\defaultKai{simkai.ttf} %
\newcommand\defaultFag{simfang.ttf} %
\newcommand\defaultEngFont{Times New Roman} %
\newcommand\defaultEngSansFont{\defaultHei} %
\newcommand\codeFont{consola.ttf} %
\RequirePackage{fontspec} %
\RequirePackage[SlantFont, BoldFont, CJKchecksingle, CJKspace=false]{xeCJK} %
\setCJKmainfont[Path=fonts/, ItalicFont=\defaultKai, AutoFakeBold]{\defaultSog}
\setCJKsansfont[Path=fonts/, ItalicFont=\defaultKai, AutoFakeBold]{\defaultSog}
\setCJKmonofont[Path=fonts/, ItalicFont=\defaultKai, AutoFakeBold]{\defaultSog}
\setCJKfamilyfont{song}[Path=fonts/]{\defaultSog}
\setCJKfamilyfont{hei}[Path=fonts/]{\defaultHei}
\setCJKfamilyfont{kai}[Path=fonts/]{\defaultKai}
\setCJKfamilyfont{fang}[Path=fonts/]{\defaultFag}
\setCJKfamilyfont{eng}{\defaultEngFont} %
\setsansfont[Path=fonts/]{\defaultEngSansFont}
\setmonofont[Path=fonts/, BoldFont=\codeFont, ItalicFont=\codeFont, BoldItalicFont=\codeFont]{\codeFont}
\newcommand{\fSong}{\CJKfamily{song}} %
\newcommand{\fHei}{\CJKfamily{hei}} %
\newcommand{\fKai}{\CJKfamily{kai}} %
\newcommand{\fFang}{\CJKfamily{fang}} %
\newcommand{\fEng}{\CJKfamily{eng}} %
\setmainfont{\defaultEngFont} %
\newfontfamily\chapnumfont{Times New Roman} %
\newcommand{\chapnum}{\chapnumfont\thechapter} %
\XeTeXlinebreaklocale "zh" %
\XeTeXlinebreakskip = 0pt plus 1pt %
% 段落与行距
\RequirePackage{indentfirst} %
\setlength\parindent{24pt} %
\setlength\parskip{0pt} %
\renewcommand{\baselinestretch}{1.0} %
% 封面信息下划线
\RequirePackage{ulem} %
\newcommand\dlmu@underline[2][5cm]{\hspace{1pt}\underline{ %
        \hb@xt@ #1{\hss#2\hss}}\hspace{3pt}} %
\let\coverunderline\dlmu@underline %
% 章节标题与目录层级
\RequirePackage[sf]{titlesec} %
\RequirePackage[rigidseps]{titletoc} %
\setcounter{secnumdepth}{3} %
\titleformat{\chapter}[hang]%
  {\normalfont\sSanhaoFixed\filcenter\fHei}%
  {\sffamily\fHei\sSanhaoFixed{第\chapnum 章}}%
  {20pt}%
  {\sSanhaoFixed}[\vspace{15.6bp}] % 标题段后 0；另留一行（指南样例网格行距 15.6 磅）
\titleformat{\section}[hang]%
  {\fHei\sSihaoFixed}%
  {\sffamily\fHei\sSihaoFixed\textrm{\thesection}}%
  {0.5em}%
  {}
\titleformat{\subsection}[hang]%
  {\normalfont\fHei\sXiaosiFixed}%
  {\fHei\sXiaosiFixed\textrm{\thesubsection}}%
  {0.5em}%
  {}
\titleformat{\subsubsection}[hang]%
  {\fHei}%
  {\textrm{(\arabic{subsubsection})}}%
  {0.5em}%
  {}
\titlespacing{\chapter}{0pt}{25.6bp}{0pt} % 标题前一空行 15.6bp 加段前半行 10bp；段后零行
\titlespacing{\section}{0pt}{10bp}{0pt} % 段前半行，段后零行
\titlespacing{\subsection}{0pt}{10bp}{0pt} % 段前半行，段后零行
\titlespacing{\subsubsection}{0pt}{0.25em}{0pt} %
\titlespacing{\paragraph}{0pt}{0.25em}{0pt} %
% 左边距包含编号盒宽度；编号起点逐级缩进两个字宽。
\dottedcontents{section}[3.8em]{}{1.8em}{5pt} %
\dottedcontents{subsection}[6.7em]{}{2.7em}{5pt} %
\dottedcontents{subsubsection}[9.4em]{}{3.4em}{5pt} %
\newcommand{\nwpu@chs@chaptercname}[1]{第 #1 章} %
\newcommand{\nwpu@eng@chaptercname}[1]{Chapter #1} %
\if@npu@lang@chs %
    \titlecontents{chapter}[0pt]{\fSong\sXiaosiFixed}{\contentsmargin{0pt}\fSong\makebox[0pt %
        ][l]{\nwpu@chs@chaptercname{\thecontentslabel}}\hspace{%
            3.5em}}{\contentsmargin{0pt}\fSong}{\titlerule*[%
            .5pc]{.}\contentspage}[\vspace{0em}] %
\else %
    \newlength{\contents@titlewidth} %
    \settowidth{\contents@titlewidth}{\sXiaosiFixed Chapter 000}%
    \titlecontents{chapter}[0pt]{\fSong\sXiaosiFixed}{\contentsmargin{0pt}\fSong\makebox[0pt %
        ][l]{\nwpu@eng@chaptercname{\thecontentslabel}}\hspace{%
            \contents@titlewidth}}{\contentsmargin{0pt}\fSong}{
        \titlerule*[.5pc]{.}\contentspage}[\vspace{0em}] %
\fi %
% 页眉与页脚
\RequirePackage{fancyhdr} %
\RequirePackage{fancyref} %
\newcommand{\npu@headrule}{ %
    \rlap{\rule[.7\baselineskip]{\headwidth}{3.4pt}} %
    \vspace{-1.07\baselineskip} %
    \rule[.5\baselineskip]{\headwidth}{0.6pt} %
    \vspace{-.8\baselineskip} %
} %
\renewcommand{\headrule}{ %
    \if@fancyplain\let\headrulewidth\plainheadrulewidth\fi %
    \npu@headrule %
} %
\if@npu@lang@chs %
    \renewcommand{\chaptermark}[1]{ %
        \markboth{\nwpu@chs@chaptercname\thechapter~~ #1}{}}%
\else %
    \renewcommand{\chaptermark}[1]{ %
        \markboth{\nwpu@eng@chaptercname\thechapter~~ #1}{}}%
\fi %
\pagestyle{fancyplain} %
\fancyhf{} %
\fancyfoot[C, C]{{\rmfamily\fontsize{9bp}{9bp}\selectfont\thepage}} % Times New Roman，小五号
\fancyhead{} %
\fancyhead[COH]{\sXiaowu{\leftmark}} %
\if@npu@lang@chs %
    \fancyhead[CEH]{\sXiaowu{\nwpu@chs@header}} %
\else %
    \fancyhead[CEH]{\sXiaowu{\nwpu@eng@header}} %
\fi %
% 参考文献引用采用数字上标。
\RequirePackage[numbers, sort&compress]{natbib} %
\let\oldcite\cite %
\renewcommand{\cite}[1]{\textsuperscript{\oldcite{#1}}} %
% 列表间距
\RequirePackage{enumerate} %
\RequirePackage{enumitem} %
\setlist{nosep} %
\setlist{noitemsep} %
\setlist{nolistsep} %
% 图表、题注与表格样式
\RequirePackage{graphicx} %
\RequirePackage[final]{pdfpages} %
\RequirePackage{xcolor} %
\RequirePackage{tikz} %
\RequirePackage[labelsep=quad]{caption} %
\RequirePackage{subcaption} %
\RequirePackage{wrapfig} %
\RequirePackage{multirow, makecell} %
\RequirePackage{longtable} %
\RequirePackage{booktabs} %
\RequirePackage{tabularx} %
\RequirePackage{setspace} %
\RequirePackage{ragged2e} %
\DeclareCaptionFont{cWuhao}{\fontsize{10.5bp}{20bp}\selectfont} %
\captionsetup[table]{font=cWuhao, aboveskip=10pt, belowskip=0pt}
\captionsetup[figure]{font=cWuhao, aboveskip=10pt, belowskip=0pt}
\captionsetup[subtable]{labelformat=simple, aboveskip=10pt, belowskip=-5pt}
\captionsetup[subfigure]{labelformat=simple, aboveskip=10pt, belowskip=-5pt}
\AtBeginEnvironment{tabular}{\sWuhao} %
\AtBeginEnvironment{tabularx}{\sWuhao} %
\newcolumntype{C}{>{\centering\arraybackslash}X} %
\newcolumntype{L}{>{\raggedright\arraybackslash}X} %
\newcolumntype{R}{>{\raggedleft\arraybackslash}X} %
\newcolumntype{Q}[1]{>{\raggedleft\let\newline\\%
        \arraybackslash\hspace{0pt}}p{#1}} %
\newcolumntype{O}[1]{>{\centering\let\newline\\%
        \arraybackslash\hspace{0pt}}p{#1}} %
\newcolumntype{P}[1]{>{\raggedright\let\newline\\%
        \arraybackslash\hspace{0pt}}p{#1}} %
\renewcommand{\arraystretch}{1.4} %
\setlength\heavyrulewidth{1.5pt} %
\setlength\lightrulewidth{1pt} %
% 定理与证明环境
\RequirePackage[thmmarks]{ntheorem} %
\theorembodyfont{\normalfont\itshape} %
\theoremseparator{\quad} %
\setlength\topsep{0pt} %
\theorempreskip{0pt} %
\theorempostskip{0pt} %
\def\thm@space@setup{ %
    \thm@preskip=0pt %
    \thm@postskip=0pt} %
\AtBeginDocument{ %
    \setlength{\abovedisplayskip}{0pt} %
    \setlength{\belowdisplayskip}{0pt} %
    \setlength{\abovedisplayshortskip}{0pt} %
    \setlength{\belowdisplayshortskip}{0pt}} %
{\theoremsymbol{\ensuremath{\square}} %
    \if@npu@lang@chs\newtheorem*{proof}{证明}\else\newtheorem*{proof}{Proof}\fi}
\newcommand{\qedinEquation}{{\rlap{$\qquad\square$}}} %
\if@npu@lang@chs %
    \newtheorem{theorem}{定理}[chapter] %
    \newtheorem{axiom}[theorem]{公理} %
    \newtheorem{corollary}[theorem]{推论} %
    \newtheorem{lemma}[theorem]{引理} %
    \newtheorem{definition}[theorem]{定义} %
    \newtheorem{example}[theorem]{例} %
    \newtheorem{proposition}[theorem]{命题} %
\else %
    \newtheorem{theorem}{Theorem}[chapter] %
    \newtheorem{axiom}[theorem]{Axiom} %
    \newtheorem{corollary}[theorem]{Corollary} %
    \newtheorem{lemma}[theorem]{Lemma} %
    \newtheorem{definition}[theorem]{Definition} %
    \newtheorem{example}[theorem]{Example} %
    \newtheorem{proposition}[theorem]{Proposition} %
\fi %
% 代码清单
\RequirePackage{listings} %
\lstset{ %
    basicstyle=\color[HTML]{000000}\small\ttfamily, %
    numbers=left, %
    xleftmargin=1.5em, %
    numberstyle=\tiny, %
    numbersep=5pt, %
    tabsize=4, %
    extendedchars=true, %
    breaklines=true, %
    keywordstyle=\color[HTML]{0000FF}\bfseries, %
    numberstyle=\color[HTML]{ff8000}, %
    commentstyle=\color[HTML]{008000}\bfseries, %
    stringstyle=\color[HTML]{A31515}\ttfamily, %
    showspaces=false, %
    showtabs=false, %
    frame=shadowbox, %
    framexrightmargin=5pt, %
    framexbottommargin=4pt, %
    rulesepcolor=\color[HTML]{C0C0C0}, %
    showstringspaces=false, %
    escapeinside=`', %
} %
\lstloadlanguages{C++, Java, Python, Matlab, R, Mathematica}%
% 算法与伪代码
\RequirePackage{algorithm} %
\RequirePackage{algpseudocode} %
\RequirePackage{appendix} %
% 符号表采用单栏布局。
\RequirePackage[intoc]{nomencl} %
\RequirePackage{multicol} %
\makenomenclature %
\@ifundefined{chapter}{\def\npu@nomsec{section}}{\def\npu@nomsec{chapter}}
\def\thenomenclature{%
    \csname\npu@nomsec\endcsname*{\nomname}
    \markboth{\nomname}{\nomname}%
    \if@intoc\addcontentsline{toc}{\npu@nomsec}{\nomname}\fi
    \nompreamble %
    \list{}{\labelsep=15pt\labelwidth\nom@tempdim\leftmargin\labelwidth\advance
        \leftmargin\labelsep\itemsep\nomitemsep\let\makelabel\nomlabel}%
}
\def\endthenomenclature{\endlist
    \nompostamble}
% -- 交叉引用与本地化 --
\if@npu@lang@chs %
    \renewcommand{\figurename}{图} %
    \renewcommand{\figureautorefname}{图} %
    \renewcommand{\tablename}{表} %
    \renewcommand{\tableautorefname}{表} %
    \renewcommand{\bibname}{参考文献} %
    \renewcommand{\contentsname}{\texorpdfstring{目{\quad}录}{目录}}
    \renewcommand{\listfigurename}{插图目录} %
    \renewcommand{\listtablename}{附表目录} %
    \renewcommand{\appendixautorefname}{附录} %
    \def\equationautorefname#1#2\null{式#1(#2\null)} %
    \def\sectionautorefname#1#2\null{#2\null{ }节} %
    \def\subsectionautorefname#1#2\null{#2\null{ }小节} %
    \renewcommand{\theoremautorefname}{定理} %
    \newcommand{\axiomautorefname}{公理} %
    \newcommand{\corollaryautorefname}{推论} %
    \newcommand{\lemmaautorefname}{引理} %
    \newcommand{\definitionautorefname}{定义} %
    \newcommand{\exampleautorefname}{例} %
    \newcommand{\propositionautorefname}{命题} %
    \newcommand{\algorithmname}{算法} %
    \newcommand{\algorithmautorefname}{算法} %
    \floatname{algorithm}{算法} %
    \renewcommand{\lstlistingname}{代码片段} %
    \newcommand{\lstlistingautorefname}{代码片段} %
    \renewcommand{\nomname}{符号表} %
\else %
    \renewcommand{\figureautorefname}{Fig.} %
    \renewcommand{\tableautorefname}{Table} %
    \def\equationautorefname#1#2\null{Eq.#1(#2\null)} %
    \renewcommand{\lstlistingname}{Code Snippet} %
    \newcommand{\lstlistingautorefname}{Code Snippet} %
    \renewcommand{\nomname}{Symbols} %
\fi %
% 图、表和公式按“章号-序号”编号；定理与算法使用点号。
\renewcommand{\thefigure}{\thechapter-\arabic{figure}} %
\renewcommand{\thesubfigure}{(\alph{subfigure})} %
\renewcommand{\thetable}{\thechapter-\arabic{table}} %
\renewcommand{\thealgorithm}{\thechapter.\arabic{algorithm}}%
\@addtoreset{algorithm}{chapter} %
\renewcommand{\theequation}{\thechapter-\arabic{equation}} %
\renewcommand{\thetheorem}{\thechapter.\arabic{theorem}} %
\renewcommand{\theaxiom}{\thechapter.\arabic{axiom}} %
\renewcommand{\thecorollary}{\thechapter.\arabic{corollary}}%
\renewcommand{\thelemma}{\thechapter.\arabic{lemma}} %
\renewcommand{\thedefinition}{\thechapter.\arabic{definition}} %
\renewcommand{\theexample}{\thechapter.\arabic{example}} %
% 学校、学位与页眉文本
\newcommand{\nwpu@chs@schoolname}{西北工业大学} %
\newcommand{\nwpu@eng@schoolname}{Northwestern Polytechnical University}
\if@npu@type@phd %
    \newcommand{\nwpu@chs@degree}{博士} %
    \newcommand{\nwpu@eng@degree}{Doctor} %
\fi %
\if@npu@type@mst %
    \newcommand{\nwpu@chs@degree}{硕士} %
    \newcommand{\nwpu@eng@degree}{Master} %
\fi %
\if@npu@type@bcl %
    \newcommand{\nwpu@chs@degree}{学士} %
    \newcommand{\nwpu@eng@degree}{Bachelor} %
\fi %
\if@npu@type@bcl %
    \newcommand{\nwpu@chs@doctitle}{本科毕业设计论文} %
    \newcommand{\nwpu@chs@header}{{\nwpu@chs@schoolname}本科毕业设计论文}
\else %
    \newcommand{\nwpu@chs@doctitle}{{\nwpu@chs@degree}学位论文}
    \newcommand{\nwpu@chs@header}{\nwpu@chs@schoolname\nwpu@chs@doctitle}
\fi %
\if@npu@academic %
	\newcommand{\nwpu@chs@innerCoverFirstOption}{学科专业} %
	\newcommand{\nwpu@chs@outerCoverFirstOption}{学{\enspace}科{\enspace}专{\enspace}业}
\else
	\newcommand{\nwpu@chs@innerCoverFirstOption}{专业领域} %
	\newcommand{\nwpu@chs@outerCoverFirstOption}{专{\enspace}业{\enspace}领{\enspace}域}
\fi
\newcommand{\nwpu@eng@doctitle}{\nwpu@eng@degree Thesis} %
\newcommand{\nwpu@eng@header}{\nwpu@eng@doctitle of \nwpu@eng@schoolname}

\if@npu@lang@chs %
    \newcommand{\nwpu@page@ack}{\texorpdfstring{致{\quad}谢}{致谢}}
    \newcommand{\nwpu@page@acp}{在学期间取得的学术成果和参加%
        科研情况} %
\else %
    \newcommand{\nwpu@page@ack}{Acknowledgements} %
    \newcommand{\nwpu@page@acp}{Published Papers and %
        Participated in Scientific Research During the Study%
        for \nwpu@eng@degree Degree} %
\fi %
% -- 标点与论文信息接口 --
\newcommand{\chs@colon}{\char"FF1A} % 中文冒号
\newcommand{\chs@space}{\char"3000} % 全角空格
\newcommand{\chs@period}{\char"3002} % 中文句号
\newcommand{\chs@question}{\char"FF1F} % 中文问号
\newcommand{\chs@exclamation}{\char"FF01} % 中文感叹号
\newcommand{\chs@comma}{\char"FF0C} % 中文逗号
\newcommand{\chs@semicolon}{\char"FF1B} % 中文分号
\newcommand{\chs@leftparenthesis}{\char"FF08} % 左括号
\newcommand{\chs@rightparenthesis}{\char"FF09} % 右括号
\newcommand{\nwpu@chs@title}{\chs@space} %
\newcommand{\nwpu@chs@author}{\chs@space} %
\newcommand{\nwpu@chs@date}{\chs@space} %
\newcommand{\nwpu@chs@school}{\chs@space} %
\newcommand{\nwpu@chs@major}{\chs@space} %
\newcommand{\nwpu@chs@advisor}{\chs@space} %
\newcommand{\nwpu@chs@advisorAcademicRank}{\chs@space} %
\newcommand{\nwpu@chs@funding}{\chs@space} %
\newcommand{\nwpu@eng@title}{\chs@space} %
\newcommand{\nwpu@eng@author}{\chs@space} %
\newcommand{\nwpu@eng@date}{\chs@space} %
\newcommand{\nwpu@eng@school}{\chs@space} %
\newcommand{\nwpu@eng@major}{\chs@space} %
\newcommand{\nwpu@eng@advisor}{\chs@space} %
\newcommand{\nwpu@eng@advisorAcademicRank}{\chs@space} %
\newcommand{\nwpu@eng@funding}{\chs@space} %
\newcommand{\nwpu@uid}{2000123456} %
\newcommand{\nwpu@classification}{} % 分类号由作者填写
\newcommand{\nwpu@secrecy}{公开} % 非涉密论文默认公开
\newcommand{\nwpu@funding}{\chs@space} %
% 双语信息接口：第一个参数为中文，第二个参数为英文。
\renewcommand{\title}[2]{ %
    \renewcommand{\nwpu@chs@title}{#1} %
    \renewcommand{\nwpu@eng@title}{#2} %
} %
\renewcommand{\author}[2]{ %
    \renewcommand{\nwpu@chs@author}{#1} %
    \renewcommand{\nwpu@eng@author}{#2} %
} %
\renewcommand{\date}[2]{ %
    \renewcommand{\nwpu@chs@date}{#1} %
    \renewcommand{\nwpu@eng@date}{#2} %
} %
\newcommand{\school}[2]{ % 设置学院
    \renewcommand{\nwpu@chs@school}{#1} %
    \renewcommand{\nwpu@eng@school}{#2} %
} %
\newcommand{\major}[2]{ %
    \renewcommand{\nwpu@chs@major}{#1} %
    \renewcommand{\nwpu@eng@major}{#2} %
} %
\newcommand{\advisor}[2]{ %
    \renewcommand{\nwpu@chs@advisor}{#1} %
    \renewcommand{\nwpu@eng@advisor}{#2} %
} %
\newcommand{\advisorAcademicRank}[2]{ %
	\renewcommand{\nwpu@chs@advisorAcademicRank}{#1} %
	\renewcommand{\nwpu@eng@advisorAcademicRank}{#2} %
}
\newcommand{\funding}[2]{ %
    \renewcommand{\nwpu@chs@funding}{#1} %
    \renewcommand{\nwpu@eng@funding}{#2} %
} %
\newcommand{\studentnumber}[1]{\renewcommand{\nwpu@uid}{#1}}% 设置学号
\newcommand{\classification}[1]{\renewcommand{\nwpu@classification}{#1}} % 分类号
\newcommand{\secrecy}[1]{\renewcommand{\nwpu@secrecy}{#1}} % 密级
% -- 封皮页 --
\newcommand{\make@nwpu@coverpage}{ %
    \thispagestyle{empty} %
    \newlength{\coverpage@infowidth} %
    \settowidth{\coverpage@infowidth}{\sWuhao 学校代码~:~ 2000000000}
    \newlength{\coverpage@detailwidth} %
    \settowidth{\coverpage@detailwidth}{\sSanhao 申请学位日期}
    \begin{titlepage} %
        \bfseries %
        \renewcommand{\baselinestretch}{1.25} %
        \begin{center} %
            \hfill \fHei \sWuhao %
            \begin{minipage}{\coverpage@infowidth} %
                \vspace{.5cm} %
                \renewcommand\arraystretch{1.2} %
                \begin{tabular}{|c|c|}\hline %
                    {学 \hfill 校 \hfill 代 \hfill 码} & 10699     \\ \hline
                    {分   \hfill    类    \hfill   号} & \nwpu@classification \\ \hline
                    {密           \hfill           级} & \nwpu@secrecy \\ \hline
                    {学           \hfill           号} & \nwpu@uid \\ \hline
                \end{tabular} %
            \end{minipage} \par %
            \vspace{21\baselineskip} %
            \fSong \sErhao \begin{minipage}[t]{2cm} %
                \hfill {\fHei \sErhao 题目} \\ %
            \end{minipage} %
            \fHei \sErhao \setbox123=\hbox{ %
                \begin{minipage}[t]{12cm} %
                    \begin{center} \nwpu@chs@title \end{center}
                \end{minipage} %
            } %
            \setbox124=\hbox{ %
                \begin{minipage}[t]{12cm} %
                    \begin{center} %
                        \uline{\hfill\quad\hfill} \\ %
                        \uline{\hfill\quad\hfill} \\ %
                    \end{center} %
                \end{minipage} %
            } %
            \hspace{-0.5cm} %
            \copy123\kern-\wd123\box124\par %
            \sWuhao \vspace{3\baselineskip} %
            \sSanhao \fSong \begin{minipage}{5cm} %
                {\bf 作者} \uline{\hfill \bf \nwpu@chs@author \hfill}
            \end{minipage} \par %
            \sWuhao \vspace{4\baselineskip} %
            \sSanhao \fSong \begin{minipage}{12.5cm} %
                \noindent %
                \makebox[\coverpage@detailwidth][s]{ %
                \bf \nwpu@chs@outerCoverFirstOption}{%
                \uline{\hfill \makebox{\bf \nwpu@chs@major} \hfill}} \par
                \makebox[\coverpage@detailwidth][s]{ %
                \bf 指{\enspace}导{\enspace}教{\enspace}师}{%
                \uline{\hfill \makebox{\bf \nwpu@chs@advisor\nwpu@chs@advisorAcademicRank} \hfill}} \par
                \makebox[\coverpage@detailwidth][s]{ %
                \bf 培{\enspace}养{\enspace}单{\enspace}位}{%
                \uline{\hfill \makebox{\bf \nwpu@chs@school} \hfill}} \par
                \makebox[\coverpage@detailwidth][s]{ %
                \bf 申{\enspace}请{\enspace}日{\enspace}期}{%
                \uline{\hfill \makebox{\bf \nwpu@chs@date} \hfill}}
            \end{minipage} %
            \vspace{2.5\baselineskip} %
        \end{center} %
    \end{titlepage} \fSong \normalsize \newpage \clearpage %
} %
% -- 中文标题页 --
\newcommand{\make@nwpu@chs@title}{ %
    \thispagestyle{empty} %
    \newlength{\chstitle@hwidtha} %
    \settowidth{\chstitle@hwidtha}{\sSanhao\nwpu@chs@schoolname}
    \newlength{\chstitle@hwidthb} %
    \settowidth{\chstitle@hwidthb}{\sYihao\nwpu@chs@doctitle}
    \begin{titlepage} %
        \renewcommand{\baselinestretch}{1.5} %
        \fSong \sSanhao \par \vspace*{12bp} % 页首段落合计约 48bp，接近指南的空行高度
        \begin{center} %
            \makebox[1.41667\chstitle@hwidtha][s]{\sSanhao\nwpu@chs@schoolname} \par
            \vspace*{5mm} %
            \makebox[1.41667\chstitle@hwidthb][s]{\sYihao\nwpu@chs@doctitle} \par
            \vspace*{5mm} %
            \sSihao \par \vspace{4\baselineskip} %
            \fSong \sErhao %
            \begin{minipage}[t]{2cm} \hfill {题目：} \\ \end{minipage}
            \setbox123=\hbox{ %
                \begin{minipage}[t]{12cm} %
                    \begin{center} \nwpu@chs@title \end{center}
                \end{minipage} %
            } %
            \setbox124=\hbox{ %
                \begin{minipage}[t]{12cm} %
                    \begin{center} %
                        \uline{\hfill\quad\hfill} \\ %
                        \uline{\hfill\quad\hfill} \\ %
                    \end{center} %
                \end{minipage} %
            } %
            \hspace{-1cm} %
            \copy123\kern-\wd123\box124 \fSong \sWuhao \par %
            \vspace{7\baselineskip} %
            \sSanhao \nwpu@chs@innerCoverFirstOption：\coverunderline[5.5cm]{\nwpu@chs@major} \\
            \sSanhao 作{\qquad}者：\coverunderline[5.5cm]{\nwpu@chs@author} \\
            \sSanhao 指导教师：\coverunderline[5.5cm]{\nwpu@chs@advisor} \\
            \fSong \sWuhao \par %
            \vspace{2\baselineskip} %
            \fSong \sSanhao \nwpu@chs@date %
        \end{center} %
    \end{titlepage} \fSong \normalsize \newpage \clearpage %
} %
% -- 英文标题页 --
\newcommand{\make@nwpu@eng@title}{ %
    \thispagestyle{empty} %
    \begin{titlepage} %
        \rmfamily \linespread{1.2}\fontsize{15bp}{15bp}\selectfont \par %
        \vspace*{3\baselineskip} %
        \begin{center} %
            {\fontsize{16bp}{16bp}\selectfont
             {\fontsize{22bp}{22bp}\selectfont\bfseries Title:}\enspace
             \ignorespaces\nwpu@eng@title\par} %
            \vspace{4\baselineskip} %
            \textbf{By} \\ %
            \nwpu@eng@author \\ %
            \textbf{Under the Supervision of \nwpu@eng@advisorAcademicRank} \\
            \nwpu@eng@advisor \par %
            \vspace{5\baselineskip} %
            A Dissertation Submitted to \\ %
            \nwpu@eng@schoolname \par %
            \vspace{1\baselineskip} %
            In Partial Fulfillment of The Requirement \\
            For The Degree of \\ %
            {\nwpu@eng@degree} of \nwpu@eng@major \par %
            \vspace{7\baselineskip} %
            Xi'an P. R. China \\ %
            \nwpu@eng@date %
        \end{center} %
    \end{titlepage} \fSong \normalsize \newpage %
    \thispagestyle{empty} \cleardoublepage %
} %
% -- 生成标题页 --
\renewcommand{\maketitle}{ %
    \make@nwpu@coverpage %
    \make@nwpu@chs@title %
    \make@nwpu@eng@title %
} %
% -- 评阅人与答辩委员会 --
\catcode `\@ = 11\relax
\def\npu@replicate#1{\expandafter\npu@replicate@aux\romannumeral\number #1000Q{}}
\def\npu@replicate@aux#1{\csname npu@replicate@aux@#1\endcsname}
\long\def\npu@replicate@aux@m#1Q#2#3{\npu@replicate@aux#1Q{#2#3}{#3}}
\long\def\npu@replicate@aux@Q#1#2{#1}
\newcommand{\npu@text}[1]{\linespread{1}\sDefault{#1}}
\newcommand{\expert}[3]{\npu@text{#1} & \npu@text{#2} & \npu@text{#3} \\ }
\newcommand{\expertBlindReview}{\expert{全盲评阅}{无}{无}}
\newcommand{\fullBlindReview}[1]{\npu@replicate{#1}{\expertBlindReview}}
\newcommand{\defenseDate}[1]{\sDefault\textbf{答辩日期}%
    & \multicolumn{3}{c}{\sDefault{#1}} \\ }
\newcommand{\defenseChair}[3]{\sDefault\textbf{主席} & \expert{#1}{#2}{#3} }
\newcommand{\committeeMember}[3]{\sDefault\textbf{委员} & \expert{#1}{#2}{#3} }
\newcommand{\defenseSecretary}[3]{\sDefault\textbf{秘书} & \expert{#1}{#2}{#3} }
\newcommand{\makeCommitteePage}[1]{ %
    \thispagestyle{empty} %
    \begin{titlepage} %
        \linespread{1.2} \sXiaosan \par %
        \vspace*{\baselineskip} %
        \begin{center} %
            \setlength{\tabcolsep}{0pt}%
            {\linespread{1}\fHei \sSanhaoFixed 学位论文评阅人和答辩委员会名单\par}\vspace{20bp} % 标题后空一行
            #1\relax %
        \end{center} %
    \end{titlepage} \fSong \normalsize \newpage %
    \thispagestyle{empty} \cleardoublepage} %
\newcommand{\reviewers}[1]{ %
    \par\vspace{10bp} % 段前 0.5 行，固定行距 20pt
    {\linespread{1}\fHei\fontsize{14bp}{20bp}\selectfont 学位论文评阅人名单\par} %
    \fSong \sSihao %
    \let\oldarraystretch=\arraystretch %
    \renewcommand{\arraystretch}{2.0115} % 附件 3：评阅人表单行行高 25.25 磅
    \begin{tabularx}{15.27cm}{O{3.71cm}O{2.83cm}O{8.73cm}} %
        \centering
        \expert{\textbf{姓名}}{\textbf{职称}}{\textbf{工作单位}}
        #1\relax %
    \end{tabularx} %
    \renewcommand{\arraystretch}{\oldarraystretch}} %
\newcommand{\committee}[2]{ %
    \par\vspace{10bp} % 段前 0.5 行，固定行距 20pt
    {\linespread{1}\fHei\fontsize{14bp}{20bp}\selectfont 答辩委员会名单\par} %
    \fSong \sSihao %
    \let\oldarraystretch=\arraystretch %
    \renewcommand{\arraystretch}{2.0314} % 附件 3：答辩委员会表单行行高 25.50 磅
    \begin{tabularx}{15.44cm}{O{3.76cm}O{2.68cm}O{2.25cm}O{6.75cm}}
        \defenseDate{#1} \sDefault\textbf{答辩委员会} & %
        \expert{\textbf{姓名}}{\textbf{职称}}{\textbf{工作单位}}
        #2\relax %
    \end{tabularx} %
    \renewcommand{\arraystretch}{\oldarraystretch}} %
% -- 中文摘要及关键词 --
\newenvironment{abstract}{ %
\pagenumbering{Roman} %
\setcounter{page}{1} %
\renewcommand{\baselinestretch}{1.0} %
\newcommand{\sep}{\!；} % 中文关键词间隔符
\sDefault %
\chapter[\texorpdfstring{摘{\quad}要}{摘要}]{摘{\quad}要}
\markboth{摘{\quad}要}{摘{\quad}要} %
}{\vfill\sWuhao\noindent\nwpu@chs@funding\par\cleardoublepage}
\newenvironment{keywords}{ %
    \vspace{1\baselineskip} \par %
    \noindent {\fHei\sXiaosiFixed 关键词：}}{} %
% -- 英文摘要及关键词 --
\newenvironment{engabstract}{ %
    \newcommand{\ensep}{\!; } %
    \sDefault %
    \chapter[ABSTRACT]{\selectfont\rmfamily\textbf{Abstract}}%
    \markboth{Abstract}{ABSTRACT} %
}{\vfill\sWuhao\noindent\nwpu@eng@funding\par\cleardoublepage}
\newenvironment{engkeywords}{ %
    \vspace{1\baselineskip} \par %
    \noindent \textbf{Keywords:}}{} %
% -- 目录页 --
\newif\ifnpu@toc@appendix
\def\npu@toc@anchorprefix#1.#2\@nil{#1}
% 目录汇总附录，保留各附录在 PDF 中的独立书签和链接。
\newcommand{\npu@toc@contentsline}[4]{%
    \edef\npu@toc@anchor{\npu@toc@anchorprefix#4.\@nil}%
    \ifdefstring{\npu@toc@anchor}{appendix}{%
        \ifstrequal{#1}{chapter}{%
            \ifnpu@toc@appendix\else
                \npu@toc@appendixtrue
                \npu@toc@originalline{chapter}%
                    {\if@npu@lang@chs 附{\quad}录\else Appendices\fi}{#3}{#4}%
            \fi}{}%
    }{\npu@toc@originalline{#1}{#2}{#3}{#4}}}
\let\old@toc\tableofcontents %
\renewcommand{\tableofcontents}{ %
    \sXiaosiFixed\phantomsection %
    \bookmark[dest=\@currentHref, level=0]{\contentsname}
    \begingroup
    \renewcommand{\@pnumwidth}{2.2em}%
    \let\npu@toc@originalline\contentsline
    \let\contentsline\npu@toc@contentsline
    \old@toc
    \endgroup
    \cleardoublepage %
} %
\let\old@lof\listoffigures %
\renewcommand{\listoffigures}{ %
    \sDefault %
    \if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection %
    \addcontentsline{toc}{chapter}{\listfigurename} %
    \begingroup %
    \renewcommand{\numberline}[1]{图~##1\hspace*{1em}} %
    \old@lof %
    \endgroup %
    \cleardoublepage %
}
\let\old@lot\listoftables %
\renewcommand{\listoftables}{ %
    \sDefault %
    \if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection %
    \addcontentsline{toc}{chapter}{\listtablename} %
    \begingroup %
    \renewcommand{\numberline}[1]{表~##1\hspace*{1em}} %
    \old@lot %
    \endgroup %
    \cleardoublepage %
}

% -- 参考文献及附录处理 --
\let\old@bibliography\bibliography %
\apptocmd{\bibsection}{\addcontentsline{toc}{chapter}{\bibname}}{}%
    {\ClassError{nputhesis}{Unable to add the bibliography to the contents}{}}%
\renewcommand{\bibliography}[1]{ %
    \renewcommand{\baselinestretch}{1.0} %
    \setlength{\bibsep}{0pt} %
    \sDefault \old@bibliography{#1} \cleardoublepage %
} %
% 修正附录中各级标题的 hyperref 引用类型。
\patchcmd{\hyper@makecurrent}{%
    \ifx\Hy@param\Hy@chapterstring %
        \let\Hy@param\Hy@chapapp\fi}{\iftoggle{inappendix}{%
        \@checkappendixparam{chapter}%
        \@checkappendixparam{section}%
        \@checkappendixparam{subsection}%
        \@checkappendixparam{subsubsection}%
        \@checkappendixparam{paragraph}%
        \@checkappendixparam{subparagraph}%
    }{}}{}{\errmessage{failed to patch}} %
\newcommand*{\@checkappendixparam}[1]{%
    \def\@checkappendixparamtmp{#1}%
    \ifx\Hy@param\@checkappendixparamtmp %
        \let\Hy@param\Hy@appendixstring %
    \fi} %
\newtoggle{inappendix}\togglefalse{inappendix} %
\apptocmd{\appendix}{\toggletrue{inappendix}}{}{\errmessage{failed to patch}}
\apptocmd{\subappendices}{\toggletrue{inappendix}}{}{\errmessage{failed to patch}}
\appto\listoffigures{\addtocontents{lof}{\protect\setcounter{tocdepth}{1}}}
\appto\listoftables{\addtocontents{lot}{\protect\setcounter{tocdepth}{1}}}
\newcommand{\nwpu@chs@appendixname}[1]{附录 #1} %
\newcommand{\nwpu@eng@appendixname}[1]{Appendix #1} %
\let\old@appendix\appendix %
\renewcommand{\appendix}{ %
    \old@appendix %
    \setcounter{chapter}{0} %
    \renewcommand{\nwpu@chs@chaptercname}{\nwpu@chs@appendixname}
    \renewcommand{\nwpu@eng@chaptercname}{\nwpu@eng@appendixname}
    \if@npu@lang@chs\renewcommand{\appendixname}{附录}\fi
    \titleformat{\chapter}[hang]{\normalfont\sSanhaoFixed\filcenter\sffamily\fHei}{%
        \sffamily\fHei\sSanhaoFixed{\appendixname}\rmfamily\sSanhaoFixed\bfseries\thechapter}{20pt}{\sSanhaoFixed}[\vspace{15.6bp}]
    \renewcommand{\thechapter}{\Alph{chapter}} %
    \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
    \renewcommand{\theequation}{\Alph{chapter}-\arabic{equation}}
    \renewcommand{\thetable}{\Alph{chapter}-\arabic{table}} %
% 图、表和公式按“章号-序号”编号；定理与算法使用点号。
    \renewcommand{\thefigure}{\Alph{chapter}-\arabic{figure}}
    \renewcommand{\thetheorem}{\Alph{chapter}.\arabic{theorem}}
    \renewcommand{\theaxiom}{\Alph{chapter}.\arabic{axiom}} %
    \renewcommand{\thecorollary}{\Alph{chapter}.\arabic{corollary}}
    \renewcommand{\thelemma}{\Alph{chapter}.\arabic{lemma}} %
    \renewcommand{\thedefinition}{\Alph{chapter}.\arabic{definition}}
    \renewcommand{\theexample}{\Alph{chapter}.\arabic{example}}
}%
% -- 后置页 --
% 致谢
\newenvironment{acknowledgements}{ %
    \renewcommand{\baselinestretch}{1.0} %
    \sDefault %
    \phantomsection\chapter*{\nwpu@page@ack} %
    \markboth{\nwpu@page@ack}{\nwpu@page@ack} %
    \addcontentsline{toc}{chapter}{\nwpu@page@ack} %
}{\par \cleardoublepage} %
% 在学期间科研成果
\newenvironment{accomplishments}{ %
    \renewcommand{\baselinestretch}{1.0} %
    \sDefault %
    \phantomsection\chapter*{\nwpu@page@acp} %
    \markboth{\nwpu@page@acp}{} %
    \addcontentsline{toc}{chapter}{\nwpu@page@acp} %
    \newlength{\oldparindent} %
    \setlength{\oldparindent}{\parindent} %
    \setlength{\parindent}{0pt} %
}{\setlength{\parindent}{\oldparindent} \cleardoublepage} %
% 使用授权与原创性声明
\newcommand{\makestatement}{ %
\begin{titlepage}
    \vspace*{-1.5mm}
    \begin{minipage}{149.6mm}
        \begin{center}
            \renewcommand{\baselinestretch}{1.5}\fSong\sSihao\par
            {\bf 西北工业大学}\par
            {\bf 学位论文使用授权声明}\par
        \end{center}
        \renewcommand{\baselinestretch}{2.22}\fSong\fontsize{10.6pt}{10.6pt}\selectfont
        {\qquad}本人完全了解学校有关保护知识产权的规定，即：研究生在校攻读学位期间论文工作的
        知识产权单位属于西北工业大学。学校有权保留并向国家有关部门或机构送交论文的复印件
        和电子版。本人允许论文被查阅和借阅。学校可以将本学位论文的全部或部分内容编入有关
        数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。同时本人
        保证，毕业后结合学位论文研究课题再撰写的文章一律注明作者单位为西北工业大学。\par
        {\qquad}本学位论文属于（在以下方框内打“√”）：\par
        {\qquad}$\square$\hspace*{0.7em}保密论文，保密期
        （\hspace*{2.5em}年\hspace*{2.5em}月\hspace*{2.5em}日
        至\hspace*{2.5em}年\hspace*{2.5em}月\hspace*{2.5em}日）。\par
        {\qquad}$\square$\hspace*{0.7em}公开论文。\par
        {\qquad}~\par
        {\qquad}学位论文作者签名{~:~}\underline{\qquad\qquad\qquad}\hfill
        指导教师签名{~:~}\underline{\qquad\qquad\qquad}\par
        \hspace*{8em}{年\hspace*{1.5em}月\hspace*{1.5em}日}\hfill
        \hspace*{12em}{年\hspace*{1.5em}月\hspace*{1.5em}日}\hspace*{1.5em}\par
        {\qquad}~\par
        \vspace*{2.1mm}
        \hbox to \hsize{\leaders\hbox to 0.6em{\hss--\hss}\hfill} \par
        \vspace*{-13mm}
        {\qquad}~\par
        \vspace*{2mm}
        \begin{center}
            \renewcommand{\baselinestretch}{1.45}\fSong\sSihao
            {\bf 西北工业大学}\par
            {\bf 学位论文原创性声明}\par
        \end{center}
        \vspace*{4mm}
        \hspace*{6mm}\begin{minipage}{141.6mm}
            \renewcommand{\baselinestretch}{2.22}\fSong\fontsize{10.6pt}{10.6pt}\selectfont
            {\qquad}\mbox{秉承学校严谨的学风和优良的科学道德，本人郑重声明：所呈交的学位论文，是本}
            \mbox{人在导师的指导下进行研究工作所取得的成果。尽我所知，除文中已经注明引用的内容}
            \mbox{和致谢的地方外，本论文不包含任何其他个人或集体已经公开发表或撰写过的研究成果，}
            \mbox{不包含本人或他人已申请学位或其他用途使用过的成果。对本文的研究做出重要贡献的}
            \mbox{个人和集体，均已在文中以明确方式标明。}\par
            {\qquad}本人学位论文与资料若有不实，愿意承担一切相关的法律责任。\par
            \vspace*{1.5mm}
            \hspace*{21em}\hfill 学位论文作者签名{~:~}\underline{\qquad\qquad\quad}\par
            \vspace*{2mm}
            \hspace*{10em}\hfill {年\hspace*{1.5em}月\hspace*{1.5em}日}\hspace*{1.5em}
        \end{minipage}
    \end{minipage}
\end{titlepage}
} %


%% End of file `nputhesis.cls'.
