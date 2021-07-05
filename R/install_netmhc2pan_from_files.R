#' Install NetMHCpan from files.
#'
#' Install NetMHCpan to a local folder from (already downloaded)
#' binary and date tarball files.
#' Use \link{install_netMHCpan} to install
#' NetMHCpan by downloading these files
#'
#' These are three steps:
#'
#' \itemize{
#'   \item Install the NetMHCpan binary,
#'     using \link{install_netMHCpan_bin_from_file}
#'   \item Install the NetMHCpan data,
#'     using \link{install_netMHCpan_data_from_file}
#'   \item Set up NetMHCpan, using \link{set_up_netMHCpan}
#' }
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netMHCpan_from_files <- function(
  netMHCpan_bin_tarfile_path,
  netMHCpan_data_tarfile_path,
  verbose = FALSE,
  netMHCpan_archive_filename = get_netMHCpan_archive_filename(),
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  temp_local_file = tempfile(pattern = "netMHCpan_install_netMHCpan_")
) {
  is_bin_installed <- netMHCpan::is_netMHCpan_bin_installed(
    netMHCpan_folder_name = netMHCpan_folder_name,
    verbose = verbose
  )
  if (!is_bin_installed) {
    if (verbose) {
      message(
        "NetMHCpan binary not found at folder '", netMHCpan_folder_name,
        "'. \n"
      )
    }
    netMHCpan::install_netMHCpan_bin_from_file(
      netMHCpan_bin_tarfile_path = netMHCpan_bin_tarfile_path,
      verbose = verbose,
      netMHCpan_archive_filename = netMHCpan_archive_filename,
      netMHCpan_folder_name = netMHCpan_folder_name
    )
  }
  is_data_installed <- netMHCpan::is_netMHCpan_data_installed(
    netMHCpan_folder_name
  )
  if (!is_data_installed) { # nolint netMHCpan function
    netMHCpan::install_netMHCpan_data_from_file(
      netMHCpan_data_tarfile_path = netMHCpan_data_tarfile_path,
      netMHCpan_folder_name = netMHCpan_folder_name,
      verbose = verbose
    )
  }
  is_set_up <- netMHCpan::is_netMHCpan_set_up(netMHCpan_folder_name)
  if (!is_set_up) {
    if (verbose) {
      message(
        "NetMHCpan not set up at folder '", netMHCpan_folder_name,
        "'. \n"
      )
    }
    netMHCpan::set_up_netMHCpan(
      netMHCpan_folder_name,
      verbose = verbose
    )
  }
  # Cannot install tcsh here
}
