test_that("install NetMHCIIpan to a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile(pattern = "netmhc2pan_")
  expect_silent(
    install_netmhc2pan(netmhc2pan_folder_name = netmhc2pan_folder_name)
  )
  unlink(netmhc2pan_folder_name, recursive = TRUE)
})
