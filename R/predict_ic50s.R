#' Predict the IC50s from a sequence
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with columns:\cr
#' \itemize{
#'   \item peptide the peptide fragment, each of length \code{peptide_length}
#'   \item ic50 the predicted IC50 (in nM)
#' }
#' The number of rows equals \code{protein_sequence - peptide_length + 1}.
#' @export
predict_ic50s <- function(
  protein_sequence,
  peptide_length,
  mhc_haplotype,
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  temp_fasta_filename = netMHCpan::create_temp_fasta_filename(),
  temp_xls_filename = netMHCpan::create_temp_xls_filename()
) {
  fasta_text <- c(">seq1", protein_sequence)
  readr::write_lines(x = fasta_text, temp_fasta_filename)

  # Cleans up 'temp_xls_filename'
  df <- netMHCpan::run_netMHCpan(
    fasta_filename = temp_fasta_filename,
    peptide_length = peptide_length,
    alleles = mhc_haplotype,
    temp_xls_filename = temp_xls_filename,
    netMHCpan_folder_name = netMHCpan_folder_name
  )
  file.remove(temp_fasta_filename)

  Peptide <- NULL; rm(Peptide) # nolint, fixes warning: no visible binding for global variable
  nM <- NULL; rm(nM) # nolint, fixes warning: no visible binding for global variable

  dplyr::select(
    tibble::as_tibble(df),
    peptide = Peptide,
    ic50 = nM
  )
}
