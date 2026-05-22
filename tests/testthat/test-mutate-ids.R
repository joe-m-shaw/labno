expected_df_name <- data.frame(
  "labno" = c("12345678"),
  "worksheet" = c("WS123456"),
  "suffix" = c("a"),
  "name" = c("PierreBEZUKHOV"),
  "labno_suffix" = c("12345678a"),
  "labno_suffix_worksheet" = c("12345678a_WS123456")
)

test_that("mutate_ids works with old xlsx format without panel name", {
  
  input <- data.frame(
    "filename" = "Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx"
  )
  
  expect_equal(mutate_ids(df = input) |> 
                 dplyr::select(-filename),
               expected_df_name)
  
})

test_that("mutate_ids works with new vcf format", {
  
  input <- data.frame(
    "filename" = "hotspots_WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.vcf"
  )
  
  expect_equal(mutate_ids(df = input) |> 
                 dplyr::select(-filename),
               expected_df_name)
  
})

test_that("mutate_ids works for annotated PanSolid format with panel name", {
  
  input <- data.frame(
    "filename" = "Annotated_v2PANSOLID_WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.xlsx"
  )
  
  expect_equal(mutate_ids(input) |> 
                 dplyr::select(-filename),
               expected_df_name)
  
})

test_that("mutate_ids works for unannotated PanSolid format", {
  
  input <- data.frame(
    "filename" = "Results_SNVs_Indels-WS123456_12345678a_PierreBEZUKHOV_S26_R3_601.xlsx"
  )
  
  expect_equal(mutate_ids(input) |> 
                 dplyr::select(-filename),
               expected_df_name)
  
})

test_that("mutate_ids works for coverage txt file", {
  
  input <- data.frame(
    "filename" = "Whole Panel Target UMI Coverage-WS123456_12345678_S35_R9_021.txt"
  )
  
  expected_df <- data.frame(
    "filename" = "Whole Panel Target UMI Coverage-WS123456_12345678_S35_R9_021.txt",
    "labno" = c("12345678"),
    "worksheet" = c("WS123456"),
    "suffix" = c(""),
    "name" = c("S35"),
    "labno_suffix" = c("12345678"),
    "labno_suffix_worksheet" = c("12345678_WS123456")
  )

  expect_equal(mutate_ids(input),
               expected_df)
  
})

test_that("mutate_ids works without name and with json format", {
  
  input <- data.frame(
    "filename" = "Combined QC Reports-WS123456_12345678a_S2_R1_001.json"
  )
  
  expected_df <- data.frame(
    "filename" = "Combined QC Reports-WS123456_12345678a_S2_R1_001.json",
    "labno" = c("12345678"),
    "worksheet" = c("WS123456"),
    "suffix" = c("a"),
    "name" = c("S2"),
    "labno_suffix" = c("12345678a"),
    "labno_suffix_worksheet" = c("12345678a_WS123456")
  )
  
  expect_equal(mutate_ids(input),
               expected_df)
  
})

test_that("mutate_ids works with different column name and HTML file", {
  
  input <- data.frame(
    "file" = "XX_WS123456_12345678b_PierreBEZUKHOV_all_log2ratios.html"
  )
  
  expected_df <- data.frame(
    "file" = "XX_WS123456_12345678b_PierreBEZUKHOV_all_log2ratios.html",
    "labno" = c("12345678"),
    "worksheet" = c("WS123456"),
    "suffix" = c("b"),
    "name" = c("PierreBEZUKHOV"),
    "labno_suffix" = c("12345678b"),
    "labno_suffix_worksheet" = c("12345678b_WS123456")
  )
  
  expect_equal(mutate_ids(input, id_col = file),
               expected_df)
  
})

test_that("mutate_ids works with different regex", {
  
  input <- data.frame(
    "file" = "12345678a_PierreBEZUKHOV_WS123456.csv"
  )
  
  expect_equal(mutate_ids(input, 
                          id_col = file,
                          regex = regex_filename()$non_standard_regex) |> 
                 dplyr::select(-file),
               expected_df_name)
  
})
