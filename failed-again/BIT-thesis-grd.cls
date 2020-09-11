%%==================================================
%% modified based on BIT-Thesis-template v1.5
%% author: Zheng Shuai <i AT iamzs.win>
%% version: 1.6
%%==================================================

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{BIT-thesis-grd}[2020/09/10 v1.6 BIT-thesis-grd document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifBIT@master\BIT@masterfalse
\newif\ifBIT@doctor\BIT@doctorfalse
\newif\ifBIT@istwoside\BIT@istwosidefalse
\DeclareOption{master}{\BIT@mastertrue}
\DeclareOption{doctor}{\BIT@doctortrue}
\DeclareOption{twoside}{\BIT@istwosidetrue}

\ProcessOptions\relax
\ifBIT@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi

% 模板版本
\def\BIT@value@templateversion{v1.6}
\newcommand{\version}{\BIT@value@templateversion}

% BITspace command
\newcommand{\BITspace}[1][1]{\hspace{#1\ccwd}}

% BITunderline
\def\BIT@underline[#1]#2{
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\BITunderline{\@ifnextchar[\BIT@underline\underline}

% cleardoublepage command
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

% 带圈的数字
\usepackage{tikz}
\usepackage{etoolbox}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}

% 蛤？
\def\contentsname{目\BITspace 录}
\def\listfigurename{插\BITspace 图}
\def\listtablename{表\BITspace 格}

% 封面
% label
\def\BIT@label@confidential{密级}
\def\BIT@label@serialnumber{编号}
\def\BIT@label@thesis{学位论文}
\def\BIT@label@submitdate{论文提交日期}
% value
\def\BIT@value@confidential{}
\def\BIT@value@serialnumber{}
\def\BIT@value@submitdate{}
% command
\newcommand\confidential[1]{\def\BIT@value@confidential{#1}}
\newcommand\serialnumber[1]{\def\BIT@value@serialnumber{#1}}
\newcommand\submitdate[1]{\def\BIT@value@submitdate{#1}}

% 中文题名页
% label
\def\BIT@label@classification{中图分类号：}
\def\BIT@label@UDC{UDC\!分类号：}
\def\BIT@label@title{论文题目}
\def\BIT@label@author{作~~~~者~~~~姓~~~~名}
\def\BIT@label@institute{学~~~~院~~~~名~~~~称}
\def\BIT@label@advisor{指~~~~导~~~~教~~~~师}
\def\BIT@label@chairman{答辩委员会主席}
\def\BIT@label@degree{申~~~~请~~~~学~~~~位}
\def\BIT@label@major{学~~~~科~~~~专~~~~业}
\def\BIT@label@school{学~位~授~予~单~位}
\def\BIT@label@defenddate{论~文~答~辩~日~期}
% 过时或废弃
\def\BIT@label@statement{}
% value
\def\BIT@value@classification{}
\def\BIT@value@UDC{}
\def\BIT@value@title{~~~~~（论~文~题~目）~~~~~}
\def\BIT@value@titlemark{\BIT@value@title}
\def\BIT@value@author{（作~者~姓~名）}
\def\BIT@value@institute{}
\def\BIT@value@advisor{（姓名、专业技术职务、学位）}
\def\BIT@value@chairman{}
\def\BIT@value@degree{}
\def\BIT@value@major{}
\def\BIT@value@school{}
\def\BIT@value@defenddate{}
% 过时或废弃
\def\BIT@value@advisorinstitute{（单位）}
\def\BIT@value@studentnumber{}
% command
\newcommand\classification[1]{\def\BIT@value@classification{#1}}
\newcommand\UDC[1]{\def\BIT@value@UDC{#1}}
\renewcommand\title[2][\BIT@value@title]{
  \def\BIT@value@title{#2}
  \def\BIT@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\BIT@value@author{#1}}
\newcommand\institute[1]{\def\BIT@value@institute{#1}}
\newcommand\advisor[1]{\def\BIT@value@advisor{#1}}
\newcommand\chairman[1]{\def\BIT@value@chairman{#1}}
\newcommand\degree[1]{\def\BIT@value@degree{#1}}
\newcommand\major[1]{\def\BIT@value@major{#1}}
\newcommand\school[1]{\def\BIT@value@school{#1}}
\newcommand\defenddate[1]{\def\BIT@value@defenddate{#1}}
% 过时或废弃
\newcommand\advisorinstitute[1]{\def\BIT@value@advisorinstitute{#1}}
\newcommand\studentnumber[1]{\def\BIT@value@studentnumber{#1}}

% 英文题名页
% label
\def\BIT@label@englishauthor{Candidate Name:}
\def\BIT@label@englishinstitute{School or Department:}
\def\BIT@label@englishadvisor{Faculty Mentor:}
\def\BIT@label@englishchairman{Chair, Thesis Committee:}
\def\BIT@label@englishdegree{Degree Applied:}
\def\BIT@label@englishmajor{Major:}
\def\BIT@label@englishschool{Degree by:}
\def\BIT@label@englishdate{The Date of Defence:}
% 过时或废弃
\def\BIT@label@englishadvisor{Supervisor:}
\def\BIT@label@englishstatement{Submitted in total fulfilment
  of the requirements for the degree of \BIT@value@englishdegree \\
  in \BIT@value@englishmajor}
% value
\def\BIT@value@englishtitle{(English Title of Thesis)}
\def\BIT@value@englishauthor{(Author Name)}
\def\BIT@value@englishinstitute{(Institute Name)}
\def\BIT@value@englishadvisor{(Supervisor Name)}
\def\BIT@value@englishchair{(someone)}
\def\BIT@value@englishdegree{}
\def\BIT@value@englishmajor{}
\def\BIT@value@englishscholl{(BIT)}
\def\BIT@value@englishdate{}
% command
\newcommand\englishtitle[1]{\def\BIT@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\BIT@value@englishauthor{#1}}
\newcommand\englishinstitute[1]{\def\BIT@value@englishinstitute{#1}}
\newcommand\englishadvisor[1]{\def\BIT@value@englishadvisor{#1}}
\newcommand\englishchairman[1]{\def\BIT@value@englishchairman{#1}}
\newcommand\englishdegree[1]{\def\BIT@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\BIT@value@englishmajor{#1}}
\newcommand\englishschool[1]{\def\BIT@value@englishschool{#1}}
\newcommand\englishdate[1]{\def\BIT@value@englishdate{#1}}

% 竖排页
% label
% value
\def\BIT@value@vtitle{竖排论文题目}
% command
\newcommand\vtitle[1]{\def\BIT@value@vtitle{#1}}

% 原创性声明和授权页
\def\BIT@label@original{研究成果声明}
\def\BIT@label@originalcontent{\BITspace\BITspace 本人郑重声明：所提交的学位论文是我本人在指导教师的指导下进行的研究工作获得的研究成果。尽我所知，文中除特别标注和致谢的地方外，学位论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得北京理工大学或其它教育机构的学位或证书所使用过的材料。与我一同工作的合作者对此研究工作所做的任何贡献均已在学位论文中作了明确的说明并表示了谢意。\par 特此申明。}
\def\BIT@label@authorization{关于学位论文使用权的说明}
\def\BIT@label@authorizationcontent{\BITspace\BITspace 本人完全了解北京理工大学有关保管、使用学位论文的规定，其中包括：\circled{1} 学校有权保管、并向有关部门送交学位论文的原件与复印件；\circled{2} 学校可以采用影印、缩印或其它复制手段复制并保存学位论文；\circled{3} 学校可允许学位论文被查阅或借阅；\circled{4} 学校可以学术交流为目的,复制赠送和交换学位论文；\circled{5} 学校可以公布学位论文的全部或部分内容（保密学位论文在解密后遵守此规定）。}
\def\BIT@label@authorsign{作者签名：}
\def\BIT@label@Supervisorsign{导师签名：}
\def\BIT@label@originalDate{签字日期：}

% 预先定义的其他 label
\def\BIT@label@headschoolname{北京理工大学硕士学位论文}
\def\BIT@label@abstract{摘要}
\def\BIT@label@englishabstract{Abstract}
\def\BIT@label@keywords{关键词：}
\def\BIT@label@englishkeywords{Key Words:~}
\def\BIT@label@conclusion{结论}
\def\BIT@label@reference{参考文献！！！！}
\def\BIT@label@appendix{附录}
\def\BIT@label@publications{攻读学位期间发表论文与研究成果清单}
\def\BIT@label@projects{攻读学位期间参与的项目}
\def\BIT@label@thanks{致谢}
\def\BIT@label@resume{作者简介}

% 一些什么包？
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\RequirePackage{xcolor}
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\usepackage{enumitem} % ？？？

% 不知道定义的啥
\def\BIT@getfileinfo#1 #2 #3\relax#4\relax{
  \def\BITfiledate{#1}
  \def\BITfileversion{#2}
  \def\BITfileinfo{#3}}
\expandafter\ifx\csname ver@bitmaster-xetex.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_bitmaster-xetex.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@bitmaster-xetex.cls\endcsname}
\fi
\expandafter\BIT@getfileinfo\reserved@a\relax? ? \relax\relax

% 纸张和页面设置
\usepackage[
  paper=a4paper,
  top=3.5cm,
  bottom=2.5cm,
  left=2.7cm,
  right=2.7cm,
  headheight=1.0cm,
  footskip=0.7cm
]{geometry}

% 页眉页脚
\RequirePackage{fancyhdr}
\fancypagestyle{BIT@empty}{
  \fancyhf{}}
\fancypagestyle{BIT@headings}{
  \fancyhf{}
  \fancyhead[C]{\ifBIT@master\zihao{5}{\songti 北京理工大学硕士学位论文}
                \else\zihao{5}{\songti 北京理工大学博士学位论文}\fi}
  \fancyfoot[C]{\songti\zihao{5} \thepage}
}

% 对于 openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚
\let\BIT@cleardoublepage\cleardoublepage
\newcommand{\BIT@clearemptydoublepage}{
  \clearpage{\pagestyle{BIT@empty}\BIT@cleardoublepage}}
\let\cleardoublepage\BIT@clearemptydoublepage
% 修该 frontmatter 的页码为大写罗马格式，并调整页面风格
\renewcommand{\frontmatter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{BIT@headings}
}
% 修改 mainmatter 的页码为阿拉伯格式，并调整页面风格
\renewcommand{\mainmatter}{
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{BIT@headings}
}

% 设置英文字体
\RequirePackage{xltxtra}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

% 图
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{wrapfig}
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
  font = {fontsize},
  labelsep = zhspace,
}
\captionsetup[table]{
  position = top,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
  position = bottom,
  aboveskip = 6bp,
  belowskip = 6bp,
}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

% 表
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}

% 表达式
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
\RequirePackage{upgreek}
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}}
\theoremstyle{plain}
  \newtheorem{algo}{算法~}[chapter]
  \newtheorem{thm}{定理~}[chapter]
  \newtheorem{lem}[thm]{引理~}
  \newtheorem{prop}[thm]{命题~}
  \newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
  \newtheorem{defn}{定义~}[chapter]
  \newtheorem{conj}{猜想~}[chapter]
  \newtheorem{exmp}{例~}[chapter]
  \newtheorem{rem}{注~}
  \newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

% 代码段
\RequirePackage{listings}
\lstset{tabsize=4,
  frame=shadowbox,
  commentstyle=\color{red!50!green!50!blue!50},
  rulesepcolor=\color{red!20!green!20!blue!20},
  keywordstyle=\color{blue!90}\bfseries,
  showstringspaces=false,
  stringstyle=\ttfamily,
  keepspaces=true,
  breakindent=22pt,
  numbers=left,
  stepnumber=1,
  numberstyle=\tiny,
  basicstyle=\footnotesize,
  showspaces=false,
  flexiblecolumns=true,
  breaklines=true,
  breakautoindent=true,
  breakindent=4em,
  aboveskip=1em,
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
  xleftmargin=4em,xrightmargin=4em,
  texcl=true,
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em
}
\renewcommand{\lstlistingname}{代码}

% 图、表、表达式编号分隔符
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}

% 超链接
\definecolor{navyblue}{RGB}{0,0,128}
\RequirePackage{hyperref}
\hypersetup{
  bookmarksnumbered,
  linktoc=all,
  colorlinks=true,
  citecolor=navyblue,
  filecolor=cyan,
  linkcolor=navyblue,
  linkbordercolor=navyblue,
  urlcolor=navyblue,
  plainpages=false,
  pdfstartview=FitH
}

% 上标引用
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}

% 浮动参数？什么参数？浮动什么？
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

% 这又是啥？
\parskip 0.5ex plus 0.25ex minus 0.25ex

% 设置行距，大概为 22 磅？？？
\RequirePackage{setspace}
\setstretch{1.523}

% 封面打印要求
\renewcommand\maketitle[1]{
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{60mm}
    {\heiti \zihao{-2} \BIT@value@title}
    \vskip 40mm
    {\heiti \zihao{-3} \BIT@value@author}
    \vskip 4mm
    {\heiti \zihao{-3} \BIT@value@defenddate}
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

% 题名页打印要求
% 中文题名页
\newcommand\makeInfo[1]{
  \newpage
  \cleardoublepage
  \thispagestyle{empty}
  {
    {\heiti \zihao{5} \noindent \BIT@label@classification} \BIT@value@classification \\
    {\heiti \zihao{5} \BIT@label@UDC}  \BIT@value@UDC
  }
  \begin{center}
    \vskip \stretch{1}
      {\heiti\zihao{-2} \BIT@value@title}
    \vskip \stretch{1}
    {\fangsong\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    {\heiti\zihao{-3}
    \begin{tabular}{l p{3mm} c}
      \BIT@label@author & &\BITunderline[180pt]{\BIT@value@author} \\
      \BIT@label@institute & & \BITunderline[180pt]{\BIT@value@institute} \\
      \BIT@label@advisor & &  \BITunderline[180pt]{\BIT@value@advisor} \\
      \BIT@label@chairman & &   \BITunderline[180pt]{\BIT@value@chairman} \\
      \BIT@label@degree & &    \BITunderline[180pt]{\BIT@value@degree} \\
      \BIT@label@major & &    \BITunderline[180pt]{\BIT@value@major} \\
      \BIT@label@school & &   \BITunderline[180pt]{\BIT@value@school} \\
      \BIT@label@defenddate & &  \BITunderline[180pt]{\BIT@value@defenddate}
    \end{tabular}}
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
% 英文题名页
\newcommand\makeEnglishInfo[1]{
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{10em}
    {\zihao{-2}\textbf{\BIT@value@englishtitle}}
    \vskip \stretch{1}
    {\zihao{-3}
    \begin{tabular}{ll}
      \BIT@label@englishauthor & \BITunderline[200pt]{\BIT@value@englishauthor} \\
      \BIT@label@englishinstitute &  \BITunderline[200pt]{\BIT@value@englishinstitute} \\
      \BIT@label@englishadvisor &  \BITunderline[200pt]{\BIT@value@englishadvisor} \\
      \BIT@label@englishchairman &   \BITunderline[200pt]{\BIT@value@englishchairman} \\
      \BIT@label@englishdegree &    \BITunderline[200pt]{\BIT@value@englishdegree} \\
      \BIT@label@englishmajor &     \BITunderline[200pt]{\BIT@value@englishmajor} \\
      \BIT@label@englishschool &     \BITunderline[200pt]{\BIT@value@englishschool} \\
      \BIT@label@englishdate &   \BITunderline[200pt]{\BIT@value@englishdate}
    \end{tabular}}
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
  \if@twoside
  \thispagestyle{empty}
    \cleardoublepage
  \fi
}

% 竖排页打印要求
\newcommand\makeVerticalTitle{
  \cleardoublepage
  \thispagestyle{empty}
  \vskip 5cm
  \begin{center}
  \setstretch{1.1}
  \begin{minipage}{1em}
    {\heiti\zihao{3}\BIT@value@vtitle}
    \vskip 2cm
    {\heiti\zihao{3}\BIT@value@school}
  \end{minipage}
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

% 原创性声明和授权页打印要求
\newcommand\makeDeclareOriginal{
  \cleardoublepage
  \pdfbookmark[0]{声明}{statement}
  \thispagestyle{empty}
  \begin{center}
  {\bf\zihao{3} \BIT@label@original}
  \end{center}
  \vskip 10pt
  {\zihao{4}\BIT@label@originalcontent}
  \vskip 10pt
  \hspace{8em}{\zihao{4}\BIT@label@authorsign} \BITunderline[6em]{} \hspace{2em} {\zihao{4}\BIT@label@originalDate} \BITunderline[6em]{}
  \vskip 30mm
  \begin{center}
  {\bf\zihao{3} \BIT@label@authorization}
  \end{center}
  \vskip 10pt
  {\zihao{4} \BIT@label@authorizationcontent}
  \vskip 40pt
  \hspace{8em}{\zihao{4}\BIT@label@authorsign} \BITunderline[6em]{} \hspace{2em} {\zihao{4}\BIT@label@Supervisorsign} \BITunderline[6em]{}
  \vskip 15pt
  \hspace{8em}{\zihao{4}\BIT@label@originalDate} \BITunderline[6em]{} \hspace{2em} {\zihao{4}\BIT@label@originalDate} \BITunderline[6em]{}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}

% 页眉页脚
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\songti \zihao{5} \BIT@label@headschoolname}
\fancyfoot[C]{\songti \zihao{5} {\thepage}}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\songti \zihao{5} \BIT@label@headschoolname}
  \fancyfoot[C]{\songti \zihao{5} ~---~{\thepage}~---~}
}

% 摘要打印要求
% 中文摘要
\newenvironment{abstract}
{
  \cleardoublepage
  \chapter{\BIT@label@abstract}
}
{}
% 中文关键词
\newcommand\keywords[1]{
\vspace{2ex}\noindent{\bf \BIT@label@keywords} #1}
% 英文摘要
\newenvironment{englishabstract}
{
  \clearpage
  \chapter{\BIT@label@englishabstract}
}
{}
% 英文关键词
\newcommand\englishkeywords[1]{
\vspace{2ex}\noindent{\bf \BIT@label@englishkeywords} #1}

% 下一页从偶数页开始
\newcommand\beginatevenpage{
  \clearpage
    \if@twoside
      \thispagestyle{empty}
      \cleardoublepage
    \fi
}

% 注释表打印要求
\newcommand{\bit@denotation@name}{主要符号对照表}
\newenvironment{denotation}[1][2.5cm]{
  \chapter{\bit@denotation@name}
  \noindent\begin{list}{}
  {\vskip-30bp\zihao{-4}
    \renewcommand\makelabel[1]{##1\hfil}
    \setlength{\labelwidth}{#1}
    \setlength{\labelsep}{0.5cm}
    \setlength{\itemindent}{0cm}
    \setlength{\leftmargin}{\labelwidth+\labelsep}
    \setlength{\rightmargin}{0cm}
    \setlength{\parsep}{0cm}
    \setlength{\itemsep}{0cm}
  \setlength{\listparindent}{0cm}
  \setlength{\topsep}{0pt}
  }}{\end{list}}

% 目录打印要求
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}
\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\songti \zihao{4}}
    {\bf\thecontentslabel\hspace{\ccwd}}{\bf}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
    {\thecontentslabel\hspace{\ccwd}}{}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{figure}[0pt]{\songti\zihao{-4}}
    {\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{table}[0pt]{\songti\zihao{-4}}
    {\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
    {\hspace{.5em}\titlerule*{.}\contentspage}

\renewcommand\tableofcontents{
  \if@twocolumn
  \@restonecoltrue\onecolumn
  \else
  \@restonecolfalse
  \fi
  \chapter*{\contentsname}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}
  \pdfbookmark[0]{目录}{bittoc}
  \@starttoc{toc}
  \if@restonecol\twocolumn\fi
}

% 正文打印要求
\ctexset{chapter={
    name = {第,章},
    number = {\arabic{chapter}},
    format = {\bfseries \sffamily \centering \zihao{3}},
    pagestyle = {BIT@headings},
    beforeskip = 16 bp,
    afterskip = 32 bp,
    fixskip = true,
  }
}
\ctexset{section={
    format = {\raggedright \bfseries \sffamily \zihao{4}},
    beforeskip = 28bp plus 1ex minus .2ex,
    afterskip = 24bp plus .2ex,
    fixskip = true,
  }
}
\ctexset{subsection={
    format = {\bfseries \sffamily \raggedright \zihao{-4}},
    beforeskip = 28bp plus 1ex minus .2ex,
    afterskip = 24bp plus .2ex,
    fixskip = true,
  }
}
\ctexset{subsubsection={
    format = {\heiti \raggedright \zihao{-4}},
    beforeskip = 28bp plus 1ex minus .2ex,
    afterskip = 24bp plus .2ex,
    fixskip = true,
  }
}

% 结论打印要求
\newenvironment{conclusion}
  {\chapter*{结论}
    \@mkboth{结论}{结论}
    \addcontentsline{toc}{chapter}{结论}}
  {}

% 参考文献打印要求
\bibliographystyle{GBT7714-2005NLang}
\renewenvironment{thebibliography}[1]
  {\zihao{5}
  \chapter*{\bibname}
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}
  \addcontentsline{toc}{chapter}{参考文献}
  \list{\@biblabel{\@arabic\c@enumiv}}
  {\settowidth\labelwidth{\@biblabel{#1}}
  \leftmargin\labelwidth
  \advance\leftmargin\labelsep
  \setlength{\parsep}{1mm}
  \setlength{\labelsep}{0.5em}
  \setlength{\itemsep}{0.05pc}
  \setlength{\listparindent}{0in}
  \setlength{\itemindent}{0in}
  \setlength{\rightmargin}{0in}
  \@openbib@code
  \usecounter{enumiv}
  \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}
  \endlist}

% 附录打印要求

% 攻读学位期间发表论文与研究成果清单打印要求
\newenvironment{publications}[1]
  {\chapter{\BIT@label@publications}
  \@mkboth{\MakeUppercase\BIT@label@publications}{\MakeUppercase\BIT@label@publications}
  \list{\@biblabel{\@arabic\c@enumiv}}
  {\settowidth\labelwidth{\@biblabel{#1}}
  \leftmargin\labelwidth
  \advance\leftmargin\labelsep
  \setlength{\parsep}{1mm}
  \setlength{\labelsep}{0.5em}
  \setlength{\itemsep}{0.05pc}
  \setlength{\listparindent}{0in}
  \setlength{\itemindent}{0in}
  \setlength{\rightmargin}{0in}
  \@openbib@code
  \usecounter{enumiv}
  \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `publications' environment}}
  \endlist}

% 攻读学位期间参与的项目打印要求
\newenvironment{projects}[1]
  {\chapter{\BIT@label@projects}
  \@mkboth{\MakeUppercase\BIT@label@projects}{\MakeUppercase\BIT@label@projects}
  \list{\@biblabel{\@arabic\c@enumiv}}
  {\settowidth\labelwidth{\@biblabel{#1}}
  \leftmargin\labelwidth
  \advance\leftmargin\labelsep
  \@openbib@code
  \usecounter{enumiv}
  \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000
  \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `projects' environment}}
  \endlist}

% 致谢打印要求
\renewenvironment{thanks}
  {\chapter{\BIT@label@thanks}
  \fangsong
  }
  {}

% 作者简介打印要求
\newenvironment{resume}
{\chapter{\BIT@label@resume}}
{}

\newenvironment{resumesection}[1]
{{\noindent\normalfont\bfseries #1}
  \list{}{\labelwidth\z@
          \leftmargin 2\ccwd}
  \item\relax}
  {\endlist}

\newenvironment{resumeli}[1]
{{\noindent\normalfont\bfseries #1}
  \list{}{\labelwidth\z@
          \leftmargin 4\ccwd
          \itemindent -2\ccwd
          \listparindent\itemindent}
  \item\relax}
  {\endlist}

% 过时或废弃？？？
\newenvironment{symbolnote}
  {\chapter{\BIT@label@symbolnote}
  \fangsong}
  {}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

\endinput
