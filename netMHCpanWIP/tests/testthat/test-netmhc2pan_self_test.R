test_that("use", {
  if (is_netmhc2pan_installed()) {
    expect_silent(netmhc2pan_self_test())
  } else {
    expect_error(netmhc2pan_self_test())
  }
})

test_that("install NetMHCIIpan to a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  # Binary tarball: use local version if available
  netmhc2pan_bin_tarfile_path <- tempfile()
  if (file.exists("~/netMHCIIpan-3.2.Linux.tar.gz")) {
    file.copy(
      from = "~/netMHCIIpan-3.2.Linux.tar.gz",
      netmhc2pan_bin_tarfile_path
    )
  } else {
    download_netmhc2pan_bin(
      netmhc2pan_bin_tarfile_path = netmhc2pan_bin_tarfile_path
    )
  }
  expect_true(file.exists(netmhc2pan_bin_tarfile_path))

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

  netmhc2pan_folder_name <- tempfile(pattern = "netmhc2pan_")

  install_netmhc2pan_from_files(
    netmhc2pan_bin_tarfile_path = netmhc2pan_bin_tarfile_path,
    netmhc2pan_data_tarfile_path = netmhc2pan_data_tarfile_path,
    netmhc2pan_folder_name = netmhc2pan_folder_name
  )
  expect_silent(
    netmhc2pan_self_test(
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  )
  unlink(netmhc2pan_folder_name, recursive = TRUE)
})
