#' Create a \code{netMHCpan} report, to be used when reporting bugs
#' @inheritParams default_params_doc
#' @examples
#' netMHCpan_report()
#' @author Richèl J.C. Bilderbeek
#' @export
netMHCpan_report <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder()
) {
  kat <- function(x) message(x, sep = "\n")
  kat("***************")
  kat("* NetMHCpan *")
  kat("***************")
  kat(paste0("OS: ", rappdirs::app_dir()$os))
  kat(paste0("'tcsh' installed: ", netMHCpan::is_tcsh_installed()))
  kat("**************")
  kat("* netMHCpan *")
  kat("**************")
  f <- netMHCpan_folder_name
  kat(paste0("bin installed: ", netMHCpan::is_netMHCpan_bin_installed(f)))
  kat(paste0("data installed: ", netMHCpan::is_netMHCpan_data_installed(f)))
  kat(paste0("is set up: ", netMHCpan::is_netMHCpan_set_up(f)))
  kat("****************")
  kat("* session info *")
  kat("****************")
  message(paste0(devtools::session_info(), collapse = "\n"))
}
