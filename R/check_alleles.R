#' Check the allele names
#'
#' Check if the alleles have a valid NetMHC2pan name.
#' Will \link{stop} if not.
#' @seealso Use \link{to_netMHCpan_name} to convert
#' a formal name to an NetMHCpan name.
#' Use \link{get_netMHCpan_alleles} for a list
#' of all supported alleles (in NetMHCpan naming format).
#' @inheritParams default_params_doc
#' @return nothing
#' @author Richèl J.C. Bilderbeek
#' @examples
#' if (is_netMHCpan_installed()) {
#'   check_alleles("DRB1_0101")
#'   check_alleles(c("DRB1_0102", "DRB1_0103"))
#' }
#' @export
check_alleles <- function(
  alleles,
  netMHCpan_folder_name = get_default_netMHCpan_folder()
) {
  if (!all(alleles %in% netMHCpan::get_netMHCpan_alleles(
      netMHCpan_folder_name = netMHCpan_folder_name)
    )
  ) {
    stop(
      "Invalid 'alleles'\n",
      "\n",
      "Tip 1: use 'netMHCpan::to_netMHCpan_name()' to convert \n",
      "       a formal name to an NetMHCpan name. \n",
      "Tip 2: use 'netMHCpan::get_netMHCpan_alleles()' for a list\n",
      "       of all supported alleles"

    )
  }
}
