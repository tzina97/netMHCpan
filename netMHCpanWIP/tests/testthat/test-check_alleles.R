test_that("use", {
  if (!is_netMHCpan_installed()) return()
  expect_silent(check_alleles(get_netMHCpan_alleles()))
  expect_error(check_alleles("nonsense"), "Invalid 'alleles'")
})
