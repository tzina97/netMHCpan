test_that("use", {
  if (!is_netmhc2pan_installed()) return()
  expect_silent(check_alleles(get_netmhc2pan_alleles()))
  expect_error(check_alleles("nonsense"), "Invalid 'alleles'")
})
