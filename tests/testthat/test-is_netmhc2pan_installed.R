test_that("use", {
  expect_silent(is_netMHCpan_installed())
  is_netMHCpan_installed(verbose = TRUE)
})

test_that("use", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  if (is_netMHCpan_installed()) {
    uninstall_netMHC2pan()
    expect_false(is_netMHCpan_installed())
    install_netMHCpan()
    expect_true(is_netMHCpan_installed())
  } else  {
    testit::assert(!is_netMHCpan_installed())
    install_netMHCpan()
    expect_true(is_netMHCpan_installed())
    uninstall_netMHCpan()
    expect_false(is_netMHCpan_installed())
  }

})

test_that("uninstall NetMHCpan from a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_folder_name <- tempfile(pattern = "netMHCpan_")
  install_netMHCpan(netMHCpan_folder_name = netMHCpan_folder_name)
  expect_silent(
    uninstall_netMHCpan(netMHCpan_folder_name = netMHCpan_folder_name)
  )
  expect_false(dir.exists(netMHCpan_folder_name))
})
