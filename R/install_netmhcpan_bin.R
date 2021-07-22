#' Install the NetMHCpan binary to a local folder
#'
#' Install the NetMHCpan binary to a local folder.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netmhcpan_bin()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhcpan_bin <- function(
  netmhcpan_bin_url = get_netmhcpan_bin_url(),
  verbose = FALSE,
  netmhcpan_archive_filename = get_netmhcpan_archive_filename(),
  netmhcpan_folder_name = get_default_netmhcpan_folder(),
  temp_local_file = tempfile(pattern = "netmhcpan_install_netmhcpan_bin_")
) {
  bin_path <- file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    basename(get_default_netmhcpan_bin_path())
  )
  if (file.exists(bin_path)) {
    return("NetMHCpan binary is already installed")
  }

  netmhcpan_bin_tarfile_path <- file.path(
    netmhcpan_folder_name,
    netmhcpan_archive_filename
  )
  dir.create(
    path = netmhcpan_folder_name,
    showWarnings = FALSE,
    recursive = TRUE
  )
  netmhcpan::check_can_create_file(
    filename = netmhcpan_bin_tarfile_path,
    overwrite = FALSE
  )
  netmhcpan::download_netmhcpan_bin(
    netmhcpan_bin_url = netmhcpan_bin_url,
    netmhcpan_bin_tarfile_path = netmhcpan_bin_tarfile_path,
    verbose = verbose,
    netmhcpan_archive_filename = netmhcpan_archive_filename,
    temp_local_file = temp_local_file
  )
  netmhcpan::install_netmhcpan_bin_from_file(
    netmhcpan_bin_tarfile_path = netmhcpan_bin_tarfile_path,
    verbose = verbose,
    netmhcpan_archive_filename = netmhcpan_archive_filename,
    netmhcpan_folder_name = netmhcpan_folder_name
  )
  testthat::expect_true(file.exists(bin_path))
}
