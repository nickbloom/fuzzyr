#' Substring Match (Internal)
#'
#' Computes Substring Ratio Between Two Strings
#' 
#' Substring Ratio returns the score of two strings based on the ratio of shared words to the length of both strings combined.
#'
#' @keywords internal
#' 




.substring_match <- function(unstr){
  nc <- nchar(unstr)
  unstr <- unstr[nc > 2]
  unstr <- as.character(sort(reorder(unstr, nchar(unstr))))
  unstr2 <- unstr
  matches <- purrr::map(unstr, ~ which(str_detect(unstr, .), arr.ind = TRUE))
  matches <- purrr::keep(matches, ~ length(.)>1)
  matches <- unlist(matches)
  if(length(matches) > 1){
     unstr2[matches] <- NA
  }
  unstr2 <- na.omit(unstr2)
  if(length(unstr2) == 0){
  unstr2 <- ''
  }
  return(unstr2)
}


.substring_match <- compiler::cmpfun(.substring_match)