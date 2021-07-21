
test_that("set_up_netmhcpan", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhcpan_folder_name <- tempfile()
  if (dir.exists(netmhcpan_folder_name)) {
    unlink(netmhcpan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhcpan_folder_name))

  # Empty folder
  expect_error(
    set_up_netmhcpan(netmhcpan_folder_name = netmhcpan_folder_name),
    "NetMHCpan binary is absent"
  )

  # Minimal install
  install_netmhcpan_bin(netmhcpan_folder_name = netmhcpan_folder_name)
  expect_silent(
    set_up_netmhcpan(netmhcpan_folder_name = netmhcpan_folder_name)
  )
})
