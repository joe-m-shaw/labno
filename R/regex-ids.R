regex_ids <- function(){
  
  #' Regular expressions for sample identifiers
  #'
  #' @returns A named list of regular expressions for different identifiers
  #' @export
  #'
  #' @examples regex_ids()$labno
  
  output_list <- list(
    
    "worksheet" = "(WS\\d{6})",
    "labno" = "(\\d{8})",
    "suffix" = "(a|b|c|d|)",
    "name" = "([:alnum:]{2,30})"
  )
  
  return(output_list)
  
}
