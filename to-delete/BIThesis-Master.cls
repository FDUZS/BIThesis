%
% 北京理工大学硕士研究生毕业设计 LaTeX 模板
%

\NeedsTexFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{BIThesis-Master}[2020/09/08 v1.0 BIThesis-Master class file]

%%%%% 预定义内容 %%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[UTF8,a4paper,zihao=-4,oneside,openany,space=auto]{ctexbook}
% 纸张要求及页面设置
\RequirePackage[
  paper=a4paper,    % A4
  top=3.5cm,        % 上 3.5cm
  bottom=2.5cm,     % 下 2.5cm
  left=2.7cm,       % 左 2.7cm
  right=2.7cm,      % 右 2.7cm
  headheight=1.0cm, % 页眉 2.5cm
  footskip=0.7cm    % 页脚 1.8cm
]{geometry}
\fancypagestyle{BIT@empty}{
  \fancyhf{}
}
\fancypagestyle{BIT@headings}{
  \fancyhf{}
  \fancyhead[C]{\sonti\zihao{5}北京理工大学硕士学位论文}
  \fancyfoot[C]{\sonti\zihao{5}\thepage}
}
% 英文字体设置
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
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
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
% 表
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}
% 引用
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}
% 浮动参数
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
% 颜色
\RequirePackage{xcolor}
% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}
% BITunderline
\def\BIT@underline[#1]#2{
  \underline{\hbox to #1{\hfill#2\hfill}}
}
\def\BITunderline{\@ifnextchar[\BIT@underline\underline]}
% BITspace
\newcommand{\BITspace}[1][1]{\hspace{#1\ccwd}}
% 修改 frontmatter 页码为大写罗马格式
\renewcommand{\frontmatter}{
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{BIT@headings}
}
% 修改 mainmatter 页码为阿拉伯格式
\renewcommand{\mainmatter}{
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{BIT@headings}
}

% ==================== %
% ===== 前置部分 ===== %
% ==================== %

%%%%% 封面 %%%%%
\newcommand{\makeCover}[1]{
  \clearpage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{60mm}
    {\heiti\zihao{-2} \BIT@value@title}       % 题目：黑体 小二
    \vskip 40mm
    {\heiti\zihao{-3} \BIT@value@author}      % 作者：黑体 小三
    \vskip 4mm
    {\heiti\zihao{-3} \BIT@value@defenseDate} % 时间：黑体 小三
  \end{center}
  \clearpage
}

%%%%% 题名页 %%%%%
% 中文题名页标题
\def\BIT@label@classification{中图分类号：}
\def\BIT@label@UDC{UDC~分类号：}
\def\BIT@label@title{论文题目}
\def\BIT@label@author{作者姓名}
\def\BIT@label@school{学院名称}
\def\BIT@label@mentor{指导教师}
\def\BIT@label@chairman{答辩委员会主席}
\def\BIT@label@degree{申请学位}
\def\BIT@label@major{学科专业}
\def\BIT@label@institute{学位授予单位}
\def\BIT@label@defenseDate{论文答辩日期}
% 中文题名页内容
\def\BIT@value@classification{TQ028.1}
\def\BIT@value@UDC{540}
\def\BIT@value@title{形状记忆聚氨酯的合成及其在纺织中的应用}
\def\BIT@value@author{***}
\def\BIT@value@school{材料学院}
\def\BIT@value@mentor{***教授}
\def\BIT@value@chairman{***教授}
\def\BIT@value@degree{工学硕士}
\def\BIT@value@major{材料科学与工程}
\def\BIT@value@institute{北京理工大学}
\def\BIT@value@defenseDate{2009年6月}
% 中文题名页命令
\newcommand{\classification}[1]{\def\BIT@value@classification{#1}}
\newcommand{\UDC}[1]{\def\BIT@value@UDC{#1}}
\newcommand{\title}[1]{\def\BIT@value@title{#1}}
\newcommand{\author}[1]{\def\BIT@value@author{#1}}
\newcommand{\school}[1]{\def\BIT@value@school{#1}}
\newcommand{\mentor}[1]{\def\BIT@value@mentor{#1}}
\newcommand{\chairman}[1]{\def\BIT@value@chairman{#1}}
\newcommand{\degree}[1]{\def\BIT@value@degree{#1}}
\newcommand{\major}[1]{\def\BIT@value@major{#1}}
\newcommand{\institute}[1]{\def\BIT@value@institute{#1}}
\newcommand{\defenseDate}[1]{\def\BIT@value@defenseDate{#1}}
% 中文题名页
\newcommand{\makeTitlePage}[1]{
  \newpage
  \clearpage
  \thispagestyle{empty}
  {
    {\heiti\zihao{5} \noindent \BIT@label@classification} \BIT@value@classification \\ % 中图分类号：Times New Roman 五号
    {\heiti\zihao{5} \noindent \BIT@label@UDC} \BIT@value@UDC                          % UDC 类号：Times New Roman 五号
  }
  \begin{center}
    \vskip \stretch{1}
      {\heiti\zihao{-2} \BIT@value@title}                                              % 论文题目：黑体 小二
    \vskip \stretch{1}
    {\fangsong\zihao{4}}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    {\heiti\zihao{-3}
      \begin{tabular}{l p{3mm} c}
        \BIT@label@author & & \BITunderline[180pt]{\BIT@value@author} \\               % 作者姓名：黑体 小三
        \BIT@label@school & & \BITunderline[180pt]{\BIT@value@school} \\               % 学院名称：黑体 小三
        \BIT@label@mentor & & \BITunderline[180pt]{\BIT@value@mentor} \\               % 指导教师：黑体 小三
        \BIT@label@chairman & & \BITunderline[180pt]{\BIT@value@chairman} \\           % 答辩委员会主席：黑体 小三
        \BIT@label@degree & & \BITunderline[180pt]{\BIT@value@degree} \\               % 申请学位级别：黑体 小三
        \BIT@label@major & & \BITunderline[180pt]{\BIT@value@major} \\                 % 学科专业：黑体 小三
        \BIT@label@institute & & \BITunderline[180pt]{\BIT@value@institute} \\         % 学位授予单位：黑体 小三
        \BIT@label@defenseDate & & \BITunderline[180pt]{\BIT@value@defenseDate}        % 论文答辩日期：黑体 小三
      \end{tabular}
    }
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
}
% 英文题名页标题
\def\BIT@label@titleEN{Thesis Title:}
\def\BIT@label@authorEN{Candidate Name:}
\def\BIT@label@schoolEN{School or Department:}
\def\BIT@label@mentorEN{Faculty Mentor:}
\def\BIT@label@chairmanEN{Chair, Thesis Committee:}
\def\BIT@label@degreeEN{Degree Applied:}
\def\BIT@label@majorEN{Major:}
\def\BIT@label@instituteEN{Degree by:}
\def\BIT@label@defenseDateEN{The Date of Defence:}
% 英文题名页内容
\def\BIT@value@titleEN{Synthesis and Application on textile of the Shape Memory Polyurethane}
\def\BIT@value@authorEN{***}
\def\BIT@value@schoolEN{Material Science and Engineering}
\def\BIT@value@mentorEN{Prof. ***}
\def\BIT@value@chairmanEN{Prof. ***}
\def\BIT@value@degreeEN{Master of Philosophy}
\def\BIT@value@majorEN{Material Science and Engineering}
\def\BIT@value@instituteEN{Beijing Institute of Technology}
\def\BIT@value@defenseDateEN{June, 2009}
% 英文题名页命令
\newcommand{\titleEN}[1]{\def\BIT@value@titleEN{#1}}
\newcommand{\authorEN}[1]{\def\BIT@value@authorEN{#1}}
\newcommand{\schoolEN}[1]{\def\BIT@value@schoolEN{#1}}
\newcommand{\mentorEN}[1]{\def\BIT@value@mentorEN{#1}}
\newcommand{\chairmanEN}[1]{\def\BIT@value@chairmanEN{#1}}
\newcommand{\degreeEN}[1]{\def\BIT@value@degreeEN{#1}}
\newcommand{\majorEN}[1]{\def\BIT@value@majorEN{#1}}
\newcommand{\instituteEN}[1]{\def\BIT@value@instituteEN{#1}}
\newcommand{\defenseDateEN}[1]{\def\BIT@value@defenseDateEN{#1}}
% 英文题名页
\newcommand{\makeTitlePageEN}[1]{
  \newpage
  \clearpage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{10em}
    {\zihao{-2}\textbf{\BIT@value@titleEN}}                                       % 论文题目：Times New Roman 小二 加粗
    \vskip \stretch{1}
    {\zihao{-3}
      \begin{tabular}{ll}
        \BIT@label@authorEN & \BITunerline[200pt]{\BIT@value@authorEN} \\         % 作者姓名：Times New Roman 小三
        \BIT@label@schoolEN & \BITunderline[200pt]{\BIT@value@schoolEN} \\        % 学院名称：Times New Roman 小三
        \BIT@label@mentorEN & \BITunderline[200pt]{\BIT@value@mentorEN} \\        % 指导教师：Times New Roman 小三
        \BIT@label@chairmanEN & \BITunderline[200pt]{\BIT@value@chairmanEN} \\    % 答辩委员会主席：Times New Roman 小三
        \BIT@label@degreeEN & \BITunderline[200pt]{\BIT@value@degreeEN} \\        % 申请学位级别：Times New Roman 小三
        \BIT@label@majorEN & \BITunderline[200pt]{\BIT@value@majorEN} \\          % 学科专业：Times New Roman 小三
        \BIT@label@instituteEN & \BITunderline[200pt]{\BIT@value@instituteEN} \\  % 学位授予单位：Times New Roman 小三
        \BIT@label@defenseDateEN & \BITunderline[200pt]{\BIT@value@defenseDateEN} % 论文答辩日期：Times New Roman 小三
      \end{tabular}
    }
  \end{center}
  \vskip \stretch{0.5}
  \clearpage
}

%%%%% 竖排论文题目和学位授予单位 %%%%%
% % 竖排页论文题目
% \def\BIT@value@vtitle{形状记忆聚氨酯的合成及其在织物中的应用}
% % 竖排页命令
% \newcommand{\vtitle}[1]{\def\BIT@value@vtitle{#1}}
\newcommand{\makeVerticalTitlePage}{
  \clearpage
  \thispagestyle{empty}
  \vskip 5cm
  \begin{center}
    \setstretch{1.1}
    \begin{minipage}{1em}
      % {\heiti\zihao{3}\BIT@value@vtitle}
      {\heiti\zihao{3}\BIT@value@title}
      \vskip 2cm
      {\heiti\zihao{3}\BIT@value@institute}
    \end{minipage}
  \end{center}
  \clearpage
}

%%%%% 版权使用授权及研究成果声明 %%%%%
% % 带圆圈数字
% \RequirePackage{tikz}
% \RequirePackage{etoolbox}
% \newcommand{\circled}[2]{
%   \tikz[baseline=(char.base)]{
%     \node[shape=circle,draw,inner sep=1pt] (char) {\phantom{\ifblank{#1}{#2}{#1}}};
%     \node at (char.center) {\makebox[0pt][c]{#2}};
%   }
% }
% 定义
\def\BIT@label@originality{研究成果声明}
\def\BIT@label@authorization{关于学位论文使用权的说明}
\def\BIT@label@authorSign{签名：}
\def\BIT@label@mentorSign{导师签名：}
\def\BIT@label@signDate{日期：}
\def\BIT@label@originalityContent{
  \BITspace\BITspace本人郑重声明：所提交的学位论文是我本人在指导教师的指导下进行的研究工作获得的研究成果。尽我所知，文中除特别标注和致谢的地方外，学位论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得北京理工大学或其它教育机构的学位或证书所使用过的材料。与我一同工作的合作者对此研究工作所做的任何贡献均已在学位论文中作了明确的说明并表示了谢意。
  \par特此申明。
}
\def\BIT@label@authorizationContent{
  \BITspace\BITspace本人完全了解北京理工大学有关保管、使用学位论文的规定，其中包括：①学校有权保管、并向有关部门送交学位论文的原件与复印件；②学校可以采用影印、缩印或其它复制手段复制并保存学位论文；③学校可允许学位论文被查阅或借阅；④学校可以学术交流为目的,复制赠送和交换学位论文；⑤学校可以公布学位论文的全部或部分内容（保密学位论文在解密后遵守此规定）。
}
\newcommand{\makeOriginalityPage}{
  \clearpage
  \pdfbookmark[0]{声明}{statement}
  \thispagestyle{empty}
  \begin{center}
    {\bf\zihao{3} \BIT@label@originality}
  \end{center}
  \vskip 10pt
  {\zihao{4}\BIT@label@originalityContent}
  \vskip 10pt
  \hspace{8em}{\zihao{4}\BIT@label@authorSign} \hspace{2em} {\zihao{4}\BIT@label@signDate}
  \vskip 30mm
  \begin{center}
    {\bf\zihao{3} BIT@label@authorization}
  \end{center}
  \vskip 10pt
  {\zihao{4} \BIT@label@authorizationContent}
  \vskip 40pt
  \hspace{8em}{\zihao{4}\BIT@label@authorSign} \hspace{2em} {\zihao{4}\BIT@label@signDate}
  \vskip 15pt
  \hspace{8em}{\zihao{4}\BIT@label@mentorSign} \hspace{2em} {\zihao{4}\BIT@label@signDate}
  \clearpage
}

%%%%% 摘要（中、英文） %%%%%
\def\BIT@label@abstract{摘要}
\newenvironment{abstract}{
  \clearpage
  % \chapter{\BIT@label@abstract}
}{}
\def\BIT@label@abstractEN{Abstract}
\newenvironment{abstractEN}{
  \clearpage
  % \chapter{\BIT@label@abstractEN}
}{}

%%%%% 关键词 %%%%%
\def\BIT@label@keywords{关键词：}
\newcommand{\keywords}[1]{
  \vspace{2ex}\noindent{\bf\BIT@label@keywords}#1
}
\def\BIT@label@keywordsEN{Key Words:~}
\newcommand{\keywordsEN}[1]{
  \vspace{2ex}\noindent{\bf\BIT@label@keywordsEN}#1
}

%%%%% 目录 %%%%%
\def\contentsname{目\BITspace录}
\newcommand{\TOC}{
  \chapter*{\contentsname}
  \pdfbookmark[0]{目录}{bittoc}
  \@starttoc[toc]
}
% 目录格式
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}
\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]
  {\songti\zihao{4}}
  {\bf\thecontentslabel\hspace{\ccwd}}{\bf}
  {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{section}[2\ccwd]
  {\songti\zihao{-4}}
  {\thecontentslabel\hspace{\ccwd}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{subsection}[4\ccwd]
  {\songti\zihao{-4}}
  {\thecontentslabel\hspace{\ccwd}}{}
  {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{figure}[0pt]
  {\songti\zihao{-4}}
  {\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
  {\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{table}[0pt]
  {\songti\zihao{-4}}
  {\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
  {\hspace{.5em}\titlerule*{.}\contentspage}

%%%%% 插图和附表清单（必要时） %%%%%
\def\listfigurename{插\BITspace图}
\def\listtablename{表\BITspace格}

%%%%% 符号、标志、缩略词、首字母缩写、单位、术语、名词等注释表（必要时） %%%%%
\def\BIT@label@denotation{主要符号对照表}
\newenvironment{denotation}[1][2.5cm]{
  \chapter{\bit@denotation@name}
  \noindent
  \begin{list}{}{
    \vskip-30bp\zihao{-4}
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
  }
}
{\end{list}}

% ==================== %
% ===== 主体部分 ===== %
% ==================== %

%%%%% 正文 %%%%%
\def\BIT@label@conclusion{结论}
\newenvironment{conclusion}{
  \chapter*{结论}
  \addcontentsline{toc}{chapter}{结论}
}
\parskip 0.5ex plus 0.25ex minus 0.25ex
% 设置行距大约为 22 磅
\RequirePackage{setspace}
\setstretch{1.523}
% 各章标题：黑体三号加粗居中，行距 22 磅，与正文或节标题的间距设定为段后间距 1 行。章序号与章名间空一格。
\ctexset{chapter={
  name={第,章},
  number={\arabic{chapter}},
  format={\bfseries\sffamily\centering\zihao{3}},
  pagestyle={BIT@headings},
  beforeskip=16bp,
  afterskip=32bp,
  fixskip=true
}}
% 一级节标题：黑体四号加粗顶左，行距 22 磅，与上一节的间距为 1 行，与下面正文或节标题的段间间距为 0.5 行。序号与题目间空一格。
\ctexset{section={
  format={\raggedright\bfseries\sffamily\zihao{4}},
  beforeskip=28bp plus 1ex minus .2ex,
  afterskip=24bp plus .2ex,
  fixskip=true
}}
% 二级节标题：黑体小四加粗顶左，行距 22 磅，与上一节的间距为 1 行，与下面正文或节标题的段间间距为 0.5 行。序号与题目间空一格。
\ctexset{subsection={
  format={\raggedright\bfseries\sffamily\zihao{-4}},
  beforeskip=28bp plus 1ex minus .2ex,
  afterskip=24bp plus .2ex,
  fixskip=true
}}
% 三级节标题：黑体小四居左书写，行距 22 磅，与上一节的间距为 0.5 行，与下面正文或节标题的段间间距为 0.5 行。序号与题目间空一格。
\ctexset{subsubsection={
  format={\raggedright\heiti\zihao{-4}},
  beforeskip=28bp plus 1ex minus .2ex,
  afterskip=24bp plus .2ex,
  fixskip=true
}}

%%%%% 参考文献 %%%%%
\def\BIT@label@reference{参考文献}
\bibliographystyle{GBT7714-2005NLang}
\renewcommand{thebibliography}[1]{
  \zihao{5}
  \chapter*{\bibname}
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
  \clubpenalty 4000
  \@clubpenalty \clubpenalty
  \widowpenalty 4000
  \sfcode`\.\@m
}
{\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}\endlist}

% ==================== %
% ===== 后置部分 ===== %
% ==================== %

%%%%% 附录（必要时） %%%%%
\def\BIT@label@appendix{附录}

%%%%% 攻读学位期间发表论文与研究成果清单 %%%%%
\def\BIT@label@publications{攻读学位期间发表论文与研究成果清单}
\newenvironment{publications}[1]{
  \chapter{\BIT@label@publications}
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
  \widowpenalty4000%
  \sfcode`\.\@m
}
{\def\@noitemerr{\@latex@warning{Empty `publications' environment}}\endlist}

%%%%% 致谢 %%%%%
\def\BIT@label@acknowledgments{致谢}
\renewcommand{acknowledgments}{
  \chapter{\BIT@label@acknowledgments}
  \fangsong
}

%%%%% 作者简介 %%%%%
\def\BIT@label@resume{作者简介}
\newenvironment{resume}{
  \chapter{\BIT@label@resume}
}
\newenvironment{resumesection}[1]{
  {\noindent\normalfont\bfseries #1}
  \list{}{\labelwidth\z@ \leftmargin 2\ccwd}
  \item \relax
}
{\endlist}
\newenvironment{resumeli}[1]{
  {\noindent\normalfont\bfseries #1}
  \list{}{\labelwidth\z@ \leftmargin 4\ccwd \itemindent -2\ccwd \listparindent\itemindent}
  \item \relax
}
{\endlist}

\endinput
