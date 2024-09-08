## ----include = FALSE------------------------------------------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----dependency-example, fig.align = "center", fig.height = 5, fig.width = 7, fig.cap = "Dependency graph of a historic development version of the R package `multibridge`.", warning = FALSE----
library(depgraph)

plot_dependency_graph(
  pkg = multibridge_pkg,
  suggests = FALSE,
  option = "cividis"
)


## ----fig.align = "center", fig.cap = "Dependency graph of a historic development version of the R package `multibridge` after removing `DescTools` from `Imports`.", fig.height = 5, fig.width = 7, warning = FALSE----
multibridge_pkg$imports <- gsub(
  "DescTools,\n", 
  "", 
  depgraph::multibridge_pkg$imports, 
  fixed = TRUE
)

depgraph::plot_dependency_graph(
  pkg = depgraph::multibridge_pkg,
  suggests = FALSE,
  option = "cividis"
)

