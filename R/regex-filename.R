regex_filename <- function() {
  
  #' Regular expressions for filenames
  #'
  #' @returns A named list of regular expressions for different filename formats
  #' @export
  #'
  #' @examples regex_filename()$standard_regex
  
  output_list <- list(
    
    "standard_regex" = list(
      "regex" = 
        paste0("^.*",
               regex_ids()$worksheet,
               "_",
               regex_ids()$labno,
               regex_ids()$suffix,
               "_",
               regex_ids()$name,
               ".*$"),
      "groups" = list(
        "worksheet" = 1,
        "labno" = 2,
        "suffix" = 3,
        "name" = 4
        )
      ),
    
    "non_standard_regex" = list(
      "regex" = 
        paste0("^.*",
               regex_ids()$labno,
               regex_ids()$suffix,
               "_",
               regex_ids()$name,
               "_",
               regex_ids()$worksheet,
               ".*$"),
      "groups" = list(
        "labno" = 1,
        "suffix" = 2,
        "name" = 3,
        "worksheet" = 4
        )
      )
    )
  
  return(output_list)
  
}
