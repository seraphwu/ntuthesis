[![Build Status](https://travis-ci.org/liao961120/ntuthesis.svg?branch=master)](https://travis-ci.org/liao961120/ntuthesis)

# ntuthesis

這是國立臺灣大學的論文模板，
基於 [bookdown](https://github.com/rstudio/bookdown) 的架構。
為了方便使用，這個模板將被製作成 R Package，方便使用者下載及使用內建函數。


輸出範例，請見：

- [中文 PDF](https://liao961120.github.io/ntuthesis/ntu-bookdown.pdf)
- [英文 PDF](https://liao961120.github.io/ntuthesis/ntu-bookdown-en.pdf)
- [GitBook](https://liao961120.github.io/ntuthesis/)


## 需求軟體

若曾經用 R Markdown 輸出 PDF 中文文件，則可忽略下方。

電腦尚未安裝 LaTeX 軟體，可以

- 直接安裝 [tinytex](https://yihui.name/tinytex/) R 套件
- 或安裝 LaTeX 軟體
    - Windows: MiKTeX
    - Linux: TeX Live

## 安裝
```r
devtools::install_github("liao961120/ntuthesis")
```

## 使用

開啟 RStudio，選取左上方 `File` > `New File` > `R Markdown`，
即會出現以下畫面：

![](https://raw.githubusercontent.com/liao961120/ntuthesis/master/img/rmd-template.png)

1. 選取左方`From Template`
2. 找到`Thesis Template for NTU`
3. 在下方`Name:`寫下創建的資料夾名稱

接著需要將該資料夾變更為 bookdown 專案。這可以用 RStudio 左上方 `File` > `New Project` > `Existing Directory` 達成，或直接使用下方指令：

```r
library(ntuthesis)
init_proj(dir = ".")))  # init working dir as proj.
```

### 輸出論文

在`person-info.yml`輸入個人資料後，執行以下指令即會生成封面：
```r
comp_front()
```


接著用下方指令或 RStudio Environment Pane 裡的 `Build Book` 輸出論文：
```r
bookdown::render_book("index.Rmd", "bookdown::gitbook")
bookdown::render_book("index.Rmd", "bookdown::bookdown::pdf_book")
```

![](https://raw.githubusercontent.com/liao961120/ntuthesis/master/img/build-button.png)

### 檔案結構

這個模板是使用 [bookdown](https://bookdown.org/yihui/bookdown/) 製作，因此所有 bookdown 的功能都可直接使用。

```yaml
├── index.Rmd            # Thesis Layout (font, watermark, biblio, ...)
├── _acknowledge.Rmd     # acknowledgement
├── _abstract-en.Rmd     # abstract
├── _abstract-zh.Rmd     # Same as above, but in Chinese
│
├── 01-intro.Rmd         # Chapter 1 content
├── 02-literature.Rmd    # Chapter 2 content
├── 03-method.Rmd        # Chapter 3 content
├── 99-references.Rmd    # Don't need to edit
├── ref.bib              # References
├── cite-style.csl       # Citation style
│
├── _bookdown.yml        # Label names in Gitbook; Rmd files order
├── _output.yml          # PDF thesis Language, Citation pkg
│
├── person-info.yml         # Info to generate front matter
├── certification-scan.pdf  # 已簽名'口試委員審查書'
├── front_matter
│   └── certification.pdf   # 空白'口試委員審查書'
└── watermark.pdf           # 臺大浮水印 (PDF 右上角)
```




## To Do

1. [bookdown define LaTeX](https://bookdown.org/yihui/bookdown/publishers.html)
1. self-defined chunks?
1. test biblatex
1. 整理成 R Package
1. 使用說明
    - [R Markdown ordered list](https://stackoverflow.com/a/52539925)
    - [Bookdown cheatsheet](www.pzhao.org/en/post/bookdown-cheatsheet/)
    - [Bookdown Contest](https://blog.rstudio.com/2018/07/27/first-bookdown-contest/)

## 附註

[1]: LaTeX 的封面模板是根據 [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis) 修改而成。
