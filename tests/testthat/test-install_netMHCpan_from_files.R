test_that("install NetMHCpan to a custom location", {

  if (!is_on_travis())
  if (!is_url_valid())

  # Binary tarball: use local version if available
  netmhcpan_bin_tarfile_path <- tempfile()
  if (file.exists("~/netmhcpan-4.1.Linux.tar.gz")) {
    file.copy(
      from = "~/netmhcpan-4.1.Linux.tar.gz",
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
  expect_false(dir.exists(netmhcpan_folder_name))

  expect_silent(
    install_netmhcpan_from_files(
      netmhcpan_bin_tarfile_path = netmhcpan_bin_tarfile_path,
      netmhcpan_data_tarfile_path = netmhcpan_data_tarfile_path,
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
  expect_true(
    is_netmhcpan_installed(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
  expect_silent(
    check_netmhcpan_installation(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
  expect_silent(
    netmhcpan_self_test(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
  expect_silent(
    uninstall_netmhcpan(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
  expect_false(dir.exists(netmhcpan_folder_name))
})
