test_that("install must be silent by default", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile(
    pattern = "netmhc2pan_install_netmhc2pan_bin_"
  )
  expect_false(dir.exists(netmhc2pan_folder_name))
  expect_silent(
    install_netmhc2pan_bin(
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  )
})

test_that("verbose install must produce", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile(
    pattern = "netmhc2pan_install_netmhc2pan_bin_"
  )
  expect_false(dir.exists(netmhc2pan_folder_name))

  expect_message(
    install_netmhc2pan_bin(
      netmhc2pan_folder_name = netmhc2pan_folder_name,
      verbose = TRUE
    )
  )
})

test_that("abuse", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile(
    pattern = "netmhc2pan_install_netmhc2pan_bin_"
  )
  expect_false(dir.exists(netmhc2pan_folder_name))

  # Invalid URL
  expect_error(
    install_netmhc2pan_bin(
      netmhc2pan_folder_name = netmhc2pan_folder_name,
      netmhc2pan_bin_url = "nonsense"
    ),
    "'download_url' is invalid"
  )

  # Re-install NetMHCIIpan
  install_netmhc2pan_bin(netmhc2pan_folder_name = netmhc2pan_folder_name)

  expect_error(
    install_netmhc2pan_bin(netmhc2pan_folder_name = netmhc2pan_folder_name),
    "NetMHCIIpan binary is already installed"
  )
})
