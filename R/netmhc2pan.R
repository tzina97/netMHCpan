#' netmhc2pan: predict peptide binding strengths using NetMHC2pan
#'
#' 'NetMHCIIpan' is a tool to predict the
#' binding strength of a short peptide to an MHC-II complex.
#' 'NetMHCIIpan' can be used from a web server at
#' 'https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-3.2'
#' or from the command-line, using a local installation. This package
#' allows to call 'NetMHCIIpan' from R.
#' @examples
#' if (is_netmhc2pan_installed()) {
#'
#'   predict_ic50(
#'     peptides = c("AIAACAMLLV", "ALVCYIVMPV"),
#'     mhc_haplotype = "DRB1_0416"
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @docType package
#' @name netmhc2pan
NULL
