context("test-get_default_netMHCpan_bin_path")

test_that("use", {
  expect_equal(
    basename(get_default_netMHCpan_bin_path()),
    "netMHCpan"
  )
})
