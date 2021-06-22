test_that("use", {
  netMHCpan_version <- get_default_netMHCpan_version()
  expect_equal(
    get_netMHCpan_archive_filename(),
    paste0("netMHCpan-", netMHCpan_version, ".Linux.tar.gz")
  )
})
