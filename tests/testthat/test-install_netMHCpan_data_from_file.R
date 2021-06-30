test_that("use", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  # Data tarball: use local version if available
  netMHCpan_data_tarfile_path <- tempfile()
  if (file.exists("~/data.Linux.tar.gz")) {
    file.copy(
      from = "~/data.Linux.tar.gz",
      netMHCpan_data_tarfile_path
    )
  } else {
    download_netMHCpan_data(
      netMHCpan_data_tarfile_path = netMHCpan_data_tarfile_path
    )
  }
  expect_true(file.exists(netMHCpan_data_tarfile_path))

  netMHCpan_folder_name <- tempdir()

  # Re-install NetMHCpan data
  install_netMHCpan_data_from_file(
    netMHCpan_data_tarfile_path = netMHCpan_data_tarfile_path,
    netMHCpan_folder_name = netMHCpan_folder_name
  )

  expect_error(
    install_netMHCpan_data(netMHCpan_folder_name = netMHCpan_folder_name),
    "NetMHCpan data is already installed"
  )
})
