#' Install the NetMHCpan binary to a local folder
#'
#' Install the NetMHCpan binary to a local folder.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netMHCpan_bin()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netMHCpan_bin <- function(
  netMHCpan_bin_url = get_netMHCpan_bin_url(),
  verbose = FALSE,
  netMHCpan_archive_filename = get_netMHCpan_archive_filename(),
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  temp_local_file = tempfile(pattern = "netMHCpan_install_netMHCpan_bin_")
) {
  bin_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    basename(get_default_netMHCpan_bin_path())
  )
  if (file.exists(bin_path)) {
    return ("NetMHCpan binary is already installed")
  }

  netMHCpan_bin_tarfile_path <- file.path(
    netMHCpan_folder_name,
    netMHCpan_archive_filename
  )
  dir.create(
    path = netMHCpan_folder_name,
    showWarnings = FALSE,
    recursive = TRUE
  )
  netMHCpan::check_can_create_file(
    filename = netMHCpan_bin_tarfile_path,
    overwrite = FALSE
  )
  netMHCpan::download_netMHCpan_bin(
    netMHCpan_bin_url = netMHCpan_bin_url,
    netMHCpan_bin_tarfile_path = netMHCpan_bin_tarfile_path,
    verbose = verbose,
    netMHCpan_archive_filename = netMHCpan_archive_filename,
    temp_local_file = temp_local_file
  )
  netMHCpan::install_netMHCpan_bin_from_file(
    netMHCpan_bin_tarfile_path = netMHCpan_bin_tarfile_path,
    verbose = verbose,
    netMHCpan_archive_filename = netMHCpan_archive_filename,
    netMHCpan_folder_name = netMHCpan_folder_name
  )
  testthat::expect_true(file.exists(bin_path))
}
