test_that("use", {
  netmhc2pan_version <- get_default_netmhc2pan_version()
  expect_equal(
    get_netmhc2pan_archive_filename(),
    paste0("netMHCIIpan-", netmhc2pan_version, ".Linux.tar.gz")
  )
})
