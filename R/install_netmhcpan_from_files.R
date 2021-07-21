#' Install NetMHCpan from files.
#'
#' Install NetMHCpan to a local folder from (already downloaded)
#' binary and date tarball files.
#' Use \link{install_netmhcpan} to install
#' NetMHCpan by downloading these files
#'
#' These are three steps:
#'
#' \itemize{
#'   \item Install the NetMHCpan binary,
#'     using \link{install_netmhcpan_bin_from_file}
#'   \item Install the NetMHCpan data,
#'     using \link{install_netmhcpan_data_from_file}
#'   \item Set up NetMHCpan, using \link{set_up_netmhcpan}
#' }
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhcpan_from_files <- function(
  netmhcpan_bin_tarfile_path,
  netmhcpan_data_tarfile_path,
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
    if (verbose) {
      message(
        "NetMHCpan binary not found at folder '", netmhcpan_folder_name,
        "'. \n"
      )
    }
    netmhcpan::install_netmhcpan_bin_from_file(
      netmhcpan_bin_tarfile_path = netmhcpan_bin_tarfile_path,
      verbose = verbose,
      netmhcpan_archive_filename = netmhcpan_archive_filename,
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  }
  is_data_installed <- netmhcpan::is_netmhcpan_data_installed(
    netmhcpan_folder_name
  )
  if (!is_data_installed) { # nolint netmhcpan function
    netmhcpan::install_netmhcpan_data_from_file(
      netmhcpan_data_tarfile_path = netmhcpan_data_tarfile_path,
      netmhcpan_folder_name = netmhcpan_folder_name,
      verbose = verbose
    )
  }
  is_set_up <- netmhcpan::is_netmhcpan_set_up(netmhcpan_folder_name)
  if (!is_set_up) {
    if (verbose) {
      message(
        "NetMHCpan not set up at folder '", netmhcpan_folder_name,
        "'. \n"
      )
    }
    netmhcpan::set_up_netmhcpan(
      netmhcpan_folder_name,
      verbose = verbose
    )
  }
  # Cannot install tcsh here
}
