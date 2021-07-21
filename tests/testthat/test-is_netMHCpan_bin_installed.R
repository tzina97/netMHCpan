test_that("use", {
  expect_silent(is_netmhcpan_bin_installed())
  expect_message(is_netmhcpan_bin_installed(verbose = TRUE))
})
