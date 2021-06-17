test_that("use", {
  if (!is_netmhc2pan_installed()) return()
  alleles <- get_netmhc2pan_alleles()
  expect_true(length(alleles) > 5000)
})

test_that("no tab-seperated entries", {
  if (!is_netmhc2pan_installed()) return()

  # https://github.com/richelbilderbeek/bbbq_article/issues/57
  alleles <- get_netmhc2pan_alleles()

  expect_equal(0, sum(stringr::str_count(alleles, pattern = "\t")))
})
