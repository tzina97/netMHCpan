#' Deprecated, use \link{get_netmhcpan_bin_url} instead
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhcpan_url <- function() {
  message(
    "'get_netmhcpan_url' is deprecated, use 'get_netmhcpan_bin_url' instead"
  )
  netmhcpan::get_netmhcpan_bin_url()
}
