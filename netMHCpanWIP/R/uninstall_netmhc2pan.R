#' Uninstall NetMHCIIpan
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_netMHCpan <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder()
) {
  if (!is_netMHCpan_installed(netMHCpan_folder_name)
  ) {
    stop(
      "Cannot uninstall absent NetMHCpan ",
      "at folder '", netMHCpan_folder_name, "'"
    )
  }
  bin_file_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    basename(get_default_netMHCpan_bin_path())
  )
  testit::assert(file.exists(bin_file_path))
  unlink(x = netMHCpan_folder_name, recursive = TRUE)
}
