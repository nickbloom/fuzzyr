#' Substring Ratio (Internal)
#'
#' Computes Substring Ratio Between Two Strings
#' 
#' Substring Ratio returns the score of two strings based on the ratio of shared words to the length of both strings combined.
#'
#' @keywords internal



stopwords <- c('and', '&', 'of', 'the', 'an', 'a')


.substr_rat <- function(x1, x2, extra_stops = c()){
  stopwords <- c(stopwords, extra_stops)
  x1c <- gsub('&', 'and', x1) 
  x1c <- gsub('[[:punct:]]', '', x1c) 
  x1c <- tolower(x1c) 
  x1c <- stringi::stri_split_fixed(x1c, " ") 
  x1c <- unlist(x1c)
  x2c <- gsub('&', 'and', x2) 
  x2c <- gsub('[[:punct:]]', '', x2c) 
  x2c <- tolower(x2c) 
  x2c <- stringi::stri_split_fixed(x2c, " ") 
  x2c <- unlist(x2c)
  #x2c <- gsub('&', 'and', x2) %>% gsub('[[:punct:]]', '', .) %>% tolower(.) %>% stri_split_fixed(., " ") %>% unlist(.)
  x1c <- x1c[!x1c %in% stopwords]
  x2c <- x2c[!x2c %in% stopwords]
  x1c <- x1c[!duplicated(x1c)]
  x2c <- x2c[!duplicated(x2c)]
  cstr <- c(x1c, x2c)
  substr <- cstr[duplicated(cstr)]
  unstr <- unique(cstr) 
  unstr <- unstr[!unstr %in% substr]
  unstr2 <- .substring_match(unstr)
  substr_len <- nchar(paste(substr, collapse = ''))
  unstr_len <- nchar(paste(unstr2, collapse = ''))
  ratio <- substr_len/(substr_len + unstr_len)
  return(ratio)
}

.substr_rat <- compiler::cmpfun(.substr_rat)

