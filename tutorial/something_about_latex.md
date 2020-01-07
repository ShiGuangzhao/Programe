# 一些latex使用相关的笔记
## 使用bibtex插入参考文献
[参考](https://blog.csdn.net/caiandyong/article/details/70258670)
### 从EndNote导出参考文献：
- 选中相应的文献，选择 `file->export`。
- 导出格式为txt，style选择`bibtex export`。
- 导出后修改文件名后缀为`.bib`，如`ref.bib`。

### 文档编写：
1. 使用cite包
```latex
\usepackage{cite}
```

2. 在需要添加参考文献（目录）的地方插入：
```latex
\bibliographystyle{plain}
\bibliography{ref}
```
plain 为风格，ref为`ref.bib`的名字，常见风格如下：
> * plain，按字母的顺序排列，比较次序为作者、年度和标题
> * unsrt，样式同plain，只是按照引用的先后排序
> * alpha，用作者名首字母+年份后两位作标号，以字母顺序排序
> * abbrv，类似plain，将月份全拼改为缩写，更显紧凑
> * ieeetr，国际电气电子工程师协会期刊样式
> * acm，美国计算机学会期刊样式
> * siam，美国工业和应用数学学会期刊样式
> * apalike，美国心理学学会期刊样式

3. 引用方式为`\cite{ref}`，其中ref为bib文件条目的第一个单词。

### 编译
```bash
xelatex paper.tex   # 会生成paper.aux文件
bibtex paper.aux    # 生成paper.bbl即为参考文献
xelatex paper.tex   # 加入生成的参考文献
```
由于编译后只会加入引用了的文献，因此从EndNote导出时不必担心导出了却用不到，如果改变了引用到的文献，需重新编译。

### 存在的问题
bibtex格式文件存储于`texlive\2019\texmf-dist\bibtex\bst\`文件夹下，格式后缀名为`.bst`，经测试发现其中的`gbt7714`格式并不是我们通常使用的国标参考文献引用方式。

国标有2005和2015两个版本，这里先不做讨论，使用方法参考链接：[2005](https://github.com/Haixing-Hu/GBT7714-2005-BibTeX-Style)、[2015](https://github.com/CTeX-org/gbt7714-bibtex-style)、[南京大学学位论文模板](https://github.com/solrex/njuthesis)。


