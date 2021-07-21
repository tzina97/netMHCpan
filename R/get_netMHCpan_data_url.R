#' Get the NetMHCpan data tarball URL.
#'
#' Get the NetMHCpan data tarball URL.
#' @seealso
#' Use \link{is_url_valid} to determine if the download URL is still valid.
#' Use \link{check_netmhcpan_data_url} to get a helpful error message if this
#' URL is invalid.
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhcpan_data_url <- function() {
  file.path(
    "https://services.healthtech.dtu.dk/services",
    netmhcpan::capitalize_first_char(
      basename(
        netmhcpan::get_default_netmhcpan_subfolder()
      )
    ),
    "data.tar.gz"
  )

}
