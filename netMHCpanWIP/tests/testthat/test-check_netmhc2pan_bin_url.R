test_that("use", {
  if (is_url_valid()) {
    expect_silent(check_netMHCpan_bin_url())
  } else {
    expect_error(check_netMHCpan_bin_url())
  }
})

test_that("be verbose", {
  if (!is_on_travis()) return()
  if (is_url_valid()) {
    expect_message(
      check_netMHCpan_bin_url(verbose = TRUE)
    )
  }
})

test_that("error message for invalid URL", {
  expect_error(
    check_netMHCpan_bin_url(netMHCpan_bin_url = "does_not_exist"),
    "YouTube"
  )
})
