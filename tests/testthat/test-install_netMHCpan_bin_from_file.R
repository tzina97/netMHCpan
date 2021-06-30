test_that("install NetMHCpan binary to a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_bin_tarfile_path <- tempfile("install_netMHCpan_bin_from_file_")
  download_netMHCpan_bin(
    netMHCpan_tarfile_path = netMHCpan_bin_tarfile_path
  )
  expect_true(file.exists(netMHCpan_bin_tarfile_path))

  netMHCpan_folder_name <- tempfile(pattern = "netMHCpan_")
  expect_silent(
    install_netMHCpan_bin_from_file(
      netMHCpan_folder_name = netMHCpan_folder_name,
      netMHCpan_bin_tarfile_path = netMHCpan_bin_tarfile_path
    )
  )
  expect_true(
    is_netMHCpan_bin_installed(
      netMHCpan_folder_name = netMHCpan_folder_name
    )
  )
  unlink(netMHCpan_folder_name, recursive = TRUE)
})
