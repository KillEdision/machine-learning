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
+ 在R软件的`library`目录下找到`rmarkdown`包，在`rmd`文件夹下找到`latex`文件夹，将`default.tex`和另一个`default-1.14.tex`打开，在`\begin{document}`前加入以下的代码
```latex
\usepackage{ctex}
\setmainfont{SimSun}
```
