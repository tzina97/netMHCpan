test_that("uninstall absent NetMHCpan must throw", {

  if (is_netmhcpan_installed()) return()

  expect_error(
    uninstall_netmhcpan(netmhcpan_folder_name = "/abs/ent"), # nolint use absolute path
    "Cannot uninstall absent NetMHCpan at"
  )
})

test_that("see if NetMHCpan is detected at a custom location", {

  if (!is_url_valid()) return()

  netmhcpan_folder_name <- tempfile(pattern = "netmhcpan_")
  expect_false(
    is_netmhcpan_installed(netmhcpan_folder_name = netmhcpan_folder_name)
  )
  install_netmhcpan(netmhcpan_folder_name = netmhcpan_folder_name)
  expect_true(
    is_netmhcpan_installed(netmhcpan_folder_name = netmhcpan_folder_name)
  )
  unlink(netmhcpan_folder_name, recursive = TRUE)
})
