#' Install NetMHCpan
#'
#' Install NetMHCpan to a local folder, by downloading the binary and
#' data files. Use \link{install_netmhcpan_from_files} to install
#' NetMHCpan from files that are already downloaded.
#'
#' These are three steps:
#'
#' \itemize{
#'   \item Install the NetMHCpan binary, using \link{install_netmhcpan_bin}
#'   \item Install the NetMHCpan data, using \link{install_netmhcpan_data}
#'   \item Set up NetMHCpan, using \link{set_up_netmhcpan}
#' }
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netmhcpan()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhcpan <- function(
  netmhcpan_bin_url = get_netmhcpan_bin_url(),
  netmhcpan_data_url = get_netmhcpan_data_url(),
  verbose = FALSE,
  netmhcpan_archive_filename = get_netmhcpan_archive_filename(),
  netmhcpan_folder_name = get_default_netmhcpan_folder(),
  temp_local_file = tempfile(pattern = "netmhcpan_install_netmhcpan_")
) {
  is_bin_installed <- netmhcpan::is_netmhcpan_bin_installed(
    netmhcpan_folder_name = netmhcpan_folder_name,
    verbose = verbose
  )
  if (!is_bin_installed) {
    netmhcpan::install_netmhcpan_bin(
      netmhcpan_bin_url = netmhcpan_bin_url,
      verbose = verbose,
      netmhcpan_archive_filename = netmhcpan_archive_filename,
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  }
  is_data_installed <- netmhcpan::is_netmhcpan_data_installed(
    netmhcpan_folder_name
  )
  if (!is_data_installed) { # nolint netMHCpan function
    netmhcpan::install_netmhcpan_data(
      netmhcpan_folder_name = netmhcpan_folder_name,
      verbose = verbose
    )
  }
  is_set_up <- netmhcpan::is_netmhcpan_set_up(netmhcpan_folder_name)
  if (!is_set_up) {
    netmhcpan::set_up_netmhcpan(netmhcpan_folder_name)
  }
  # Cannot install tcsh here
}
