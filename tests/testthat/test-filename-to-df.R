expected_df_name <- data.frame(
  "labno" = c("12345678"),
  "worksheet" = c("WS123456"),
  "suffix" = c("a"),
  "name" = c("PierreBEZUKHOV"),
  "labno_suffix" = c("12345678a"),
  "labno_suffix_worksheet" = c("12345678a_WS123456")
)

test_that("filename_to_df works with old xlsx format without panel name", {
  
  expect_equal(filename_to_df("Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx"),
               expected_df_name)
  
})

test_that("filename_to_df works with new vcf format", {
  
  expect_equal(filename_to_df("hotspots_WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.vcf"),
               expected_df_name)
  
})

test_that("filename_to_df works for annotated PanSolid format", {
  
  expect_equal(filename_to_df("Annotated_v2PANSOLID_WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.xlsx"),
               expected_df_name)
  
})

test_that("filename_to_df works for unannotated PanSolid format", {
  
  expect_equal(filename_to_df("Results_SNVs_Indels-WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.xlsx"),
               expected_df_name)
  
})

test_that("filename_to_df works without name and with json format", {
  
  expected_df_no_name <- data.frame(
    "labno" = c("12345678"),
    "worksheet" = c("WS123456"),
    "suffix" = c("a"),
    "name" = c("S2"),
    "labno_suffix" = c("12345678a"),
    "labno_suffix_worksheet" = c("12345678a_WS123456")
  )
  
  expect_equal(filename_to_df("Combined QC Reports-WS123456_12345678a_S2_R1_001.json"),
               expected_df_no_name)
  
})
