test_that("use", {

  xls_filename <- system.file(
    "extdata", "example.xls", package = "netmhcpan"
  )
  t <- read_netmhcpan_xls_output(xls_filename)

  expect_true("Pos" %in% names(t))
  expect_true("Peptide" %in% names(t))
  expect_true("ID" %in% names(t))
  expect_true("one_minus_log50k" %in% names(t))
  expect_true("nM" %in% names(t))
  expect_true("Rank" %in% names(t))
  expect_true("Ave" %in% names(t))
  expect_true("NB" %in% names(t))
})

test_that("use", {


  xls_filename <- system.file(
    "extdata", "example2.xls", package = "netmhcpan"
  )
  t <- read_netmhcpan_xls_output(xls_filename)

  expect_true("Pos" %in% names(t))
  expect_true("Peptide" %in% names(t))
  expect_true("ID" %in% names(t))
  expect_true("one_minus_log50k" %in% names(t))
  expect_true("nM" %in% names(t))
  expect_true("Rank" %in% names(t))
  expect_true("Ave" %in% names(t))
  expect_true("NB" %in% names(t))
})
