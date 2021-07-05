#' Deprecated, use \link{get_netMHCpan_bin_url} instead
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netMHCpan_url <- function() {
  message(
    "'get_netMHCpan_url' is deprecated, use 'get_netMHCpan_bin_url' instead"
  )
  netMHCpan::get_netMHCpan_bin_url()
}
