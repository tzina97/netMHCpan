test_that("use", {
  if (!is_netMHCpan_installed()) return()
  expect_true(is_netMHCpan_haplotype(get_netMHCpan_alleles()[42]))
})
