test_that("extract_suffix works with no suffix", {
  
  expect_equal(extract_suffix("Annotated_v2aSchwannAll_PS_WS123456_12345678_AnnaKARENINA.xlsx"),
               "")
  
})

test_that("extract_suffix works with no suffix", {
  
  expect_equal(extract_suffix("Annotated_v2aSchwannAll_PS_WS123456_12345678a_AnnaKARENINA.xlsx"),
               "a")
  
})

