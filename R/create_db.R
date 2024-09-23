create_db <- function(){

  # Create new database object
  db_obj <- new("db-obj")

  # Create two initial series objects for time and trend
  series2 <- new("series-obj", description="Trend", units="2000Q1=1", raw_data = ts(1:100, start=c(2000, 1), frequency = 4))
  series1 <- new("series-obj", description="Time", units="2000Q1=2000", raw_data = time(series1@raw_data), frequency = 4)

  # Add the two series to the database object
  db_obj@series[[1]] <- series1 # Time
  db_obj@series[[2]] <- series2 # Trend

  # Add the raw data to the database object
  db_obj@data <- cbind(time(series1@raw_data), series1@raw_data)

  # Create the metadata
  varname <- cbind("Variable", "T")
  descrip <- cbind("Description", "Trend")
  unis    <- cbind("Units", "Start=1")
  src     <- cbind("Source", "Formula")

  # Add the metadata and data to the database object
  db_obj@db  <- rbind(varname, descrip, unis, src, db_obj@data)

  return(db_obj)
}
