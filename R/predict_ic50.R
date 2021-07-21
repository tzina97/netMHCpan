#' Predict the IC50 for peptides.
#'
#' Predict the half maximal inhibitory concentration (aka IC50) (in nM)
#' for one or more peptides, where the peptides are used as-is,
#' instead of split into smaller peptides.
#' Each peptide must be 15 amino acids at
#' most (use \link{predict_ic50s} to predict the IC50s for longer peptides)
#' @note this function uses a temporary file, because NetMHCpan reads its
#' input from file. This temporary file is deleted after this function
#' passed successfully.
#' @return a \link[tibble]{tibble} with two columns:
#' (1) \code{peptide}, which holds the peptide sequence, and
#' (2) \code{ic50}, which holds the predicted IC50
#' @inheritParams default_params_doc
#' @examples
#' if (is_netmhcpan_installed()) {
#'
#'   predict_ic50(
#'     peptides = c("AIAACAMLLV", "ALVCYIVMPV"),
#'     mhc_haplotype = "DRB1_0416"
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
predict_ic50 <- function(
  peptides,
  mhc_haplotype,
  netmhcpan_folder_name = get_default_netmhcpan_folder(),
  temp_fasta_filename = netmhcpan::create_temp_fasta_filename(),
  temp_xls_filename = netmhcpan::create_temp_xls_filename()
) {
  if (any(nchar(peptides) > 15)) {
    stop(
      "'peptides' must have lengths of at most 15 amino acids. \n",
      "Tip: use 'predict_ic50s' to get the IC50s for longer peptides"
    )
  }
  t <- tibble::tibble(
    peptide = peptides,
    ic50 = NA
  )
  n_peptides <- length(peptides)
  for (i in seq_len(n_peptides)) {
    t$ic50[i] <- netmhcpan::predict_ic50s(
      protein_sequence = peptides[i],
      peptide_length = nchar(peptides[i]),
      mhc_haplotype = mhc_haplotype,
      netmhcpan_folder_name = netmhcpan_folder_name,
      temp_fasta_filename = temp_fasta_filename,
      temp_xls_filename = temp_xls_filename
    )$ic50
  }
  t
}
