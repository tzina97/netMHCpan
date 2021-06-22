test_that("use", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_tarfile_path <- tempfile(pattern = "netmhc2pan_")

  expect_silent(
    download_netMHCpan_bin(
      netMHCpan_tarfile_path = netMHCpan_tarfile_path
    )
  )
  expect_true(file.exists(netMHCpan_tarfile_path))
})

test_that("use, verbose", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  expect_message(
    download_netMHCpan_bin(
      netMHCpan_tarfile_path = tempfile(pattern = "netMHCpan_"),
      verbose = TRUE
    )
  )
})
