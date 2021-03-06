#' Token Sort Ratio (Internal)
#'
#' Computes the Token Set Ratio Between Two Strings
#' 
#' Both token_set_ratio and token_sort_ratio treat each word in a string as a "token." These tokens are compared across the two strings. token_sort_ratio does the same things as token_set_ratio, but sorts the tokens alphabetically first.
#'
#' @keywords internal
#' 

stopwords <- c('and', '&', 'of', 'the', 'an', 'a', 'at')

.token_sort_rat <- function(x1, x2, stops = c(), rem_dupe = FALSE){
  stopwords <- c(stopwords, stops)
  x1c <- gsub('&', 'and', x1) 
  x1c <- gsub('[[:punct:]]', '', x1c) 
  x1c <- tolower(x1c) 
  x1c <- stringi::stri_split_fixed(x1c, " ") 
  x1c <- unlist(x1c) 
  x1c <- x1c[!x1c %in% stopwords]
  x1c <- x1c[!x1c == ""]
  x2c <- gsub('&', 'and', x2) 
  x2c <- gsub('[[:punct:]]', '', x2c) 
  x2c <- tolower(x2c) 
  x2c <- stringi::stri_split_fixed(x2c, " ") 
  x2c <- unlist(x2c) 
  x2c <- x2c[!x2c %in% stopwords]
  x2c <- x2c[!x2c == ""]
 # x2 <- gsub('&', 'and', x2) %>% gsub('[[:punct:]]', '', .) %>% tolower(.) %>% stringi::stri_split_fixed(., " ") %>% unlist(.) %>% .[!. %in% stopwords]
  if(rem_dupe == TRUE){
    x1 <- x1[!duplicated(x1)]
    x2 <- x2[!duplicated(x2)]
  }
  x1c <- x1c[order(x1c)]
  x1c <- paste(x1c, collapse = '')
  x2c <- x2c[order(x2c)]
  x2c <- paste(x2c, collapse = '')
  x1co <- paste(x1, collapse = '')
  x1co <- gsub(" ", "", x1co)
  x2co <- paste(x2, collapse = '')
  x2co <- gsub(" ", "", x2co)
  lensum <- nchar(x1co) + nchar(x2co)
  str_dist <- stringdist::stringdist(x1c, x2c, method = 'lv')
  ratio <- (lensum - str_dist)/lensum
  as.integer(ratio * 100)
}

.token_sort_rat <- compiler::cmpfun(.token_sort_rat)

