#' Get the full path to the default NetMHCpan binary
#' @inheritParams default_params_doc
#' @return the full path to the default NetMHCpan binary
#' @examples
#' get_default_netmhcpan_bin_path()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netmhcpan_bin_path <- function( # nolint indeed a long name, I keep it for the sake of readability
  netmhcpan_subfolder = get_default_netmhcpan_subfolder()
) {
  file.path(netmhcpan_subfolder, "netMHCpan")
}
