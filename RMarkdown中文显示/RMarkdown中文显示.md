## RMarkdown中文显示

### sessionInfo
```r
sessionInfo()
```
```
R version 3.2.1 (2015-06-18)
Platform: i386-w64-mingw32/i386 (32-bit)
Running under: Windows 7 (build 7601) Service Pack 1

locale:
[1] LC_COLLATE=Chinese (Simplified)_People's Republic of China.936 
[2] LC_CTYPE=Chinese (Simplified)_People's Republic of China.936   
[3] LC_MONETARY=Chinese (Simplified)_People's Republic of China.936
[4] LC_NUMERIC=C                                                   
[5] LC_TIME=Chinese (Simplified)_People's Republic of China.936    

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
[1] showtext_0.4-2 sysfonts_0.5  

loaded via a namespace (and not attached):
[1] htmltools_0.2.6 tools_3.2.1     yaml_2.1.13     showtextdb_1.0  rmarkdown_0.7   knitr_1.10.5    digest_0.6.8 
```

### RMarkdown生成PDF中文显示方法

#### 方法1
在R软件的`library`目录下找到`rmarkdown`包，在`rmd`文件夹下找到`latex`文件夹，将`default.tex`和另一个`default-1.14.tex`打开，在`\begin{document}`前加入以下的代码：
```latex
\usepackage{ctex}
\setmainfont{SimSun}
```
或者是加入下面的代码：
```latex
\usepackage{xeCJK}  
\setCJKmainfont{simsun.ttc}
```
上面的两种方法皆可，然后切换到RMarkdown工作环境下，将编译软件选为`xelatex`即可。

#### 方法2
在该Rmd文件同一目录下，新建一个`header.tex`的文件，内容如下：
```latex
\usepackage{xeCJK}  
\setCJKmainfont{simsun.ttc}
```
或者
```latex
\usepackage{ctex}
\setmainfont{SimSun}
```
然后用`includes`字段把它插入模板中：
```rmd
title: "面向深度学习的R语言线性代数速查"
author: "赵奇"
date: "2015年8月17日"
output: 
  pdf_document: 
    highlight: espresso
    latex_engine: xelatex
    includes:
      in_header: header.tex
    number_sections: yes
    toc: yes
    toc_depth: 3
---
```
至此，Rmd文件显示中文问题已经解决了。然而，另外一个问题是怎样使Rmd文件中生成的图形中的中文也正常显示出来。  
解决这个问题需要使用到`showtext`包，因此可以在Rmd文件的开头加入下面的代码
```rmd
```{r}
library(knitr)
library(showtext)
opts_chunk$set(fig.showtext = TRUE,prompt = TRUE,message = FALSE,warning = FALSE)
```
```
