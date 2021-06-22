
test_that("set_up_netMHCpan", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile()
  if (dir.exists(netMHCpan_folder_name)) {
    unlink(netMHCpan_folder_name, recursive = TRUE)
  }
  expect_true(!dir.exists(netMHCpan_folder_name))

  # Empty folder
  expect_error(
    set_up_netMHCpan(netmhc2pan_folder_name = netMHCpan_folder_name),
    "NetMHCpan binary is absent"
  )

  # Minimal install
  install_netMHCpan_bin(netmhc2pan_folder_name = netMHCpan_folder_name)
  expect_silent(
    set_up_netMHCpan(netMHCpan_folder_name = netMHCpan_folder_name)
  )
})
