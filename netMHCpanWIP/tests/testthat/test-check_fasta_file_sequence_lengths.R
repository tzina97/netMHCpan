test_that("use", {
  expect_silent(
    check_fasta_file_sequence_lengths(
      fasta_filename = system.file(
        "extdata", "example.fasta", package = "netmhc2pan"
      ),
      peptide_length = 13
    )
  )
  expect_silent(
    check_fasta_file_sequence_lengths(
      fasta_filename = system.file(
        "extdata", "example2.fasta", package = "netmhc2pan"
      ),
      peptide_length = 13
    )
  )

  fasta_filename <- tempfile()
  readr::write_lines(x = c(">seq1", "GTGG"), fasta_filename)
  expect_error(
    check_fasta_file_sequence_lengths(
      fasta_filename = fasta_filename,
      peptide_length = 13
    )
  )
})
