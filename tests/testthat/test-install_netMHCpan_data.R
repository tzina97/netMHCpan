test_that("install_netmhcpan_data", {

  if (!is_on_travis())
  if (!is_url_valid())

  netmhcpan_folder_name <- tempdir()
  if (dir.exists(netmhcpan_folder_name)) {
    unlink(netmhcpan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhcpan_folder_name))

  # Re-install NetMHCpan data
  install_netmhcpan_data(netmhcpan_folder_name = netmhcpan_folder_name)

  expect_error(
    install_netmhcpan_data(netmhcpan_folder_name = netmhcpan_folder_name),
    "NetMHCpan data is already installed"
  )
})
