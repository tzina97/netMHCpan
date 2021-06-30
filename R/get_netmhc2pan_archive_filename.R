#' Get the filename of the NetMHC2pan archive file
#' @inheritParams default_params_doc
#' @return the filename of the NetMHC2pan archive file
#' @examples
#' get_netmhc2pan_archive_filename()
#' @export
get_netMHCpan_archive_filename <- function( # nolint indeed a long function name
  netMHCpan_version = get_default_netMHCpan_version()
) {
  paste0("netMHCpan-", netMHCpan_version, ".Linux.tar.gz")
}
