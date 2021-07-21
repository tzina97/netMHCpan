test_that("install NetMHCpan binary to a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhcpan_bin_tarfile_path <- tempfile("install_netmhcpan_bin_from_file_")
  download_netmhcpan_bin(
    netmhcpan_tarfile_path = netmhcpan_bin_tarfile_path
  )
  expect_true(file.exists(netmhcpan_bin_tarfile_path))

  netmhcpan_folder_name <- tempfile(pattern = "netmhcpan_")
  expect_silent(
    install_netmhcpan_bin_from_file(
      netmhcpan_folder_name = netmhcpan_folder_name,
      netmhcpan_bin_tarfile_path = netmhcpan_bin_tarfile_path
    )
  )
  expect_true(
    is_netmhcpan_bin_installed(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
  unlink(netmhcpan_folder_name, recursive = TRUE)
})
