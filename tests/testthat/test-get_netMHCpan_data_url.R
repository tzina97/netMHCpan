test_that("use", {
  expect_equal(
    get_netmhcpan_data_url(),
    "https://services.healthtech.dtu.dk/services/NetMHCpan-4.1/data.tar.gz"
  )
})
