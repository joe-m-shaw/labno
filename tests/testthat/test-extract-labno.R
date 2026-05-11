test_that("extract_labno works", {
  
  expect_equal(extract_labno("Annotated_v2aSchwannAll_PS_WS123456_12345678_AnnaKARENINA.xlsx"),
               "12345678")
  
})

test_that("extract_labno errors with non-string input", {
  
  expect_error(extract_labno(12345678), regexp = "input must be a string")
  
})

test_that("extract_labno errors with empty input", {
  
  expect_error(extract_labno(""), regexp = "input must not be empty")
  
})

