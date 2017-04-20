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
          prompt = "R> ",
          useFancyQuotes = FALSE)
})
