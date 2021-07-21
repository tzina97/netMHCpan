#' Uninstall NetMHCpan
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_netmhcpan <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  if (!is_netmhcpan_installed(netmhcpan_folder_name)
  ) {
    stop(
      "Cannot uninstall absent NetMHCpan ",
      "at folder '", netmhcpan_folder_name, "'"
    )
  }
  bin_file_path <- file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    basename(get_default_netmhcpan_bin_path())
  )
  testit::assert(file.exists(bin_file_path))
  unlink(x = netmhcpan_folder_name, recursive = TRUE)
}
