#' Fuzzy Ratio
#'
#' Computes the Fuzzy Ratio Between Two Strings
#' 
#' Fuzzy ratio is the simplest function in the package. It simply returns the ratio of the number of unshared characters in two strings to the length of the two strings.
#' 
#' @name fuzz_ratio
#' @param x1 a single string or vector of strings
#' @param x2 a single string or vector of strings
#' @param extra_stops additional words to add to stopword list
#' @return A ratio score between 0 and 100
#' @examples
#' cars$distsp <- paste(cars$dist, '.0', sep = '')
#' cars <- cbindr(cars, 'distsp', '.', c('orgdist', 'zero'))
#'
#' @export

fuzz_ratio <- function(x1, x2){
  l1 <- nchar(x1)
  l2 <- nchar(x2)
  sd <- stringdist::stringdist(x1, x2)
  sumlen <- l1 + l2
  ratio <- (sumlen - sd)/sumlen
  return(as.integer(ratio * 100))
}
