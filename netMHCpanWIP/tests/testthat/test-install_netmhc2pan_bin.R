test_that("install must be silent by default", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_folder_name <- tempfile(
    pattern = "netMHCpan_install_netMHCpan_bin_"
  )
  expect_false(dir.exists(netMHCpan_folder_name))
  expect_silent(
    install_netMHCpan_bin(
      netMHCpan_folder_name = netMHCpan_folder_name
    )
  )
})

test_that("verbose install must produce", {
  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_folder_name <- tempfile(
    pattern = "netMHCpan_install_netMHCpan_bin_"
  )
  expect_false(dir.exists(netMHCpan_folder_name))

  expect_message(
    install_netMHCpan_bin(
      netMHCpan_folder_name = netMHCpan_folder_name,
      verbose = TRUE
    )
  )
})

test_that("abuse", {

  if (!is_on_travis()) return()
  if (!is_url_valid()) return()

  netMHCpan_folder_name <- tempfile(
    pattern = "netMHCpan_install_netmhc2pan_bin_"
  )
  expect_false(dir.exists(netMHCpan_folder_name))

  # Invalid URL
  expect_error(
    install_netMHCpan_bin(
      netMHCpan_folder_name = netMHCpan_folder_name,
      netMHCpan_bin_url = "nonsense"
    ),
    "'download_url' is invalid"
  )

  # Re-install NetMHCpan
  install_netMHCpan_bin(netMHCpan_folder_name = netMHCpan_folder_name)

  expect_error(
    install_netMHCpan_bin(netMHCpan_folder_name = netMHCpan_folder_name),
    "NetMHCpan binary is already installed"
  )
})
