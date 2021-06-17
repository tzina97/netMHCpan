#' Install the NetMHCIIpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netMHCpan_bin_from_file <- function( # nolint indeed a long function name
  netMHCpan_bin_tarfile_path,
  verbose = FALSE,
  netMHCpan_archive_filename = get_netMHCpan_archive_filename(),
  netMHCpan_folder_name = get_default_netMHCpan_folder()
) {
  if (verbose) {
    message(
      "Installing NetMHCpan binary from file '",
      netMHCpan_bin_tarfile_path, "' into folder '", netMHCpan_folder_name,
      "'. \n"
    )

  }
  bin_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    basename(get_default_netMHCpan_bin_path())
  )

  if (file.exists(bin_path)) {
    stop("NetMHCpan binary is already installed at '", bin_path, "'")
  }

  dir.create(
    path = netMHCpan_folder_name,
    showWarnings = FALSE,
    recursive = TRUE
  )

  testit::assert(file.exists(netMHCpan_bin_tarfile_path))
  # Linux has a tar file
  utils::untar(
    tarfile = netMHCpan_bin_tarfile_path,
    exdir = path.expand(netMHCpan_folder_name)
  )
  if (!file.exists(bin_path)) {
    stop("NetMHCpan binary not found at path '", bin_path, "'")
  }
  testit::assert(file.exists(bin_path))
}
