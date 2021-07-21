#' Test NetMHCpan
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
netmhcpan_self_test <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder(),
  verbose = FALSE
) {
  netmhcpan::check_netmhcpan_installation(
    netmhcpan_folder_name = netmhcpan_folder_name
  )
  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhcpan"
  )
  netmhcpan::run_netmhcpan(
    fasta_filename = fasta_filename,
    netmhcpan_folder_name = netmhcpan_folder_name
  )
}
