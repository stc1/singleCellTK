#' Run the single cell analysis app
#'
#' Use this function to run the single cell analysis app.
#'
#' @param inSCE The input SCtkExperiment class object
#'
#' @import GSVAdata Biobase DelayedArray
#'
#' @return The shiny app will open
#' @export
#' @examples
#' #Upload data through the app
#' if(interactive()){
#'   singleCellTK()
#' }
#'
#' #Load the app with a SCtkExperiment object
#' if(interactive()){
#'   data("mouseBrainSubsetSCE")
#'   singleCellTK(mouseBrainSubsetSCE)
#' }
#'
singleCellTK <- function(inSCE=NULL) {
  appDir <- system.file("shiny", package = "singleCellTK")
  if (!is.null(inSCE) & is.null(rownames(inSCE))){
    stop("ERROR: No row names (gene names) found.")
  }
  shiny::shinyOptions(inputSCEset = inSCE)
  shiny::runApp(appDir, display.mode = "normal")
}
