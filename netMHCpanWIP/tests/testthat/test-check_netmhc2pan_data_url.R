test_that("use", {
  if (!is_on_travis()) return()

  # This test will break if www.cbs.dtu.dk is down,
  # here I assume it is usually up :-)
  expect_silent(check_netMHCpan_data_url())
})

test_that("be verbose", {
  if (!is_on_travis()) return()
  expect_message(
    check_netMHCpan_data_url(verbose = TRUE),
    "netMHCpan_data_url"
  )
})

test_that("error message for invalid URL", {
  expect_error(
    check_netMHCpan_data_url(netMHCpan_data_url = "does_not_exist"),
    "does_not_exist"
  )
})
