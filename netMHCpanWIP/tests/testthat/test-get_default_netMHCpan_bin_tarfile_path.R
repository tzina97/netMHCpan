test_that("use", {
  expect_equal(
    file.path(
      get_default_netMHCpan_folder(),
      get_netMHCpan_archive_filename()
    ),
    get_default_netMHCpan_bin_tarfile_path()
  )
})
