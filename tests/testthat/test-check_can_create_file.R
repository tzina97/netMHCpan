test_that("use", {
  expect_silent(check_can_create_file("local.txt"))
  skip_on_os("windows")
  expect_error(check_can_create_file("/root.txt"))
})
