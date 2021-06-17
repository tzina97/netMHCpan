#' Check the lengths of the sequences in a FASTA file
#'
#' Check if the lengths of the sequences in a FASTA file
#' are at least equal to the desired peptide lengths.
#' @inheritParams default_params_doc
#' @return Nothing.
#' @examples
#' # FASTA file in which all proteons have a length of at keast 13
#' fasta_filename <- system.file(
#'   "extdata", "example.fasta", package = "netmhc2pan"
#' )
#' check_fasta_file_sequence_lengths(
#'   fasta_filename = fasta_filename,
#'   peptide_length = 13
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
check_fasta_file_sequence_lengths <- function(# nolint indeed a long name
  fasta_filename,
  peptide_length
) {
  alignment <- seqinr::read.fasta(fasta_filename)
  sequences <- unlist(seqinr::getSequence(alignment, as.string = TRUE))
  first_too_short_index <- utils::head(
    which(stringr::str_length(sequences) < peptide_length),
    n = 1
  )

  if (length(first_too_short_index) == 1) {
    stop(
      "Sequence in FASTA file shorter than the requested peptide length. \n",
      "'fasta_filename: ", fasta_filename, " \n",
      "'peptide_length: ", peptide_length, " \n",
      "'first_too_short_index: ", first_too_short_index, " \n",
      "sequence: ",
        paste0(
          seqinr::getSequence(alignment)[[first_too_short_index]],
          collapse = ""
        ), " \n"
    )
  }
}
