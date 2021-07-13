#' Get the NetMHCpan binary download URL.
#'
#' Get the URL for the NetMHCpan binary, as is emailed.
#' These expire after 4 hours.
#' @seealso
#' Use \link{is_url_valid} to determine if the download URL is still valid.
#' Use \link{check_netMHCpan_bin_url} to get a helpful error message if this
#' URL is invalid.
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netMHCpan_bin_url <- function() {
  " https://services.healthtech.dtu.dk/services" # nolint indeed a long URL
}
