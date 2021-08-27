test_that("use", {
  if (!is_url_valid()) return()

  netmhcpan_tarfile_path <- tempfile(pattern = "netmhcpan_")

  expect_silent(
    download_netmhcpan_bin()
  )
  expect_true(file.exists(netmhcpan_tarfile_path))
})

test_that("use, verbose", {
  if (!is_url_valid()) return()

  expect_message(
    download_netmhcpan_bin(
      netmhcpan_tarfile_path = tempfile(pattern = "netmhcpan_"),
      verbose = TRUE
    )
  )
})
