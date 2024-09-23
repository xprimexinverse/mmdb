add_db <- function(db_obj, series){

  # Get number of series in the database
  nseries <- length(db_obj@series)

  # Add the series into the next position in the database
  db_obj@series[[nseries+1]] <- series

  # Add the name of the series
  names(db_obj@series)[nseries+1] <- deparse(substitute(series))

  # Add the raw data to the database object
  db_obj@data <- cbind(db_obj@data, series@raw_data)

  # Update the time and trend variables in slot 1 and 2 [TODO]
  # series1     <- new("series-obj", description="Trend", units="2000Q1=1", raw_data = ts(1:100, start=c(2000, 1), frequency = 4))
  # series1time <- new("series-obj", description="Trend", units="2000Q1=2000", raw_data = time(series1@raw_data), frequency = 4)
  # dbo@series[[1]] <- series1time
  # dbo@series[[2]] <- series1

  # Create the metadata
  varname <- c(db_obj@db[1,], deparse(substitute(series)))
  descrip <- c(db_obj@db[2,], series@description[1])
  unis    <- c(db_obj@db[3,], series@units[1])
  src     <- c(db_obj@db[4,], series@table)

  # Add the metadata and data to the database object
  db_obj@db <- rbind(varname, descrip, unis, src, db_obj@data)

  return(db_obj)
}
