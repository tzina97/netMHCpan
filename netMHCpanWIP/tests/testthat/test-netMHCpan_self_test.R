test_that("use", {
  if (is_netMHCpan_installed()) {
    expect_silent(netMHCpan_self_test())
  } else {
    expect_error(netMHCpan_self_test())
  }
})

test_that("install NetMHCpan to a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  # Binary tarball: use local version if available
  netMHCpan_bin_tarfile_path <- tempfile()
  if (file.exists("~/netMHCpan-4.1.Linux.tar.gz")) {
    file.copy(
      from = "~/netMHCpan-4.1.Linux.tar.gz",
      netMHCpan_bin_tarfile_path
    )
  } else {
    download_netMHCpan_bin(
      netMHCpan_bin_tarfile_path = netMHCpan_bin_tarfile_path
    )
  }
  expect_true(file.exists(netMHCpan_bin_tarfile_path))

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

  netMHCpan_folder_name <- tempfile(pattern = "netMHCpan_")

  install_netMHCpan_from_files(
    netMHCpan_bin_tarfile_path = netMHCpan_bin_tarfile_path,
    netMHCpan_data_tarfile_path = netMHCpan_data_tarfile_path,
    netMHCpan_folder_name = netMHCpan_folder_name
  )
  expect_silent(
    netMHCpan_self_test(
      netMHCpan_folder_name = netMHCpan_folder_name
    )
  )
  unlink(netMHCpan_folder_name, recursive = TRUE)
})
