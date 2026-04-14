filename_to_df <- function(filename){
  
  #' Convert a filename into a dataframe of identifiers
  #'
  #' @param filename A filename with identifiers in specified format
  #'
  #' @returns A dataframe of sample identifiers
  #' @export
  #'
  #' @examples filename_to_df("Annotated_WS123456_12345678a_PierreBEZUKHOV.xlsx")
  
  output <- data.frame(
    labno = extract_labno(filename),
    worksheet = extract_worksheet(filename),
    suffix = stringr::str_extract(string = filename,
                                  pattern = regex_filename()$filename_with_names,
                                  group = 3),
    name = stringr::str_extract(string = filename,
                                pattern = regex_filename()$filename_with_names,
                                group = 4)) |> 
    dplyr::mutate(
      labno_suffix = paste0(labno, suffix),
      labno_suffix_worksheet = paste0(labno_suffix, "_", worksheet))
  
  return(output)
  
}
