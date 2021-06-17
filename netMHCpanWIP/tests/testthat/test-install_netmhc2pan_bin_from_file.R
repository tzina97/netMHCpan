test_that("install NetMHCIIpan binary to a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_bin_tarfile_path <- tempfile("install_netmhc2pan_bin_from_file_")
  download_netmhc2pan_bin(
    netmhc2pan_tarfile_path = netmhc2pan_bin_tarfile_path
  )
  expect_true(file.exists(netmhc2pan_bin_tarfile_path))

  netmhc2pan_folder_name <- tempfile(pattern = "netmhc2pan_")
  expect_silent(
    install_netmhc2pan_bin_from_file(
      netmhc2pan_folder_name = netmhc2pan_folder_name,
      netmhc2pan_bin_tarfile_path = netmhc2pan_bin_tarfile_path
    )
  )
  expect_true(
    is_netmhc2pan_bin_installed(
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  )
  unlink(netmhc2pan_folder_name, recursive = TRUE)
})
