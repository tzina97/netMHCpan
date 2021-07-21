#' Check the allele names
#'
#' Check if the alleles have a valid NetMHCpan name.
#' Will \link{stop} if not.
#' @seealso Use \link{to_netmhcpan_name} to convert
#' a formal name to an NetMHCpan name.
#' Use \link{get_netmhcpan_alleles} for a list
#' of all supported alleles (in NetMHCpan naming format).
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_netmhcpan_installed()) {
#'   check_alleles("DRB1_0101")
#'   check_alleles(c("DRB1_0102", "DRB1_0103"))
#' }
#' @export
check_alleles <- function(
  alleles,
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  if (!all(alleles %in% netmhcpan::get_netmhcpan_alleles(
      netmhcpan_folder_name = netmhcpan_folder_name)
    )
  ) {
    stop(
      "Invalid 'alleles'\n",
      "\n",
      "Tip 1: use 'netmhcpan::to_netmhcpan_name()' to convert \n",
      "       a formal name to an NetMHCpan name. \n",
      "Tip 2: use 'netmhcpan::get_netmhcpan_alleles()' for a list\n",
      "       of all supported alleles"

    )
  }
}
