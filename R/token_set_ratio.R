#' Token Set Ratio
#'
#' Computes the Token Set Ratio Between Two Strings
#' 
#' Both token_set_ratio and token_sort_ratio treat each word in a string as a "token." These tokens are compared across the two strings. token_set_ratio compares two strings, and returns the ratio of set of shared tokens (i.e. only the words appearing in *both* strings) to the length of the first string.
#' 
#' @name token_set_ratio
#' @param x1 a single string or vector of strings
#' @param x2 a single string or vector of strings
#' @param extra_stops additional words to add to stopword list
#' @return A ratio score between 0 and 100
#' @examples
#' cars$distsp <- paste(cars$dist, '.0', sep = '')
#' cars <- cbindr(cars, 'distsp', '.', c('orgdist', 'zero'))
#'
#' @export




token_set_ratio <- function(x1, x2, extra_stops = c()){
  ratio <- purrr::map2_dbl(x1, x2, ~ .token_set_rat(.x, .y, extra_stops))
  as.integer(ratio)
}