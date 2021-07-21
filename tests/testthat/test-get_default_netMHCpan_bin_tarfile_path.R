test_that("use", {
  expect_equal(
    file.path(
      get_default_netmhcpan_folder(),
      get_netmhcpan_archive_filename()
    ),
    get_default_netmhcpan_bin_tarfile_path()
  )
})
