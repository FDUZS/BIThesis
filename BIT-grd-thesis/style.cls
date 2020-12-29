% ---------- 预定义格式和命令等 ----------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BIT-grd-thesis}[2020/06/30 BIT-grd-thesis LaTeX class]

% 纸张及页面设置
\RequirePackage[
    paper = a4paper,
    top = 3.5cm,
    bottom = 2.5cm,
    left = 2.7cm,
    right = 2.7cm,
    headheight = 1.0cm,
    footskip = 0.7cm
]{geometry}
% BITspace 空格
\newcommand{\BITspace}[1][1]{\hspace{#1\ccwd}}
% 带圆圈的数字序号
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\newcommand{\circled}[2][]{\tikz[baseline=(char.base)]
    {\node[shape = circle, draw, inner sep = 1pt]
    (char) {\phantom{\ifblank{#1}{#2}{#1}}};
    \node at (char.center) {\makebox[0pt][c]{#2}};}}
\robustify{\circled}

% ---------- 封面、题名页、竖排页 ----------
\def\BIT@label@Classification{中图分类号：}
\def\BIT@label@UDC{UDC 分类号：}

\def\BIT@value@Classification{}
\def\BIT@value@UDC{}

\def\BIT@label@TitleCN{}
\def\BIT@label@AuthorCN{作者姓名}
\def\BIT@label@InstituteCN{学院名称}
\def\BIT@label@MentorCN{指导教师}
\def\BIT@label@ChairmanCN{答辩委员会主席}
\def\BIT@label@DegreeCN{申请学位}
\def\BIT@label@MajorCN{学科专业}
\def\BIT@label@SchoolCN{学位授予单位}
\def\BIT@label@DateCN{论文答辩日期}

\def\BIT@value@TitleCN{}
\def\BIT@value@AuthorCN{}
\def\BIT@value@InstituteCN{}
\def\BIT@value@MentorCN{}
\def\BIT@value@ChairmanCN{}
\def\BIT@value@DegreeCN{}
\def\BIT@value@MajorCN{}
\def\BIT@value@SchoolCN{}
\def\BIT@value@DateCN{}

\def\BIT@label@TitleEN{}
\def\BIT@label@AuthorEN{Candidate Name:}
\def\BIT@label@InstituteEN{School or Department:}
\def\BIT@label@MentorEN{Faculty Mentor:}
\def\BIT@label@ChairmanEN{Chair, Thesis Committee:}
\def\BIT@label@DegreeEN{Degree Applied:}
\def\BIT@label@MajorEN{Major:}
\def\BIT@label@SchoolEN{Degree by:}
\def\BIT@label@DateEN{The Date of Defence:}

\def\BIT@value@TitleEN{}
\def\BIT@value@AuthorEN{}
\def\BIT@value@InstituteEN{}
\def\BIT@value@MentorEN{}
\def\BIT@value@ChairmanEN{}
\def\BIT@value@DegreeEN{}
\def\BIT@value@MajorEN{}
\def\BIT@value@SchoolEN{}
\def\BIT@value@DateEN{}

% ---------- 版权使用授权及研究成果声明 ----------
\def\BIT@label@Declaration{研究成果声明}
\def\BIT@label@Authorization{关于学位论文使用权的说明}
\def\BIT@label@AuthorSign{作者签名：}
\def\BIT@label@MentorSign{导师签名：}
\def\BIT@label@SignDate{签字日期：}

\def\BIT@label@DeclarationContent{\BITspace\BITspace 本人郑重声明：所提交的学位论文是我本人在
指导教师的指导下进行的研究工作获得的研究成果。尽我所知，文中除特别标注和致谢的地方外，学位论文中不
包含其他人已经发表或撰写过的研究成果，也不包含为获得北京理工大学或其他教育机构的学位或证书所使用过
的材料。与我一同工作的合作者对此研究工作所做的任何贡献均已在学位论文中作了明确的说明并表示了谢意。
\par 特此申明。}

\def\BIT@label@AuthorizationContent{\BITspace\BITspace 本人完全了解北京理工大学有关保管、使用
学位论文的规定，其中包括：\circled{1} 学校有权保管、并向有关部门送交学位论文的原件与复印件；
\circled{2} 学校可以采用影印、缩印或其他复制手段复制并保存学位论文；\circled{3} 学校可允许学位论
文被查阅或借阅；\circled{4} 学校可以学术交流为目的，复制赠送和交换学位论文；\circled{5} 学校可以
公布学位论文的全部或部分内容（保密学位论文在解密后遵守此规定）。}

% ---------- 摘要、关键词 ----------
\def\BIT@label@AbstractCN{摘要}
\def\BIT@label@KeywordsCN{关键词：}
\def\BIT@label@AbstractEN{Abstract}
\def\BIT@label@KeywordsEN{Key Words: }

% ---------- 目录 ----------
% 可自动生成，无需关心

% ---------- 插图索引、表格索引 ----------
% 可自动生成，无需关心

% ---------- 符号、缩略词、术语等注释表 ----------
% 按需，取消相关注释，自行编写添加

% ---------- 正文各章节 ----------

% ---------- 结论 ----------
\def\BIT@label@Conclusion{结论}

% ---------- 参考文献 ----------
% 可自动生成，无需关心

% ---------- 附录 ----------
\def\BIT@label@Appendix{附录}

% ---------- 发表的论文与研究成果清单 ----------
\def\BIT@label@Publications{攻读学位期间发表论文与研究成果清单}

% ---------- 致谢 ----------
\def\BIT@label@Acknowledgment{致谢}

% ---------- 作者简介 ----------
\def\BIT@label@Resume{作者简介}
