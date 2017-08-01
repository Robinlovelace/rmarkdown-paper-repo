The title of your paper
================
Robin Lovelace (University of Leeds)

<!-- README.md is generated from README.Rmd. Please edit that file -->
User guide
==========

This repo is designed to make reproducible and open source write-ups easy. It has minimal dependencies and is as simple as possible whilst retaining the key features that any decent paper template repo should have. These features, and how to use them, are listed below:

-   [references.bib](references.bib): Add your references here in .bib format. Read more about the trusty .bib format at [bibtex.org](http://www.bibtex.org/Format/) or check-out an excellent paper on handling `.bib` files in R based on the **RefManageR** package (McLean, 2014).
-   [figures/](): this is where to store your figures.
-   [input/](https://github.com/Robinlovelace/rmarkdown-paper-repo/tree/master/input): put public facing example data here
-   [output/](https://github.com/Robinlovelace/rmarkdown-paper-repo/tree/master/output): folder of output data
-   [code/](https://github.com/Robinlovelace/rmarkdown-paper-repo/tree/master/code): folder to place your reproducible scripts, in R or another language. We refrain from using a folder called R as that could conflict with future efforts to convert your paper into an R package.
-   [README.Rmd](): the document your reading. You can write you paper as a `github_document` in the README for maximum simplicity and ease of viewing. Later you could change the output to something more fancy, e.g. using the following YAML heading, which makes use of the [**rticles**](https://github.com/rstudio/rticles) package:

``` yaml
---
title: 'The title of your paper'
# author:
# - Robin Lovelace (University of Leeds)
# - Another Person (University of Life)
csl: elsevier-harvard.csl # the reference format
output:
  rticles::elsevier_article: # uncomment this and subsequent comments for Elsevier
  bookdown::pdf_document2:
    number_sections: yes
author: # remember to comment-out/delete the previous author info if you use this
  - name: Alice Anonymous
    email: alice@example.com
    affiliation: Some Institute of Technology
    footnote: Corresponding Author
  - name: Bob Security
    email: bob@example.com
    affiliation: Another University
address:
  - code: Some Institute of Technology
    address: Department, Street, City, State, Zip
  - code: Another University
    address: Department, Street, City, State, Zip
abstract: |
  This is the abstract.
bibliography: references.bib
---
```

Introduction
============

Reproducibility is an increasingly important (some would say vital) component of academic research and, thanks to new software, is increasingly easy to implement (Jim’enez et al., 2017). For a detailed account of how to write reproducible papers in the context of recent versions of R/RStudio, please refer to an article by [Roel Hogervorst](https://www.r-bloggers.com/writing-manuscripts-in-rstudio-easy-citations/).

For more on the subject, please see the bookdown package, which is explained in an online [book](https://bookdown.org/yihui/bookdown/) (Xie, 2016), and the [CRAN Task View](https://cran.r-project.org/web/views/ReproducibleResearch.html) on reproducible research.

Methods
=======

A great benefit of RMarkdown is that you can embed your code (revealed or hidden with `echo=FALSE`) to show exactly how your results were generated. To provide an example, below is the code that was used to generate the `references.bib` file in this repo:

``` r
devtools::install_github("ropensci/RefManageR")
## Skipping install of 'RefManageR' from a github remote, the SHA1 (bd92bf7b) has not changed since last install.
##   Use `force = TRUE` to force installation
library(RefManageR)
refs = ReadPubMed(query = "Reproducibility")
pkg_ref1 = as.BibEntry(citation(package = "RefManageR"))
pkg_ref2 = as.BibEntry(citation(package = "bookdown"))
refs = c(refs, pkg_ref1, pkg_ref2)
WriteBib(refs, "references.bib")
## Writing 23 Bibtex entries ...
## OK
## Results written to file 'references.bib'
```

Other useful commands for setting up paper repos:

``` r
dir.create("input") # create a folder
## Warning in dir.create("input"): 'input' already exists
input1 = data.frame(x = 1:9)
input1 = readr::write_csv(input1, "input/example-input1.csv")
```

To source code stored in the code directory, you can use the `source()` function:

``` r
source("code/process-data.R")
```

Results
=======

You can also include plot, as illustrated in the text below which generates Figure 1. Note that when using `bookdown::pdf_document2` as the output (as illustrated in the example YAML code above) the syntax `\@ref(fig:basic-plot)` can be used to refer to plots with *automatic numbering*, e.g. Figure @ref(fig:basic-plot).

``` r
plot(matrix(rpois(n = 2e3, lambda = 9), ncol = 2))
```

![A basic plot.](figures/basic-plot-1.png)

See the results of using `bookdown::pdf_document2` output option in the repos Releases tab. It's good practice to avoid placing binary file formats such as .pdf files in your github repos to keep them small and easy to navigate and read.

Conclusion
==========

Conclusions go here.

In conclusion this template repo provides some ideas and content that should help you create a more reproducible workflow when writing R code. To test if it's reproducible, try to reproduce it:

-   Clone or download and unzip the repo, e.g. by pressing the `Clone or Download` button at [github.com/Robinlovelace/rmarkdown-paper-repo](https://github.com/Robinlovelace/rmarkdown-paper-repo/archive/master.zip).
-   Open the project in RStudio, e.g. by File &gt; Open File.
-   Open the README.Rmd file and click on the 'knit' button to see if it rebuilds.

There are many further steps you could take, including creating a Docker container, Continuous Integration and package development. However, I think this small repo template should serve most paper writing needs. As Albert Einstein [put it](http://quoteinvestigator.com/2011/05/13/einstein-simple/):

> It can scarcely be denied that the supreme goal of all theory is to make the irreducible basic elements as simple and as few as possible without having to surrender the adequate representation of a single datum of experience.

In conclusion, this small template repo provides some basic guidance and content that should make reproducible report/paper writing straightforward and fun.

References
==========

Jim’enez, R.C., Kuzak, M., Alhamdoosh, M., Barker, M., Batut, B., Borg, M., Capella-Gutierrez, S., Hong, N.C., Cook, M., Corpas, M., Flannery, M., Garcia, L., Gelp’i, J.L., Gladman, S., Goble, C., Ferreiro, M.G., Gonzalez-Beltran, A., Griffin, P.C., Grüning, B., Hagberg, J., Holub, P., Hooft, R., Ison, J., Katz, D.S., Leskošek, B., G’omez, F.L., Oliveira, L.J., Mellor, D., Mosbergen, R., Mulder, N., Perez-Riverol, Y., Pergl, R., Pichler, H., Pope, B., Sanz, F., Schneider, M.V., Stodden, V., Suchecki, R., Vařekov’a, R.S., Talvik, H.-A., Todorov, I., Treloar, A., Tyagi, S., van Gompel, M., Vaughan, D., Via, A., Wang, X., Watson-Haigh, N.S., Crouch, S., 2017. Four simple recommendations to encourage best practices in research software. F1000Research 6. doi:[10.12688/f1000research.11407.1](https://doi.org/10.12688/f1000research.11407.1)

McLean, M.W., 2014. Straightforward bibliography management in r using the refmanager package.

Xie, Y., 2016. Bookdown: Authoring books and technical documents with R markdown. Chapman; Hall/CRC, Boca Raton, Florida.
