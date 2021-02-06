\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BIThesis}[2020/12/31 BIThesis LaTeX class]

\newif\ifBIT@master\BIT@masterfalse
\newif\ifBIT@doctor\BIT@doctorfalse
\newif\ifBIT@istwoside\BIT@istwosidefalse
\DeclareOption{master}{\BIT@mastertrue}
\DeclareOption{doctor}{\BIT@doctortrue}
\DeclareOption{twoside}{\BIT@istwosidetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\ifBIT@istwoside
    \LoadClass[zihao=-4, a4paper, twoside, openright, UTF8, space=auto]{ctexbook}
\else
    \LoadClass[zihao=-4, a4paper, oneside, openany, UTF8, space=auto]{ctexbook}
\fi

% ---------- 一些包 ----------
\RequirePackage{anyfontsize}
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{upgreek}
% ---------- 纸张及页面 ----------
\RequirePackage[
    paper=a4paper,
    top=3.5cm,
    bottom=2.5cm,
    left=2.7cm,
    right=2.7cm,
    headheight=1.0cm,
    footskip=0.7cm
]{geometry}

\RequirePackage{fancyhdr}
% 正文页眉页脚
\fancypagestyle{BIT@headings}{
    \fancyhf{}
    \fancyfoot[C]{\songti \zihao{5} \thepage}
    \fancyhead[C]{
        \ifBIT@master
            \zihao{5} {\songti 北京理工大学硕士学位论文}
        \else
            \zihao{5} {\songti 北京理工大学博士学位论文}
        \fi
    }
}
% 空页眉页脚
\fancypagestyle{BIT@empty}{
    \fancyhf{}
}
% ---------- Clear Double Page ----------
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\let\BIT@cleardoublepage\cleardoublepage
\newcommand{\BIT@clearemptydoublepage}{\clearpage{\pagestyle{BIT@empty}\BIT@cleardoublepage}}
\let\cleardoublepage\BIT@clearemptydoublepage
% ---------- 设置英文字体 ----------
\RequirePackage{xltxtra}
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}
% ---------- 下划线 ----------
\def\BIT@underline[#1]#2{\underline{\hbox to #1{\hfill#2\hfill}}}
\def\BITunderline{\@ifnextchar[\BIT@underline\underline}
% ---------- 空格 ----------
\newcommand{\BITspace}[1][1]{\hspace{#1\ccwd}}
% ---------- 中文破折号 ----------
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}
% ---------- 设置行距 ----------
\RequirePackage{setspace}
\setstretch{1.523}
% ---------- 设置段间距 ----------
\parskip 0.5ex plus 0.25ex minus 0.25ex
% ---------- 超链接 ----------
\RequirePackage{xcolor}
\definecolor{navyblue}{RGB}{0, 0, 128}
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
% ---------- 带圆圈的数字 ----------
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}
% ---------- 上标引用 ----------
\RequirePackage[numbers, square, comma, sort&compress]{natbib}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
% ---------- 图 ----------
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\RequirePackage{wrapfig}
\DeclareGraphicsExtensions{.pdf, .eps, .png, .jpg, .jpeg}
% ---------- 复杂表格 ----------
\RequirePackage{threeparttable}
\RequirePackage{multirow}
\RequirePackage{dcolumn}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}
% ---------- 图表标题 ----------
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
    font = {fontsize},
    labelsep = zhspace
}
\captionsetup[table]{
    position = top,
    aboveskip = 6bp,
    belowskip = 6bp
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
    position = bottom,
    aboveskip = 6bp,
    belowskip = 6bp
}
% ---------- 图、表、公式编号样式 ----------
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}
% ---------- 将 frontmatter 页码设置为罗马大写数字 ----------
\renewcommand{\frontmatter}{
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{BIT@headings}
}
% ---------- 将 mainmatter 页码设置为阿拉伯数字 ----------
\renewcommand{\mainmatter}{
    \if@openright
        \cleardoublepage
    \else
        \clearpage
    \fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{BIT@headings}
}
% ---------- 数学相关 ----------
\RequirePackage{amsthm,amsfonts,amssymb,bm,mathrsfs}
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
% ---------- 化学相关 ----------
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}
% ---------- 源代码 ----------
\RequirePackage{listings}
\lstset{
    tabsize=4,
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
    framextopmargin=2pt,
    framexbottommargin=2pt,
    abovecaptionskip=-3pt,
    belowcaptionskip=3pt,
    xleftmargin=4em,
    xrightmargin=4em,
    texcl=true,
    extendedchars=false,
    columns=flexible,
    mathescape=true
    numbersep=-1em
}
\renewcommand{\lstlistingname}{代码}
% ---------- “深度” ----------
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}
% ---------- 下一页从偶数页开始 ----------
\newcommand{\beginatevenpage}{
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}
% ---------- 浮动参数 ----------
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%%%%%%%%%%%%%%%%%%%%%%%%% 封面、中英文及竖排题名页 %%%%%%%%%%%%%%%%%%%%%%%%%
\def\BIT@label@CLC{中图分类号：}
\def\BIT@value@CLC{}
\newcommand{\CLC}[1]{\def\BIT@value@CLC{#1}}

\def\BIT@label@UDC{UDC 分类号：}
\def\BIT@value@UDC{}
\newcommand{\UDC}[1]{\def\BIT@value@UDC{#1}}

\def\BIT@value@title{}
\renewcommand{\title}[1]{\def\BIT@value@title{#1}}

\def\BIT@label@author{作~~~~者~~~~姓~~~~名}
\def\BIT@value@author{}
\renewcommand{\author}[1]{\def\BIT@value@author{#1}}

\def\BIT@label@institute{学~~~~院~~~~名~~~~称}
\def\BIT@value@institute{}
\newcommand{\institute}[1]{\def\BIT@value@institute{#1}}

\def\BIT@label@mentor{指~~~~导~~~~教~~~~师}
\def\BIT@value@mentor{}
\newcommand{\mentor}[1]{\def\BIT@value@mentor{#1}}

\def\BIT@label@chairman{答辩委员会主席}
\def\BIT@value@chairman{}
\newcommand{\chairman}[1]{\def\BIT@value@chairman{#1}}

\def\BIT@label@degree{申~~~~请~~~~学~~~~位}
\def\BIT@value@degree{}
\newcommand{\degree}[1]{\def\BIT@value@degree{#1}}

\def\BIT@label@major{学~~~~科~~~~专~~~~业}
\def\BIT@value@major{}
\newcommand{\major}[1]{\def\BIT@value@major{#1}}

\def\BIT@label@school{学~位~授~予~单~位}
\def\@BIT@value@school{}
\newcommand{\school}[1]{\def\BIT@value@school{#1}}

\def\BIT@label@date{论~文~答~辩~日~期}
\def\BIT@value@date{}
\renewcommand{\date}[1]{\def\BIT@value@date{#1}}

\def\BIT@value@englishtitle{}
\newcommand{\englishtitle}[1]{\def\BIT@value@englishtitle{#1}}

\def\BIT@label@englishauthor{Candidate Name:}
\def\BIT@value@englishauthor{}
\newcommand{\englishauthor}[1]{\def\BIT@value@englishauthor{#1}}

\def\BIT@label@englishinstitute{School or Department:}
\def\BIT@value@englishinstitute{}
\newcommand{\englishinstitute}[1]{\def\BIT@value@englishinstitute{#1}}

\def\BIT@label@englishmentor{Faculty Mentor:}
\def\BIT@value@englishmentor{}
\newcommand{\englishmentor}[1]{\def\BIT@value@englishmentor{#1}}

\def\BIT@label@englishchairman{Chair, Thesis Committee:}
\def\BIT@value@englishchairman{}
\newcommand{\englishchairman}[1]{\def\BIT@value@englishchairman{#1}}

\def\BIT@label@englishdegree{Degree Applied:}
\def\BIT@value@englishdegree{}
\newcommand{\englishdegree}[1]{\def\BIT@value@englishdegree{#1}}

\def\BIT@label@englishmajor{Major:}
\def\BIT@value@englishmajor{}
\newcommand{\englishmajor}[1]{\def\BIT@value@englishmajor{#1}}

\def\BIT@label@englishschool{Degree by:}
\def\BIT@value@englishschool{}
\newcommand{\englishschool}[1]{\def\BIT@value@englishschool{#1}}

\def\BIT@label@englishdate{The Date of Defence:}
\def\BIT@value@englishdate{}
\newcommand{\englishdate}[1]{\def\BIT@value@englishdate{#1}}

\newcommand{\makecoverpage}{
    \cleardoublepage
    \pdfbookmark[0]{封面}{coverpage}
    \thispagestyle{empty}
    \begin{center}
        \vspace*{60mm}
        {\heiti \zihao{-2} \BIT@value@title}
        \vskip 40mm
        {\heiti \zihao{-3} \BIT@value@author}
        \vskip 4mm
        {\heiti \zihao{-3} \BIT@value@date}
    \end{center}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}

\newcommand{\maketitlepage}{
    \newpage
    \cleardoublepage
    \pdfbookmark[0]{中文题名页}{titlepage}
    \thispagestyle{empty}
    {
        {\heiti \zihao{5} \noindent \BIT@label@CLC} \BIT@value@CLC \\
        {\heiti \zihao{5} \BIT@label@UDC} \BIT@value@UDC
    }
    \begin{center}
        \vskip \stretch{1}
            {\heiti \zihao{-2} \BIT@value@title}
        \vskip \stretch{1}
        {\fangsong \zihao{4}}
        \def\tabcolsep{1pt}
        \def\arraystretch{1.5}
        {
            \heiti \zihao{-3}
            \begin{tabular}{l p{3mm} c}
                \BIT@label@author       & & \BITunderline[180pt]{\BIT@value@author}     \\
                \BIT@label@institute    & & \BITunderline[180pt]{\BIT@value@institute}  \\
                \BIT@label@mentor       & & \BITunderline[180pt]{\BIT@value@mentor}     \\
            \BIT@label@chairman         & & \BITunderline[180pt]{\BIT@value@chairman}   \\
                \BIT@label@degree       & & \BITunderline[180pt]{\BIT@value@degree}     \\
                \BIT@label@major        & & \BITunderline[180pt]{\BIT@value@major}      \\
                \BIT@label@school       & & \BITunderline[180pt]{\BIT@value@school}     \\
                \BIT@label@date         & & \BITunderline[180pt]{\BIT@value@date}
            \end{tabular}
        }
    \end{center}
    \vskip \stretch{0.5}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}

\newcommand{\makeenglishtitlepage}{
    \cleardoublepage
    \pdfbookmark[0]{英文题名页}{englishtitlepage}
    \thispagestyle{empty}
    \begin{center}
        \vspace*{10em}
        {\zihao{-2} \textbf{\BIT@value@englishtitle}}
        \vskip \stretch{1}
        {
            \zihao{-3}
            \begin{tabular}{ll}
                \BIT@label@englishauthor        & \BITunderline[200pt]{\BIT@value@englishauthor}        \\
                \BIT@label@englishinstitute     & \BITunderline[200pt]{\BIT@value@englishinstitute}     \\
                \BIT@label@englishmentor        & \BITunderline[200pt]{\BIT@value@englishmentor}        \\
                \BIT@label@englishchairman      & \BITunderline[200pt]{\BIT@value@englishchairman}      \\
                \BIT@label@englishdegree        & \BITunderline[200pt]{\BIT@value@englishdegree}        \\
                \BIT@label@englishmajor         & \BITunderline[200pt]{\BIT@value@englishmajor}         \\
                \BIT@label@englishschool        & \BITunderline[200pt]{\BIT@value@englishschool}        \\
                \BIT@label@englishdate          & \BITunderline[200pt]{\BIT@value@englishdate}
            \end{tabular}
        }
    \end{center}
    \vskip \stretch{0.5}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}

\newcommand{\makeverticaltitlepage}{
    \cleardoublepage
    \pdfbookmark[0]{竖排题名页}{verticaltitlepage}
    \thispagestyle{empty}
    \vskip 5cm
    \begin{center}
        \setstretch{1.1}
        \begin{minipage}{1em}
            {\heiti \zihao{3} \BIT@value@title}
            \vskip 2cm
            {\heiti \zihao{3} \BIT@value@school}
        \end{minipage}
    \end{center}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%% 声明和授权页 %%%%%%%%%%%%%%%%%%%%%%%%%
\def\BIT@label@declaration{研究成果声明}
\def\BIT@label@authorization{关于学位论文使用权的说明}
\def\BIT@label@authorsign{作者签名：}
\def\BIT@label@mentorsign{导师签名：}
\def\BIT@label@signdate{签字日期：}

\def\BIT@label@declarationcontent{\BITspace\BITspace 本人郑重声明：
所提交的学位论文是我本人在指导教师的指导下进行的研究工作获得的研究成果。
尽我所知，文中除特别标注和致谢的地方外，学位论文中不包含其他人已经发表或撰写过的研究成果，
也不包含为获得北京理工大学或其它教育机构的学位或证书所使用过的材料。
与我一同工作的合作者对此研究工作所做的任何贡献均已在学位论文中作了明确的说明并表示了谢意。\par 特此申明。}

\def\BIT@label@authorizationcontent{\BITspace\BITspace 本人完全了解北京理工大学有关保管、使用学位论文的规定，
其中包括：
\circled{1} 学校有权保管、并向有关部门送交学位论文的原件与复印件；
\circled{2} 学校可以采用影印、缩印或其它复制手段复制并保存学位论文；
\circled{3} 学校可允许学位论文被查阅或借阅；
\circled{4} 学校可以学术交流为目的,复制赠送和交换学位论文；
\circled{5} 学校可以公布学位论文的全部或部分内容（保密学位论文在解密后遵守此规定）。}

\newcommand{\makedeclarationpage}{
    \cleardoublepage
    \pdfbookmark[0]{声明和授权页}{declaration&authorization}
    \thispagestyle{empty}
    \begin{center}
        {\bf \zihao{3} \BIT@label@declaration}
    \end{center}
    \vskip 10pt
    {\zihao{4} \BIT@label@declarationcontent}
    \vskip 10pt
    \hspace{8em} {\zihao{4} \BIT@label@authorsign} \BITunderline[6em]{} \hspace{2em} {\zihao{4} \BIT@label@signdate} \BITunderline[6em]{}
    \vskip 30mm
    \begin{center}
        {\bf \zihao{3} \BIT@label@authorization}
    \end{center}
    \vskip 10pt
    {\zihao{4} \BIT@label@authorizationcontent}
    \vskip 40pt
    \hspace{8em} {\zihao{4} \BIT@label@authorsign} \BITunderline[6em]{} \hspace{2em} {\zihao{4} \BIT@label@mentorsign} \BITunderline[6em]{}
    \vskip 15pt
    \hspace{8em} {\zihao{4} \BIT@label@signdate} \BITunderline[6em]{} \hspace{2em} {\zihao{4} \BIT@label@signdate} \BITunderline[6em]{}
    \clearpage
    \if@twoside
        \thispagestyle{empty}
        \cleardoublepage
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%% 中英文摘要 %%%%%%%%%%%%%%%%%%%%%%%%%
\def\BIT@label@abstract{摘要}
\def\BIT@label@keywords{关键词：}
\def\BIT@label@englishabstract{Abstract}
\def\BIT@label@englishkeywords{Key Words: }

\newenvironment{abstract}{
    \cleardoublepage
    \pdfbookmark[0]{中文摘要}{abstract}
    \chapter*{\BIT@label@abstract}
}{}

\newcommand{\keywords}[1]{
    \vspace{2ex} \noindent {\bf \BIT@label@keywords} #1
}

\newenvironment{englishabstract}{
    \clearpage
    \pdfbookmark[0]{英文摘要}{englishabstract}
    \chapter*{\BIT@label@englishabstract}
}{}

\newcommand{\englishkeywords}[1]{
    \vspace{2ex} \noindent {\bf \BIT@label@englishkeywords} #1
}

%%%%%%%%%%%%%%%%%%%%%%%%% 目录 %%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\tableofcontents}{
    \if@twocolumn
        \@restonecoltrue\onecolumn
    \else
        \@restonecolfalse
    \fi
    \cleardoublepage
    \pdfbookmark[0]{目录}{toc}
    \chapter*{\contentsname}
    \@mkboth{\MakeUppercase{\contentsname}}
    {\MakeUppercase{\contentsname}}
    \@starttoc{toc}
    \if@restonecol
        \twocolumn
    \fi
}

\def\contentsname{目录}

\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\songti \zihao{4}}
    {\thecontentslabel\hspace{\ccwd}}{}
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

%%%%%%%%%%%%%%%%%%%%%%%%% 插图、附表、注释表 %%%%%%%%%%%%%%%%%%%%%%%%%
\def\listfigurename{插图}
\def\listtablename{附表}
\def\BIT@label@denotation{注释表}
\newenvironment{denotation}[1][2.5cm]{
    \cleardoublepage
    \pdfbookmark[0]{注释表}{denotation}
    \chapter*{\BIT@label@denotation}
    \noindent\begin{list}{}
    {\vskip-30bp\zihao{-4}
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
}}{\end{list}}

%%%%%%%%%%%%%%%%%%%%%%%%% 正文 %%%%%%%%%%%%%%%%%%%%%%%%%
\ctexset{chapter={
    name={第,章},
    number={\arabic{chapter}},
    format={\bfseries \sffamily \centering \zihao{3}},
    pagestyle={BIT@headings},
    beforeskip=16bp,
    afterskip=32bp,
    fixskip=true
}}

\ctexset{section={
    format={\raggedright \bfseries \sffamily \zihao{4}},
    beforeskip=28bp plus 1ex minus .2ex,
    afterskip=24bp plus .2ex,
    fixskip=true
}}

\ctexset{subsection={
    format={\bfseries \sffamily \raggedright \zihao{-4}},
    beforeskip=28bp plus 1ex minus .2ex,
    afterskip=24bp plus .2ex,
    fixskip=true
}}

\ctexset{subsubsection={
    format={\heiti \raggedright \zihao{-4}},
    beforeskip=28bp plus 1ex minus .2ex,
    afterskip=24bp plus .2ex,
    fixskip=true
}}

%%%%%%%%%%%%%%%%%%%%%%%%% 结论 %%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{conclusion}{
    \chapter*{结论}
    \@mkboth{结论}{结论}
    \addcontentsline{toc}{chapter}{结论}
}{}

\def\BIT@label@conclusion{结论}

%%%%%%%%%%%%%%%%%%%%%%%%% 参考文献 %%%%%%%%%%%%%%%%%%%%%%%%%
\bibliographystyle{GBT7714-2005NLang}

\RequirePackage{enumitem}
\renewenvironment{thebibliography}[1]{
    \zihao{5}
    \chapter*{\bibname}
    \@mkboth{\MakeUppercase{\bibname}}{\MakeUppercase{\bibname}}
    \addcontentsline{toc}{chapter}{参考文献}
    \list{\@biblabel{\@arabic\c@enumiv}}{
        \settowidth\labelwidth{\@biblabel{#1}}
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
        \renewcommand{\theenumiv}{\@arabic\c@enumiv}
    }
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000
    \sfcode`\.\@m
}{
    \def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}
    \endlist
}

\def\BIT@label@reference{参考文献}

%%%%%%%%%%%%%%%%%%%%%%%%% 附录 %%%%%%%%%%%%%%%%%%%%%%%%%
\def\BIT@label@appendix{附录}

%%%%%%%%%%%%%%%%%%%%%%%%% 论文及成果清单 %%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{publications}[1]{
    \chapter{\BIT@label@publications}
    \@mkboth{\MakeUppercase{\BIT@label@publications}}{\MakeUppercase{\BIT@label@publications}}
    \list{\@biblabel{\@arabic\c@enumiv}}{
        \settowidth\labelwidth{\@biblabel{#1}}
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
        \renewcommand{\theenumiv}{\@arabic\c@enumiv}
    }
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000
    \sfcode`\.\@m
}{
    \def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}
    \endlist
}

\def\BIT@label@publications{攻读学位期间发表论文与研究成果清单}

%%%%%%%%%%%%%%%%%%%%%%%%% 致谢 %%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{acknowledgment}{
    \chapter{\BIT@label@acknowledgment}
    \fangsong
}{}

\def\BIT@label@acknowledgment{致谢}

%%%%%%%%%%%%%%%%%%%%%%%%% 作者简介 %%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{resume}{
    \chapter{\BIT@label@resume}
}{}

\newenvironment{resumesection}[1]{
    {\noindent \normalfont \bfseries #1}
    \list{}{
        \labelwidth\z@
        \leftmargin 2\ccwd
    }
    \item\relax
}{
    \endlist
}

\newenvironment{resumeli}[1]{
    {\noindent \normalfont \bfseries #1}
    \list{}{
        \labelwidth\z@
        \leftmargin 4\ccwd
        \itemindent -2\ccwd
        \listparindent\itemindent
    }
    \item\relax
}{
    \endlist
}

\def\BIT@label@resume{作者简介}
