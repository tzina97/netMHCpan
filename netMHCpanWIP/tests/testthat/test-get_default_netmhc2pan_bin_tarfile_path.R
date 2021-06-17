test_that("use", {
  expect_equal(
    file.path(
      get_default_netmhc2pan_folder(),
      get_netmhc2pan_archive_filename()
    ),
    get_default_netmhc2pan_bin_tarfile_path()
  )
})
