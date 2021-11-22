test_that("use", {
  expect_equal(
    file.path(
      get_default_netmhcpan_folder(),
      basename(get_default_netmhcpan_subfolder()),
      "data.tar.gz"
    ),
    get_default_netmhcpan_data_tarfile_path()
  )
})

