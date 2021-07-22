test_that("use", {
  expect_equal(
    basename(get_default_netmhcpan_subfolder()),
    paste0("netMHCpan-", get_default_netmhcpan_version())
  )
})
