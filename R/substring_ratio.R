#' Substring Ratio
#'
#' Computes Substring Ratio Between Two Strings
#' 
#' Substring Ratio returns the score of two strings based on the ratio of shared words to the length of both strings combined.
#' 
#' @name substr_ratio
#' @param x1 a single string or vector of strings
#' @param x2 a single string or vector of strings
#' @param extra_stops additional words to add to stopword list
#' @return A ratio score between 0 and 100
#' @examples
#' cars$distsp <- paste(cars$dist, '.0', sep = '')
#' cars <- cbindr(cars, 'distsp', '.', c('orgdist', 'zero'))
#'
#' @export


substr_ratio <- function(x1, x2, extra_stops = c()){
  ratio <- purrr::map2_dbl(x1, x2, ~ .substr_rat(.x, .y, extra_stops))
  return(as.integer(ratio * 100))
}
