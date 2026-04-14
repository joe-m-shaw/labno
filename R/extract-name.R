extract_name <- function(input) {
  
  #' Extract patient name from a character string
  #'
  #' @param input A character string containing the patient name after the labno
  #'
  #' @returns The patient name as a string
  #' @export
  #'
  #' @examples extract_name("WS123456_12345678_AnnaKarenina")
  
  output <- stringr::str_extract(string = input,
                                 pattern = regex_filename()$filename_with_names,
                                 group = 4)
  
  return(output)
  
}
