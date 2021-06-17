test_that("uninstall absent NetMHCIIpan must throw", {

  if (is_netmhc2pan_installed()) return()

  expect_error(
    uninstall_netmhc2pan(netmhc2pan_folder_name = "/abs/ent"), # nolint use absolute path
    "Cannot uninstall absent NetMHCIIpan at"
  )
})

test_that("see if NetMHCIIpan is detected at a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile(pattern = "netmhc2pan_")
  expect_false(
    is_netmhc2pan_installed(netmhc2pan_folder_name = netmhc2pan_folder_name)
  )
  install_netmhc2pan(netmhc2pan_folder_name = netmhc2pan_folder_name)
  expect_true(
    is_netmhc2pan_installed(netmhc2pan_folder_name = netmhc2pan_folder_name)
  )
  unlink(netmhc2pan_folder_name, recursive = TRUE)
})
