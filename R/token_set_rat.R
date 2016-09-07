#' Token Set Ratio (Internal)
#'
#' Computes the Token Set Ratio Between Two Strings
#' 
#' Both token_set_ratio and token_sort_ratio treat each word in a string as a "token." These tokens are compared across the two strings. token_set_ratio compares two strings, and returns the ratio of set of shared tokens (i.e. only the words appearing in *both* strings) to the length of the first string.
#'
#' @keywords internal


stopwords <- c('and', '&', 'of', 'the', 'an', 'a')



.token_set_rat <- function(x1, x2, extra_stops = c()){
  stopwords <- c(stopwords, extra_stops)
  x1c <- gsub('&', 'and', x1) 
  x1c <- gsub('[[:punct:]]', '', x1c) 
  x1c <- tolower(x1c) 
  x1c <- stringi::stri_split_fixed(x1c, " ") 
  x1c <- unlist(x1c) 
  x1c <- x1c[!x1c %in% stopwords]
  x2c <- gsub('&', 'and', x2) 
  x2c <- gsub('[[:punct:]]', '', x2c) 
  x2c <- tolower(x2c) 
  x2c <- stringi::stri_split_fixed(x2c, " ") 
  x2c <- unlist(x2c) 
  x2c <- x2c[!x2c %in% stopwords]
  x1c <- unique(x1c)
  x2c <- unique(x2c)
  cstr <- c(x1c, x2c)
  substr <- cstr[duplicated(cstr)]
  substr <- nchar(paste(substr, collapse = ''))
  x1cn <- nchar(paste(x1c, collapse = ''))
  if(substr == 0 | x1cn == 0){
    ratio <- 0
  }else{
    ratio <- substr/x1cn
  }
  as.integer(ratio * 100)
}

.token_set_rat <- compiler::cmpfun(.token_set_rat)
