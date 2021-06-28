test_that("uninstall absent NetMHCpan must throw", {

  if (is_netMHCpan_installed()) return()

  expect_error(
    uninstall_netMHCpan(netMHCpan_folder_name = "/abs/ent"), # nolint use absolute path
    "Cannot uninstall absent NetMHCpan at"
  )
})

test_that("see if NetMHCpan is detected at a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_folder_name <- tempfile(pattern = "netMHCpan_")
  expect_false(
    is_netMHCpan_installed(netMHCpan_folder_name = netMHCpan_folder_name)
  )
  install_netMHCpan(netMHCpan_folder_name = netMHCpan_folder_name)
  expect_true(
    is_netMHCpan_installed(netMHCpan_folder_name = netMHCpan_folder_name)
  )
  unlink(netMHCpan_folder_name, recursive = TRUE)
})
