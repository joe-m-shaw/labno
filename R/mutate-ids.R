mutate_ids <- function(df, 
                       id_col = filename, 
                       regex = regex_filename()$standard_regex){
  
  #' Add sample identifiers from filename as additional data columns
  #'
  #' @param df The dataframe to add identifiers to
  #' @param id_col The column in the dataframe which includes the filename
  #' @param regex The regular expression to use for identifier matching
  #'
  #' @returns The original dataframe with additional columns of identifiers 
  #' from the filename column
  #' @export
  #' 
  
  output <- df |> 
    dplyr::mutate(
      labno = stringr::str_extract(string = {{ id_col }},
                                   pattern = regex$regex,
                                   group = regex$groups$labno),
      
      worksheet = stringr::str_extract(string = {{ id_col }},
                                       pattern = regex$regex,
                                       group = regex$groups$worksheet),
      
      suffix = stringr::str_extract(string = {{ id_col }},
                                    pattern = regex$regex,
                                    group = regex$groups$suffix),
      
      name = stringr::str_extract(string = {{ id_col }},
                                  pattern = regex$regex,
                                  group = regex$groups$name),
      
      labno_suffix = paste0(labno, suffix),
      labno_suffix_worksheet = paste0(labno_suffix, "_", worksheet))
    
  return(output)
  
}
