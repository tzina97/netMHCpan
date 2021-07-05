#' Install NetMHCpan
#'
#' Install NetMHCpan to a local folder, by downloading the binary and
#' data files. Use \link{install_netMHCpan_from_files} to install
#' NetMHCpan from files that are already downloaded.
#'
#' These are three steps:
#'
#' \itemize{
#'   \item Install the NetMHCpan binary, using \link{install_netMHCpan_bin}
#'   \item Install the NetMHCpan data, using \link{install_netMHCpan_data}
#'   \item Set up NetMHCpan, using \link{set_up_netMHCpan}
#' }
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netMHCpan()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netMHCpan <- function(
  netMHCpan_bin_url = get_netMHCpan_bin_url(),
  netMHCpan_data_url = get_netMHCpan_data_url(),
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
    netMHCpan::install_netMHCpan_bin(
      netMHCpan_bin_url = netMHCpan_bin_url,
      verbose = verbose,
      netMHCpan_archive_filename = netMHCpan_archive_filename,
      netMHCpan_folder_name = netMHCpan_folder_name
    )
  }
  is_data_installed <- netMHCpan::is_netMHCpan_data_installed(
    netMHCpan_folder_name
  )
  if (!is_data_installed) { # nolint netMHCpan function
    netMHCpan::install_netMHCpan_data(
      netMHCpan_folder_name = netMHCpan_folder_name,
      verbose = verbose
    )
  }
  is_set_up <- netMHCpan::is_netMHCpan_set_up(netMHCpan_folder_name)
  if (!is_set_up) {
    netMHCpan::set_up_netMHCpan(netMHCpan_folder_name)
  }
  # Cannot install tcsh here
}
