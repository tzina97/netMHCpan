test_that("use", {
  expect_equal(
    get_netmhc2pan_data_url(),
    "https://www.cbs.dtu.dk/services/NetMHCIIpan-3.2/data.Linux.tar.gz"
  )
})
