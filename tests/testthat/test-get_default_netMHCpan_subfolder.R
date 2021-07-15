test_that("use", {
  expect_equal(
    basename(get_default_netMHCpan_subfolder()),
    paste0("NetMHCpan-", get_default_netMHCpan_version())
  )
})
