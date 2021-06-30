test_that("install NetMHCpan to a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_folder_name <- tempfile(pattern = "netMHCpan_")
  expect_silent(
    install_netMHCpan(netMHCpan_folder_name = netMHCpan_folder_name)
  )
  unlink(netMHCpan_folder_name, recursive = TRUE)
})
