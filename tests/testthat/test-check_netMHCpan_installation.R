test_that("use", {
  if (is_netMHCpan_installed()) {
    expect_silent(check_netMHCpan_installation())
  } else {
    expect_error(check_netMHCpan_installation())
  }
})

test_that("abuse", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_folder_name <- tempfile()
  if (dir.exists(netMHCpan_folder_name)) {
    unlink(netMHCpan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netMHCpan_folder_name))

  expect_true(
    !is_netMHCpan_installed(
      netMHCpan_folder_name = netMHCpan_folder_name
    )
  )
  expect_error(
    check_netMHCpan_installation(netMHCpan_folder_name),
    "NetMHCpan binary not found at"
  )

  install_netMHCpan_bin(netMHCpan_folder_name = netMHCpan_folder_name)
  expect_error(
    check_netMHCpan_installation(netMHCpan_folder_name),
    "NetMHCpan data not found at"
  )

  install_netMHCpan_data(netMHCpan_folder_name = netMHCpan_folder_name)
  expect_error(
    check_netMHCpan_installation(netMHCpan_folder_name),
    "NetMHCpan not set up"
  )

  set_up_netMHCpan(netMHCpan_folder_name = netMHCpan_folder_name)
  expect_silent(
    check_netMHCpan_installation(netMHCpan_folder_name)
  )
})
