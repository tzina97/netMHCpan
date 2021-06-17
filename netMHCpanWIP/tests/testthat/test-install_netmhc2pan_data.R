test_that("install_netmhc2pan_data", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempdir()
  if (dir.exists(netmhc2pan_folder_name)) {
    unlink(netmhc2pan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhc2pan_folder_name))

  # Re-install NetMHCIIpan data
  install_netmhc2pan_data(netmhc2pan_folder_name = netmhc2pan_folder_name)

  expect_error(
    install_netmhc2pan_data(netmhc2pan_folder_name = netmhc2pan_folder_name),
    "NetMHCIIpan data is already installed"
  )
})
