test_that("extract_name works when name is present", {
  
  expect_equal(extract_name("Annotated_v2aSchwannAll_PS_WS123456_12345678_AnnaKARENINA.xlsx"),
               "AnnaKARENINA")
  
})

test_that("extract_name works when name is not present", {
  
  expect_equal(extract_name("Annotated_v2M4_LUNG_PS_WS123456_12345678_S32.xlsx"),
               "S32")
  
})

test_that("extract_name works when numbers are included with name", {
  
  expect_equal(extract_name("Annotated_WS123456_12345678_PierreBEZUKHOV8631061.xlsx"),
               "PierreBEZUKHOV8631061")
  
})
