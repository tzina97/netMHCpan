test_that("use", {

  if (!is_netmhc2pan_installed()) return()

  peptides <- c("AIAACAMLLV", "ALVCYIVMPV")
  df <- predict_ic50(
    peptides = peptides,
    mhc_haplotype = "DRB1_0416"
  )
  expect_true("peptide" %in% names(df))
  expect_true("ic50" %in% names(df))
  expect_equal("character", class(df$peptide))
  expect_equal("numeric", class(df$ic50))
})
