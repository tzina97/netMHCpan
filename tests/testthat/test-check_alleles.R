test_that("use", {
  if (!is_netmhcpan_installed()) return()
  expect_silent(check_alleles(get_netmhcpan_alleles()))
  expect_error(check_alleles("nonsense"), "Invalid 'alleles'")
})
