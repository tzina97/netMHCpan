#' Test NetMHCIIpan
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
netMHCpan_self_test <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  verbose = FALSE
) {
  netMHCpan::check_netMHCpan_installation(
    netMHCpan_folder_name = netMHCpan_folder_name
  )
  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netMHCpan"
  )
  netMHCpan::run_netMHCpan(
    fasta_filename = fasta_filename,
    netMHCpan_folder_name = netMHCpan_folder_name
  )
}
