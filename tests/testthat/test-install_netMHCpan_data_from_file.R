test_that("use", {

  if (!is_url_valid()) return()

  # Data tarball: use local version if available
  netmhcpan_data_tarfile_path <- tempfile()
  if (file.exists("~/data.Linux.tar.gz")) {
    file.copy(
      from = "~/data.Linux.tar.gz",
      netmhcpan_data_tarfile_path
    )
  } else {
    install_netmhcpan_data(
        netmhcpan_data_url = netmhcpan_data_url,
        netmhcpan_folder_name = rappdirs::user_data_dir())
  }
  expect_true(file.exists(netmhcpan_data_tarfile_path))

  netmhcpan_folder_name <- tempdir()

  # Re-install NetMHCpan data
  install_netmhcpan_data_from_file(
    netmhcpan_data_tarfile_path = netmhcpan_data_tarfile_path,
    netmhcpan_folder_name = netmhcpan_folder_name
  )

  expect_error(
    install_netmhcpan_data(netmhcpan_folder_name = netmhcpan_folder_name),
    "NetMHCpan data is already installed"
  )
})
