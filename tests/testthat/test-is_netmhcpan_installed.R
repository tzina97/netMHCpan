test_that("use", {
  expect_silent(is_netmhcpan_installed())
  is_netmhcpan_installed(verbose = TRUE)
})

test_that("use", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  if (is_netmhcpan_installed()) {
    uninstall_netmhcpan()
    expect_false(is_netmhcpan_installed())
    install_netmhcpan()
    expect_true(is_netmhcpan_installed())
  } else  {
    testit::assert(!is_netmhcpan_installed())
    install_netmhcpan()
    expect_true(is_netmhcpan_installed())
    uninstall_netmhcpan()
    expect_false(is_netmhcpan_installed())
  }

})

test_that("uninstall NetMHCpan from a custom location", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhcpan_folder_name <- tempfile(pattern = "netmhcpan_")
  install_netmhcpan(netmhcpan_folder_name = netmhcpan_folder_name)
  expect_silent(
    uninstall_netmhcpan(netmhcpan_folder_name = netmhcpan_folder_name)
  )
  expect_false(dir.exists(netmhcpan_folder_name))
})
