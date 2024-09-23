#' Class definition for series object
#'
#' @slot mnemonic character.
#' @slot description character.
#' @slot units character.
#' @slot source character.
#' @slot table character.
#' @slot index ANY.
#' @slot model_desc character.
#' @slot frequency numeric.
#' @slot start_date numeric.
#' @slot end_date numeric.
#' @slot raw_data ts.
#' @slot data mts.
#'
#' @return series-obj
#' @export
#'
#' @examples
setClass("series-obj",
         slots = list(mnemonic     = "character",
                      description  = "character",
                      units        = "character",
                      source       = "character",
                      table        = "character",
                      index        = "ANY",
                      model_desc   = "character",
                      frequency    = "numeric",
                      start_date   = "numeric",
                      end_date     = "numeric",
                      raw_data     = "ts",
                      data         = "mts"))

#' Class definition for database object
#'
#' @slot series list.
#' @slot data mts.
#' @slot db matrix.
#'
#' @return db-obj
#' @export
#'
#' @examples
setClass("db-obj",
         slots = list(series = "list",
                      data   = "mts",
                      db     = "matrix"))
