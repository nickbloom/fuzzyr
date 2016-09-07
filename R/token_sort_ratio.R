#' Token Sort Ratio
#'
#' Computes the Token Sort Ratio Between Two Strings
#' 
#' Both token_set_ratio and token_sort_ratio treat each word in a string as a "token." These tokens are compared across the two strings. token_sort_ratio does the same things as token_set_ratio, but sorts the tokens alphabetically first.
#' 
#' @name token_sort_ratio
#' @param x1 a single string or vector of strings
#' @param x2 a single string or vector of strings
#' @param extra_stops additional words to add to stopword list
#' @return A ratio score between 0 and 100
#' @examples
#' cars$distsp <- paste(cars$dist, '.0', sep = '')
#' cars <- cbindr(cars, 'distsp', '.', c('orgdist', 'zero'))
#'
#' @export


token_sort_ratio <- function(x1, x2, extra_stops = c()){
  ratio <- purrr::map2_dbl(x1, x2, ~ .token_sort_rat(.x, .y, extra_stops))
  as.integer(ratio)
}
