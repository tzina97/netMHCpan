test_that("use", {
  expect_silent(to_netmhcpan_name("HLA-DRB1*0101"))
  expect_silent(to_netmhcpan_name("HLA-DQA1*0501/DQB1*0201"))
})

test_that("use", {
  if (!is_netmhcpan_installed()) return()
  mhc_haplotypes <- c(
    "HLA-A02:344",
    "HLA-A02:28",
    "HLA-A02:280",
    "HLA-A02:291",
    "HLA-A02:317",
    "HLA-A02:346",
    "BoLA-1:06701",
    "DLA-8850801",
    "Eqca-100101"

  )
  for (mhc_haplotype in mhc_haplotypes) {
    netmhcpan_name <- to_netmhcpan_name(mhc_haplotype)
    expect_true(is_netmhcpan_haplotype(netmhcpan_name))
  }
})
