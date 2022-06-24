# opendata: aquire and process open datasets

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![](https://img.shields.io/badge/devel%20version-0.1.0.0000-blue.svg)](https://github.com/maxwestphal/opendata)
[![](https://www.r-pkg.org/badges/version/opendata?color=orange)](https://cran.r-project.org/package=opendata)
[![R build
status](https://github.com/maxwestphal/opendata/workflows/R-CMD-check/badge.svg)](https://github.com/maxwestphal/opendata/actions)
[![](https://app.codecov.io/gh/maxwestphal/opendata/branch/main/graph/badge.svg)](https://app.codecov.io/gh/maxwestphal/opendata)

------------------------------------------------------------------------

## Overview

The **opendata** package allows to aquire and process publicly available
datasets from the internet in R.

**The package is in a very early state and not recommended for
real-world use!**

------------------------------------------------------------------------

## Installation

This package can be installed from GitHub with the following command

    # install.packages("remotes") # install remotes pkg if needed
    remotes::install_github('maxwestphal/opendata', build_vignettes = TRUE)

------------------------------------------------------------------------

# Usage

You can obtain an overview of the available dataseets and their
properties as follows.

    library(opendata)
    str(datasets)

An individual dataset can be downloaded, processed and loaded into
memory with the following chain (pipe) of commands.

    data <- get_data(name = "wdbc") %>% 
      process_data() %>% 
      load_data()

    as_tibble(data)

The following (less verbose) shortcut version should be used by default.

    load_data("wdbc") %>% as_tibble()

In this case, the download and processing are skipped in case this has
already been performed in the past.

------------------------------------------------------------------------
