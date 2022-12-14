# csstyle <a href="https://www.csids.no/csstyle/"><img src="man/figures/logo.png" align="right" width="120" /></a>

## Overview 

[csstyle](https://www.csids.no/csstyle/) is a system for standardizing outputs (e.g. graphs, tables, reports). The standard tools for producing output are too flexible, allowing for too much variation and making it difficult to produce consistent outputs. This package focuses on producing a few limited outputs that consistently look the same.

Read the introduction vignette [here](http://www.csids.no/org/articles/csstyle.html) or run `help(package="csstyle")`.

## csverse

<a href="https://www.csids.no/packages.html"><img src="https://www.csids.no/packages/csverse.png" align="right" width="120" /></a>

The [csverse](https://www.csids.no/packages.html) is a set of R packages developed to help solve problems that frequently occur when performing disease surveillance.

If you want to install the dev versions (or access packages that haven't been released on CRAN), run `usethis::edit_r_profile()` to edit your `.Rprofile`. 

Then write in:

```
options(
  repos = structure(c(
    CSVERSE = "https://www.csids.no/drat/",
    CRAN    = "https://cran.rstudio.com"
  ))
)
```

Save the file and restart R.

You can now install [csverse](https://www.csids.no/packages.html) packages from our [drat repository](https://www.csids.no/drat/).

```
install.packages("csstyle")
```
