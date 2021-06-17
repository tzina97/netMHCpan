test_that("use", {
  expect_equal(
    basename(get_default_netmhc2pan_subfolder()),
    paste0("netMHCIIpan-", get_default_netmhc2pan_version())
  )
})
