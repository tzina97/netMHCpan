test_that("use", {
  if (is_netmhc2pan_installed()) {
    expect_silent(check_netmhc2pan_installation())
  } else {
    expect_error(check_netmhc2pan_installation())
  }
})

test_that("abuse", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile()
  if (dir.exists(netmhc2pan_folder_name)) {
    unlink(netmhc2pan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhc2pan_folder_name))

  expect_true(
    !is_netmhc2pan_installed(
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  )
  expect_error(
    check_netmhc2pan_installation(netmhc2pan_folder_name),
    "NetMHCIIpan binary not found at"
  )

  install_netmhc2pan_bin(netmhc2pan_folder_name = netmhc2pan_folder_name)
  expect_error(
    check_netmhc2pan_installation(netmhc2pan_folder_name),
    "NetMHCIIpan data not found at"
  )

  install_netmhc2pan_data(netmhc2pan_folder_name = netmhc2pan_folder_name)
  expect_error(
    check_netmhc2pan_installation(netmhc2pan_folder_name),
    "NetMHCIIpan not set up"
  )

  set_up_netmhc2pan(netmhc2pan_folder_name = netmhc2pan_folder_name)
  expect_silent(
    check_netmhc2pan_installation(netmhc2pan_folder_name)
  )
})
