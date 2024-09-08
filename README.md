
<!-- README.md is generated from README.Rmd. Please edit that file -->

# depgraph: Plot the complete dependency graph of an R package

<!-- badges: start -->

[![CRAN/METACRAN](https://img.shields.io/cran/v/depgraph?label=CRAN&logo=r)](https://cran.r-project.org/web/packages/depgraph/index.html)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
![GitHub last commit
(devel)](https://img.shields.io/github/last-commit/crsh/depgraph/main?label=Last%20commit&logo=github&logoColor=%23FFF)
[![GitHub bug
issues](https://img.shields.io/github/issues/crsh/depgraph/bug?label=Bugs&logo=github&logoColor=%23FFF)](https://github.com/crsh/depgraph/issues?q=is%3Aopen+is%3Aissue+label%3Abug)

<!-- badges: end -->

Provides a function to plot the complete dependency graph of an R
package and helps to cut down on dependencies.

## Installation

<!-- 
You can install the released version of `depgraph` from [CRAN](https://CRAN.R-project.org) with:
&#10;``` r
install.packages("depgraph")
```
-->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("crsh/depgraph")
```

## Example

Currently, `depgraph` ships only a single function that plots the
dependency graph of an R package based on its `DESCRIPTION` file.
Consider the following example.

``` r
library("depgraph")

plot_dependency_graph(
  pkg = multibridge_pkg
  , suggests = FALSE
  , option = "cividis"
)
```

<div class="figure" style="text-align: center">

<img src="man/figures/README-unnamed-chunk-2-1.png" alt="Dependency graph of a historic development version of the R package `multibridge`." width="100%" />
<p class="caption">
Dependency graph of a historic development version of the R package
`multibridge`.
</p>

</div>

Such plots can be used for at least two purposes:

1.  Including dependency graphs in an R package `README` shows users how
    many packages their work depends on (indirectly). This is useful as
    a very rough index of package reliability (less dependencies
    generally mean less potential for breaking upstream changes) and
    installation time.
2.  Dependency graphs are useful to identify potential to cut down on
    dependencies. Briefly, in these graphs you can look for “hot spots”
    in the network (big bright dots), which represent packages that have
    many upstream dependencies but are potentially easy to remove
    because they have few downstream dependencies (that is, only your
    package depends on them).

Some more details on how to use this graph to reduce package
dependencies are given in the package vignette:

``` r
vignette("depgraph", package = "depgraph")
```

## Making an R package object

To make an object like `multibridge_pkg` you can use
`devtools::as.package`, along with the default path for an R library
`.libPaths()` . If your R libraries are not installed at `.libPaths`
you’ll have to find your installation location and append the package of
interest, see an example below.

``` r
# install.packages("devtools")
googlesheets4_pkg <- devtools::as.package(paste0(.libPaths(), "/googlesheets4"))
```

## Package dependencies

Yeah, I know…:see_no_evil:

``` r
plot_dependency_graph(
  pkg = "."
  , suggests = FALSE
  , option = "cividis"
)
```

<div class="figure" style="text-align: center">

<img src="man/figures/README-unnamed-chunk-4-1.png" alt="Dependency graph of `depgraph`." width="100%" />
<p class="caption">
Dependency graph of `depgraph`.
</p>

</div>
