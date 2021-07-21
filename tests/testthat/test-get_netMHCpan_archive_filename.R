test_that("use", {
  netmhcpan_version <- get_default_netmhcpan_version()
  expect_equal(
    get_netmhcpan_archive_filename(),
    paste0("netMHCpan-", netmhcpan_version, "b.Linux.tar.gz")
  )
})
