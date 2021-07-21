#' Create a \code{netmhcpan} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' netmhcpan_report()
#' @author Richèl J.C. Bilderbeek
#' @export
netmhcpan_report <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  kat <- function(x) message(x, sep = "\n")
  kat("***************")
  kat("* NetMHCpan *")
  kat("***************")
  kat(paste0("OS: ", rappdirs::app_dir()$os))
  kat(paste0("'tcsh' installed: ", netmhcpan::is_tcsh_installed()))
  kat("**************")
  kat("* netMHCpan *")
  kat("**************")
  f <- netmhcpan_folder_name
  kat(paste0("bin installed: ", netmhcpan::is_netmhcpan_bin_installed(f)))
  kat(paste0("data installed: ", netmhcpan::is_netmhcpan_data_installed(f)))
  kat(paste0("is set up: ", netmhcpan::is_netmhcpan_set_up(f)))
  kat("****************")
  kat("* session info *")
  kat("****************")
  message(paste0(devtools::session_info(), collapse = "\n"))
}
