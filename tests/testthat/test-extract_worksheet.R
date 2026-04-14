test_that("extract_worksheet works", {
  expect_equal(extract_worksheet("_WS123456_"),
               "WS123456")
})
