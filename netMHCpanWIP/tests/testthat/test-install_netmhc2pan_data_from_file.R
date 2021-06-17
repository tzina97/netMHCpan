test_that("use", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  # Data tarball: use local version if available
  netmhc2pan_data_tarfile_path <- tempfile()
  if (file.exists("~/data.Linux.tar.gz")) {
    file.copy(
      from = "~/data.Linux.tar.gz",
      netmhc2pan_data_tarfile_path
    )
  } else {
    download_netmhc2pan_data(
      netmhc2pan_data_tarfile_path = netmhc2pan_data_tarfile_path
    )
  }
  expect_true(file.exists(netmhc2pan_data_tarfile_path))

  netmhc2pan_folder_name <- tempdir()

  # Re-install NetMHCIIpan data
  install_netmhc2pan_data_from_file(
    netmhc2pan_data_tarfile_path = netmhc2pan_data_tarfile_path,
    netmhc2pan_folder_name = netmhc2pan_folder_name
  )

  expect_error(
    install_netmhc2pan_data(netmhc2pan_folder_name = netmhc2pan_folder_name),
    "NetMHCIIpan data is already installed"
  )
})
