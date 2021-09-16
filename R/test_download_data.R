test_that("use", {

  netmhcpan_data_tarfile_path <- tempfile(pattern = "netmhcpan_")

  expect_silent(
    download_netmhcpan_data(netmhcpan_data_tarfile_path = netmhcpan_data_tarfile_path)
  )
  expect_true(file.exists(netmhcpan_data_tarfile_path))
})

test_that("use, verbose", {
  expect_message(
    download_netmhcpan_data(
      netmhcpan_data_tarfile_path = tempfile(pattern = "netmhcpan_"),
      verbose = TRUE
    )
  )
})
