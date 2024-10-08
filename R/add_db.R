#' Add a series to a database
#'
#' @param db_obj db-obj.
#' @param series series-obj.
#'
#' @return db-obj
#' @export
#'
#' @examples
add_db <- function(db_obj, series){

  # Get number of series in the database
  nseries <- length(db_obj@series)

  # Add the series into the next position in the database
  db_obj@series[[nseries+1]] <- series

  # Add the name of the series
  names(db_obj@series)[nseries+1] <- deparse(substitute(series))

  # Add the raw data to the database object
  db_obj@data <- cbind(db_obj@data, series@raw_data)

  # Update the time and trend variables in slot 1 and 2
  series2 <- methods::new("series-obj", description="Trend", units=paste0(paste(as.character(stats::start(db_obj@data)),collapse = "Q"),"=1"), raw_data = stats::ts(1:nrow(db_obj@data), start = stats::start(db_obj@data), frequency = 4))
  series1 <- methods::new("series-obj", description="Time", units="Time", raw_data = stats::time(db_obj@data))

  # Add the two series to the database object
  db_obj@series[[1]] <- series1 # Time
  db_obj@series[[2]] <- series2 # Trend

  # Add the raw data to the database object
  db_obj@data[,1] <- series1@raw_data
  db_obj@data[,2] <- series2@raw_data

  # Update the units for the trend
  db_obj@db[3,2] <- paste0(paste(as.character(stats::start(db_obj@data)),collapse = "Q"),"=1")

  # Create the metadata
  varname <- c(db_obj@db[1,], deparse(substitute(series)))
  descrip <- c(db_obj@db[2,], paste0(series@description, collapse = ", "))
  unis    <- c(db_obj@db[3,], paste0(series@units, collapse = ", "))
  src     <- c(db_obj@db[4,], series@table)

  # Add the metadata and data to the database object
  db_obj@db <- rbind(varname, descrip, unis, src, db_obj@data)

  # Add column names
  colnames(db_obj@db)[length(colnames(db_obj@db))] <- deparse(substitute(series))

  # Add row names
  rownames(db_obj@db)[5:length(rownames(db_obj@db))] <- db_obj@db[5:length(rownames(db_obj@db)), 1]

  return(db_obj)
}
