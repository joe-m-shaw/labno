test_that("extract_labno works", {
  
  expect_equal(extract_labno("Annotated_v2aSchwannAll_PS_WS123456_12345678_AnnaKARENINA.xlsx"),
               "12345678")
  
})
