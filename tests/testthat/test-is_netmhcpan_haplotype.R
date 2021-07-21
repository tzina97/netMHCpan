test_that("use", {
  if (!is_netmhcpan_installed()) return()
  expect_true(is_netmhcpan_haplotype(get_netmhcpan_alleles()[42]))
})
