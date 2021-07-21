test_that("use", {
  if (is_netmhcpan_installed()) {
    expect_silent(netmhcpan_self_test())
  } else {
    expect_error(netmhcpan_self_test())
  }
})

test_that("install NetMHCpan to a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  # Binary tarball: use local version if available
  netmhcpan_bin_tarfile_path <- tempfile()
  if (file.exists("~/netMHCpan-4.1.Linux.tar.gz")) {
    file.copy(
      from = "~/netMHCpan-4.1.Linux.tar.gz",
      netmhcpan_bin_tarfile_path
    )
  } else {
    download_netmhcpan_bin(
      netmhcpan_bin_tarfile_path = netmhcpan_bin_tarfile_path
    )
  }
  expect_true(file.exists(netmhcpan_bin_tarfile_path))

  # Data tarball: use local version if available
  netmhcpan_data_tarfile_path <- tempfile()
  if (file.exists("~/data.Linux.tar.gz")) {
    file.copy(
      from = "~/data.Linux.tar.gz",
      netmhcpan_data_tarfile_path
    )
  } else {
    download_netmhcpan_data(
      netmhcpan_data_tarfile_path = netmhcpan_data_tarfile_path
    )
  }
  expect_true(file.exists(netmhcpan_data_tarfile_path))

  netmhcpan_folder_name <- tempfile(pattern = "netmhcpan_")

  install_netmhcpan_from_files(
    netmhcpan_bin_tarfile_path = netmhcpan_bin_tarfile_path,
    netmhcpan_data_tarfile_path = netmhcpan_data_tarfile_path,
    netmhcpan_folder_name = netmhcpan_folder_name
  )
  expect_silent(
    netmhcpan_self_test(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
  unlink(netmhcpan_folder_name, recursive = TRUE)
})
