
test_that("set_up_netmhc2pan", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile()
  if (dir.exists(netmhc2pan_folder_name)) {
    unlink(netmhc2pan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netmhc2pan_folder_name))

  # Empty folder
  expect_error(
    set_up_netmhc2pan(netmhc2pan_folder_name = netmhc2pan_folder_name),
    "NetMHCIIpan binary is absent"
  )

  # Minimal install
  install_netmhc2pan_bin(netmhc2pan_folder_name = netmhc2pan_folder_name)
  expect_silent(
    set_up_netmhc2pan(netmhc2pan_folder_name = netmhc2pan_folder_name)
  )
})
