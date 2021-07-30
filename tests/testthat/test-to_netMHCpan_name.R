test_that("use", {
  expect_equal(to_netmhcpan_name(mhc_haplotype = "HLA-A*02:01"), "HLA-A02:01")
})

test_that("use", {
  expect_equal(to_netmhcpan_name(mhc_haplotype = "DLA-88*508:01"), "DLA-8850801")
})

#Haven't matched for DLA patterns yet.

test_that("use", {
  if (!is_netmhcpan_installed()) return()
  mhc_haplotypes <- c(
    "HLA-A*01:03",
    "HLA-A*02:28",
    "HLA-A*02:280",
    "HLA-A*02:291",
    "HLA-A*02:317",
    "HLA-A*02:346",
    "BoLA-1:06701",
    "Eqca-1*00101"

  )
  for (mhc_haplotype in mhc_haplotypes) {
    netmhcpan_name <- to_netmhcpan_name(mhc_haplotype)
    expect_true(is_netmhcpan_haplotype(netmhcpan_name))
  }
})
