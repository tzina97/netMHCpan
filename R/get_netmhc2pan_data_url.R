#' Get the NetMHCIIpan data tarball URL.
#'
#' Get the NetMHCIIpan data tarball URL.
#' @seealso
#' Use \link{is_url_valid} to determine if the download URL is still valid.
#' Use \link{check_netmhc2pan_data_url} to get a helpful error message if this
#' URL is invalid.
#' @return a download URL
#' @author Richèl J.C. Bilderbeek
#' @export
get_netMHCpan_data_url <- function() {
  file.path(
    "https://services.healthtech.dtu.dk/services/NetMHCpan-4.1/data.tar.gz",
    netMHCpan::capitalize_first_char(
      basename(
        netMHCpan::get_default_netMHCpan_subfolder()
      )
    ),
    "data.Linux.tar.gz"
  )

}
