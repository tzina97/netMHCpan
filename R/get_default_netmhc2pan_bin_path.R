#' Get the full path to the default NetMHCpan binary
#' @inheritParams default_params_doc
#' @return the full path to the default NetMHCpan binary
#' @examples
#' get_default_netMHCpan_bin_path()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netMHCpan_bin_path <- function( # nolint indeed a long name, I keep it for the sake of readability
  netMHCpan_subfolder = get_default_netMHCpan_subfolder()
) {
  file.path(netMHCpan_subfolder, "netMHCpan")
}
