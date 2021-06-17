test_that("use", {
  if (!is_netmhc2pan_installed()) return()
  expect_true(is_netmhc2pan_haplotype(get_netmhc2pan_alleles()[42]))
})
