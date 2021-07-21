#' Checks the installation of NetMHCpan.
#'
#' Checks the installation of NetMHCpan.
#' Throws a helpful error message if incomplete,
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' # Will stop if NetMHCpan is not installed
#' try(check_netmhcpan_installation())
#' @author Richèl J.C. Bilderbeek
#' @export
check_netmhcpan_installation <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  if (!is_netmhcpan_bin_installed(
    netmhcpan_folder_name = netmhcpan_folder_name)
  ) {
    bin_file_path <- file.path(
      netmhcpan_folder_name,
      basename(get_default_netmhcpan_subfolder()),
      basename(get_default_netmhcpan_bin_path())
    )
    netmhcpan_version <- stringr::str_match(
      bin_file_path,
      "[:digit:]\\.[:digit:]"
    )[1, 1]
    stop(
      "NetMHCpan binary not found at\n",
      bin_file_path, "\n",
      "\n",
      "Tip 1: from R, run 'netmhcpan::install_netmhcpan()'\n",
      "  with a (non-expired) download URL\n",
      "Tip 2: request a download URL at the NetMHCpan download page at\n",
      "\n",
      paste0(
        " http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?netMHCpan",
        netmhcpan_version,
        "\n"
      )
    )
  }
  if (!is_netmhcpan_data_installed(netmhcpan_folder_name)) {
    data_file_path <- file.path(
      netmhcpan_folder_name,
      basename(get_default_netmhcpan_subfolder()),
      "data"
    )
    stop(
      "NetMHCpan data not found at\n",
      data_file_path, "\n",
      "\n",
      "Tip: from R, run 'netmhcpan::install_netmhcpan()'\n"
    )
  }
  if (!is_netmhcpan_set_up(netmhcpan_folder_name)) {
    stop(
      "NetMHCpan not set up completely\n",
      "\n",
      "Tip: from R, run 'netmhcpan::install_netmhcpan()'\n"
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
