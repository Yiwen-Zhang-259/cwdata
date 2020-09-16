
#'@param

## data A dataset containing a `country` column.

#' @export
 n_countries <- function(data) {
   dplyr::n_distinct(data$country)
   }
