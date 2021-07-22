#' Install the NetMHCpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   set_up_netmhcpan()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
set_up_netmhcpan <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder(),
  verbose = FALSE
) {
  if (verbose) {
    message("Set up NetMHCpan in folder '", netmhcpan_folder_name, "'")
  }
  bin_path <- file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    basename(get_default_netmhcpan_bin_path())
  )
  if (!file.exists(bin_path)) {
    stop(
      "NetMHCpan binary is absent at path '", bin_path, "'\n",
      "\n",
      "Tip: call 'netmhcpan::install_netmhcpan'\n",
      "     to install the NetMHCpan binary"
    )
  }
  lines <- readLines(bin_path)

  # Change sentenv
  setenv_line_idx <- which(
    lines == "setenv\tNMHOME\t/net/sund-nas.win.dtu.dk/storage/services/www/packages/netMHCpan/4.1/netMHCpan-4.1",
  )
  lines[setenv_line_idx] <- paste0("setenv\tNMHOME\t", dirname(bin_path))

  # No need to do this, as the tempfolder in the original script already points
  # to the '/tmp' temporary folder, instead of '/scratch'
  #
  # Change temp folder
  # tmpdir_line_idx <- which(
  #   lines == "\tsetenv  TMPDIR  /scratch"
  # )
  # lines[tmpdir_line_idx] <- "\tsetenv  TMPDIR  /tmp"

  writeLines(text = lines, con = bin_path)
}
