#' netMHCpan: predict peptide binding strengths using NetMHCpan
#'
#' 'NetMHCpan' is a tool to predict the
#' binding strength of a short peptide to an MHC-II complex.
#' 'NetMHCpan' can be used from a web server at
#' 'http://www.cbs.dtu.dk/services/NetMHCpan/'
#' or from the command-line, using a local installation. This package
#' allows to call 'NetMHCpan' from R.
#' @examples
#' if (is_netMHCpan_installed()) {
#'
#'   predict_ic50(
#'     peptides = c("AIAACAMLLV", "ALVCYIVMPV"),
#'     mhc_haplotype = "DRB1_0416"
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name netMHCpan
NULL
