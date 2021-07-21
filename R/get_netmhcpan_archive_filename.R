#' Get the filename of the NetMHCpan archive file
#' @inheritParams default_params_doc
#' @return the filename of the NetMHCpan archive file
#' @examples
#' get_netmhcpan_archive_filename()
#' @export
get_netmhcpan_archive_filename <- function( # nolint indeed a long function name
  netmhcpan_version = get_default_netmhcpan_version()
) {
  paste0("netMHCpan-", netmhcpan_version, "b.Linux.tar.gz")

}
