test_that("use", {
  if (!is_netmhcpan_installed()) return()

  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhcpan"
  )
  temp_xls_filename <- tempfile()
  df <- run_netmhcpan(
    fasta_filename,
    alleles = "HLA-A02:329",
    peptide_length = 15,
    temp_xls_filename = temp_xls_filename
  )

  # Must do cleanup
  expect_true(!file.exists(temp_xls_filename))

  expect_equal(
   colnames(df),
   c("Pos", "Peptide", "Identity", "Allele", "one_minus_log50k", "nM", "Rank")
  )
  expect_true(is.numeric(df$Pos))
  expect_true(!is.factor(df$Pos))
  expect_true(is.character(df$Peptide))
  expect_true(!is.factor(df$Peptide))
  expect_true(is.character(df$Identity))
  expect_true(!is.factor(df$Identity))
  expect_true(is.character(df$Allele))
  expect_true(!is.factor(df$Allele))
  expect_true(is.numeric(df$one_minus_log50k))
  expect_true(!is.factor(df$one_minus_log50k))
  expect_true(is.numeric(df$nM))
  expect_true(!is.factor(df$nM))
  expect_true(is.numeric(df$Rank))
  expect_true(!is.factor(df$Rank))
  names(df)
  expect_equal(7, nrow(df))
})

test_that("use, multiple alleles", {
  if (!is_netmhcpan_installed()) return()

  alleles <- c("HLA-A02:255", "HLA-A02:302")
  testit::assert(is_netmhcpan_installed())
  testit::assert(all(alleles %in% get_netmhcpan_alleles()))
  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhcpan"
  )
  temp_xls_filename <- tempfile()
  df <- run_netmhcpan(
    fasta_filename = fasta_filename,
    alleles = alleles,
    temp_xls_filename = temp_xls_filename
  )
  df

  # Long form
  expect_equal(18, nrow(df))
})

test_that("abuse", {

  if (!is_netmhcpan_installed()) return()

  fasta_filename <- tempfile()
  writeLines("Nonsense", fasta_filename)
  expect_error(
    run_netmhcpan(
      fasta_filename = fasta_filename,
      alleles = "BoLA-6:01401"
    ),
    "no line starting with a > character found"
  )


  fasta_filename <- system.file(
    "extdata", "example.fasta", package = "netmhcpan"
  )
  expect_error(
    run_netmhcpan(
      fasta_filename = fasta_filename,
      alleles = "nonsense"
    ),
    "Invalid 'alleles'"
  )
})

test_that("bug bbbq_1_fast", {
  # From (private) GitHub repo:
  # https://github.com/richelbilderbeek/bbbq_article/issues/55
  if (!is_netmhcpan_installed()) return()

  fasta_filename <- tempfile()
  readr::write_lines(x = c(">seq1", "GTGG"), fasta_filename)
  expect_error(
    run_netmhcpan(
      fasta_filename,
      alleles = "HLA-A02:397",
      peptide_length = 13
    ),
    "Sequence in FASTA file shorter than the requested peptide length"
  )
  file.remove(fasta_filename)
})
