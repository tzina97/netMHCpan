#' Install the NetMHCpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netmhcpan_bin_from_file <- function( # nolint indeed a long function name
  netmhcpan_bin_tarfile_path,
  verbose = FALSE,
  netmhcpan_archive_filename = get_netmhcpan_archive_filename(),
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  if (verbose) {
    message(
      "Installing NetMHCpan binary from file '",
      netmhcpan_bin_tarfile_path, "' into folder '", netmhcpan_folder_name,
      "'. \n"
    )

  }
  bin_path <- file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    basename(get_default_netmhcpan_bin_path())
  )

  if (file.exists(bin_path)) {
    stop ("NetMHCpan binary is already installed")
  }

  dir.create(
    path = netmhcpan_folder_name,
    showWarnings = FALSE,
    recursive = TRUE
  )

  testit::assert(file.exists(netmhcpan_bin_tarfile_path))
  # Linux has a tar file
  utils::untar(
    tarfile = netmhcpan_bin_tarfile_path,
    exdir = path.expand(netmhcpan_folder_name)
  )
  if (!file.exists(bin_path)) {
    stop("NetMHCpan binary not found at path '", bin_path, "'")
  }
  testit::assert(file.exists(bin_path))
}
