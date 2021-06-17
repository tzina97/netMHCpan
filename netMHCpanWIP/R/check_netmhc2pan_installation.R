#' Checks the installation of NetMHCIIpan.
#'
#' Checks the installation of NetMHCIIpan.
#' Throws a helpful error message if incomplete,
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' # Will stop if NetMHC2pan is not installed
#' try(check_netmhc2pan_installation())
#' @author Richèl J.C. Bilderbeek
#' @export
check_netMHCpan_installation <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder()
) {
  if (!is_netMHCpan_bin_installed(
    netMHCpan_folder_name = netMHCpan_folder_name)
  ) {
    bin_file_path <- file.path(
      netMHCpan_folder_name,
      basename(get_default_netMHCpan_subfolder()),
      basename(get_default_netMHC2pan_bin_path())
    )
    netMHCpan_version <- stringr::str_match(
      bin_file_path,
      "[:digit:]\\.[:digit:]"
    )[1, 1]
    stop(
      "NetMHCpan binary not found at\n",
      bin_file_path, "\n",
      "\n",
      "Tip 1: from R, run 'netMHCpan::install_netMHCpan()'\n",
      "  with a (non-expired) download URL\n",
      "Tip 2: request a download URL at the NetMHCpan download page at\n",
      "\n",
      paste0(
        " http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?netMHCpan",
        netMHCpan_version,
        "\n"
      )
    )
  }
  if (!is_netMHCpan_data_installed(netMHCpan_folder_name)) {
    data_file_path <- file.path(
      netMHCpan_folder_name,
      basename(get_default_netmhc2pan_subfolder()),
      "data"
    )
    stop(
      "NetMHCpan data not found at\n",
      data_file_path, "\n",
      "\n",
      "Tip: from R, run 'netMHCpan::install_netMHCpan()'\n"
    )
  }
  if (!is_netMHCpan_set_up(netMHCpan_folder_name)) {
    stop(
      "NetMHCpan not set up completely\n",
      "\n",
      "Tip: from R, run 'nethMHCpan::install_netMHCpan()'\n"
    )
  }
  if (!is_tcsh_installed()) {
    stop(
      "Debian package 'tcsh' not found\n",
      "\n",
      "Tip: from the terminal, run 'sudo apt install tcsh'"
    )
  }
}
