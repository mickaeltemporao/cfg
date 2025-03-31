# Rprofile
# ------------------------------------------------------------------------------
# Title:        R Profile
# Filename:     .Rprofile
# Description:  R environment customization
# Version:      0.0.0.005
# Created:      2016-11-05 17:13:28
# Modified:     2021-08-11 12:04:42
# Author:       Mickael Temporão < m dot temporao at sciencespobordeaux dot fr >
# ------------------------------------------------------------------------------
# Copyright (C) 2016 Mickael Temporão
# Licensed under the GPL-2 < https://www.gnu.org/licenses/gpl-2.0.txt >
# ------------------------------------------------------------------------------


.First <- function(){
}

.Last <- function(){
}

options(max.print = 200)
options(scipen = 10)
options(editor = "nvim")
options(menu.graphics = FALSE)
options(prompt = "> ")
options(continue = "... ")
options(browser = "qutebrowser")
options(menu.graphics = FALSE)

utils::assignInNamespace(
  "q", 
  function(save = "no", status = 0, runLast = TRUE) 
  {
    .Internal(quit(save, status, runLast))
  }, 
  "base"
)

Sys.setenv(TZ="Europe/London")
message("Successfully loaded mt's .Rprofile ------------------------\n")

