context("test-get_default_netmhcpan_bin_path")

test_that("use", {
  expect_equal(
    basename(get_default_netmhcpan_bin_path()),
    "netmhcpan"
  )
})
