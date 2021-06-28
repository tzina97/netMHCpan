test_that("install_netMHCpan_data", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempdir()
  if (dir.exists(netMHCpan_folder_name)) {
    unlink(netMHCpan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netMHCpan_folder_name))

  # Re-install NetMHCpan data
  install_netMHCpan_data(netMHCpan_folder_name = netMHCpan_folder_name)

  expect_error(
    install_netMHCpan_data(netMHCpan_folder_name = netMHCpan_folder_name),
    "NetMHCpan data is already installed"
  )
})
