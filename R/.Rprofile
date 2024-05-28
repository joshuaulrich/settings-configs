##						Emacs please make this -*- R -*-
## empty Rprofile.site for R on Debian
##
## Copyright (C) 2008 Dirk Eddelbuettel and GPL'ed
##
## see help(Startup) for documentation on ~/.Rprofile and Rprofile.site

# ## Example of .Rprofile
# options(width=65, digits=5)
# options(show.signif.stars=FALSE)
# setHook(packageEvent("grDevices", "onLoad"),
#         function(...) grDevices::ps.options(horizontal=FALSE))
# set.seed(1234)
# .First <- function() cat("\n   Welcome to R!\n\n")
# .Last <- function()  cat("\n   Goodbye!\n\n")

# ## Example of Rprofile.site
local({
#  .libPaths("/home/josh/R/library")
#  setHook(packageEvent("Defaults", "attach"),
#    function(...) { setDefaults(q, save="no"); useDefaults(q) })
#   setDefaults(as.POSIXct.numeric,origin='1970-01-01')
  # add Defaults to the default packages
#  old <- getOption("defaultPackages")
  # set repository
  repos <- getOption("repos")
  repos["CRAN"] <- "https://cran.rstudio.com"
  # set options
#  options(defaultPackages = c(old, "Defaults"), repos = repos)
  options(repos = repos,
          prompt = "R$ ",
          getSymbols.warning4.0 = FALSE,
          java.parameters = c("-Xmx8g"),
          useFancyQuotes = FALSE,
          warnPartialMatchArgs = TRUE,
          warnPartialMatchAttr = TRUE,
          warnPartialMatchDollar = TRUE)

  conflictRules("dplyr", exclude = "lag")

  # bspm
  if (requireNamespace("bspm", quietly = TRUE)) {
      suppressMessages(bspm::enable())
      options(bspm.version.check = FALSE)
  }

  if (interactive()) {
    message(R.version$version.string)

    #ncolors <- try(as.numeric(system("xterm-color-count.sh", intern = TRUE)), silent = TRUE)
    ncolors <- 256
    have_colorout <- requireNamespace("colorout", quietly = TRUE)
    if (!inherits(ncolors, "try-error") && !is.na(ncolors) && have_colorout) {
      if (ncolors < 256) {
        colorout::setOutputColors(verbose = FALSE)
      } else {
        setColOut <- colorout::setOutputColors256
        setColOut(warn = c(1, 0, 208),
                  error = c(1, 0, 9),
                  verbose = FALSE)
      }
    }
  }
})
