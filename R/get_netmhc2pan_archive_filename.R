#' Get the filename of the NetMHCpan archive file
#' @inheritParams default_params_doc
#' @return the filename of the NetMHCpan archive file
#' @examples
#' get_netMHCpan_archive_filename()
#' @export
get_netMHCpan_archive_filename <- function( # nolint indeed a long function name
  netMHCpan_version = get_default_netMHCpan_version()
) {
  paste0("NetMHCpan-", netMHCpan_version, "/data.tar.gz")

}
