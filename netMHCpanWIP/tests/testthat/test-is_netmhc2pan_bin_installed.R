test_that("use", {
  expect_silent(is_netmhc2pan_bin_installed())
  expect_message(is_netmhc2pan_bin_installed(verbose = TRUE))
})
