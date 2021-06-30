#' Get the path to the folder where this package installs
#' NetMHCIIpan by default
#' @return the path to the folder where this package installs
#'   NetMHCIIpan by default
#' @examples
#' get_default_netmhc2pan_folder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netMHCpan_folder <- function() {
  rappdirs::user_data_dir()
}
