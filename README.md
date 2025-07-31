# csstyle <a href="https://www.csids.no/csstyle/"><img src="man/figures/logo.png" align="right" width="120" /></a>

## Overview 

[csstyle](https://www.csids.no/csstyle/) is a comprehensive styling system for consistent visual outputs using CSIDS guidelines. It provides ggplot2 themes, color palettes, and dual formatting functions to standardize graphs, tables, and reports.

**Key Features:**

- **ggplot2 themes** with CSIDS styling and configurable options
- **Color palettes** with hierarchical system (primary, warning, posneg)
- **Dual formatting system**:
  - **Norwegian formatting** for domestic reports (comma decimal, space thousands, "IK" for missing)
  - **Journal formatting** for academic publications (decimal point, comma thousands, "NA" for missing)
- **Number formatting** for percentages, per-100k rates, and log transformations
- **Date formatting** with Norwegian conventions vs ISO 8601 standards

The package focuses on consistency over flexibility to ensure reproducible, professional outputs across different research contexts.

Run `help(package="csstyle")` for more information.

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
