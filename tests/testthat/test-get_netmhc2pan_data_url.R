test_that("use", {
  expect_equal(
    get_netMHCpan_data_url(),
    "https://services.healthtech.dtu.dk/services/NetMHCpan-4.1/data.tar.gz"
  )
})
