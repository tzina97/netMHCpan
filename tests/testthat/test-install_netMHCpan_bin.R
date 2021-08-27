test_that("install must be silent by default", {
  if (!is_url_valid()) return()

  netmhcpan_folder_name <- tempfile(
    pattern = "netmhcpan_install_netmhcpan_bin_"
  )
  expect_false(dir.exists(netmhcpan_folder_name))
  expect_silent(
    install_netmhcpan_bin(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
  )
})

test_that("verbose install must produce", {
  if (!is_url_valid()) return()

  netmhcpan_folder_name <- tempfile(
    pattern = "netmhcpan_install_netmhcpan_bin_"
  )
  expect_false(dir.exists(netmhcpan_folder_name))

  expect_message(
    install_netmhcpan_bin(
      netmhcpan_folder_name = netmhcpan_folder_name,
      verbose = TRUE
    )
  )
})

test_that("abuse", {

  if (!is_url_valid()) return()

  netmhcpan_folder_name <- tempfile(
    pattern = "netmhcpan_install_netmhcpan_bin_"
  )
  expect_false(dir.exists(netmhcpan_folder_name))

  # Invalid URL
  expect_error(
    install_netmhcpan_bin(
      netmhcpan_folder_name = netmhcpan_folder_name,
      netmhcpan_bin_url = "nonsense"
    ),
    "'download_url' is invalid"
  )

  # Re-install NetMHCpan
  install_netmhcpan_bin(netmhcpan_folder_name = netmhcpan_folder_name)

  expect_error(
    install_netmhcpan_bin(netmhcpan_folder_name = netmhcpan_folder_name),
    "NetMHCpan binary is already installed"
  )
})
