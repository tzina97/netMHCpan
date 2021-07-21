test_that("use", {
  if (is_netmhcpan_installed()) {
    expect_silent(check_netmhcpan_installation())
  } else {
    expect_error(check_netmhcpan_installation())
  }
})

test_that("abuse", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhcpan_folder_name <- tempfile()
  if (dir.exists(netmhcpan_folder_name)) {
    unlink(netmhcpan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhcpan_folder_name))

  expect_true(
    !is_netmhcpan_installed(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
  expect_error(
    check_netmhcpan_installation(netmhcpan_folder_name),
    "NetMHCpan binary not found at"
  )

  install_netmhcpan_bin(netmhcpan_folder_name = netmhcpan_folder_name)
  expect_error(
    check_netmhcpan_installation(netmhcpan_folder_name),
    "NetMHCpan data not found at"
  )

  install_netmhcpan_data(netmhcpan_folder_name = netmhcpan_folder_name)
  expect_error(
    check_netmhcpan_installation(netmhcpan_folder_name),
    "NetMHCpan not set up"
  )

  set_up_netmhcpan(netmhcpan_folder_name = netmhcpan_folder_name)
  expect_silent(
    check_netmhcpan_installation(netmhcpan_folder_name)
  )
})
