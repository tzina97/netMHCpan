test_that("use", {
  expect_silent(to_netmhc2pan_name("HLA-DRB1*0101"))
  expect_silent(to_netmhc2pan_name("HLA-DQA1*0501/DQB1*0201"))
})

test_that("use", {
  if (!is_netmhc2pan_installed()) return()
  mhc2_haplotypes <- c(
    "HLA-DRB1*0101",
    "HLA-DRB1*0301",
    "HLA-DRB1*0401",
    "HLA-DRB1*0405",
    "HLA-DRB1*0701",
    "HLA-DRB1*0802",
    "HLA-DRB1*0901",
    "HLA-DRB1*1101",
    "HLA-DRB1*1201",
    "HLA-DRB1*1302",
    "HLA-DRB1*1501",
    "HLA-DRB3*0101",
    "HLA-DRB3*0202",
    "HLA-DRB4*0101",
    "HLA-DRB5*0101",
    "HLA-DQA1*0501/DQB1*0201",
    "HLA-DQA1*0501/DQB1*0301",
    "HLA-DQA1*0301/DQB1*0302",
    "HLA-DQA1*0401/DQB1*0402",
    "HLA-DQA1*0101/DQB1*0501",
    "HLA-DQA1*0102/DQB1*0602"
  )
  for (mhc2_haplotype in mhc2_haplotypes) {
    netmhc2pan_name <- to_netmhc2pan_name(mhc2_haplotype)
    expect_true(is_netmhc2pan_haplotype(netmhc2pan_name))
  }
})
