test_that("use", {
  expect_silent(is_netMHCpan_bin_installed())
  expect_message(is_netMHCpan_bin_installed(verbose = TRUE))
})
