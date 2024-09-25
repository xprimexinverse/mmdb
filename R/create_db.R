#' Create database
#'
#' @return db-obj
#' @export
#'
#' @examples
create_db <- function(){

  # Create new database object
  db_obj <- methods::new("db-obj")

  # Create two initial series objects for time and trend
  series2 <- methods::new("series-obj", description="Trend", units="2000Q1=1", raw_data = stats::ts(1:10, start=c(2000, 1), frequency = 4))
  series1 <- methods::new("series-obj", description="Time", units="Time", raw_data = stats::time(series2@raw_data))

  # Add the two series to the database object
  db_obj@series[[1]] <- series1 # Time
  db_obj@series[[2]] <- series2 # Trend

  # Add the raw data to the database object
  db_obj@data <- cbind(stats::time(series2@raw_data), series2@raw_data)

  # Create the metadata
  varname <- cbind("Variable", "T")
  descrip <- cbind("Description", "Trend")
  unis    <- cbind("Units", paste0(paste(as.character(stats::start(series2@raw_data)),collapse = "Q"),"=1"))
  src     <- cbind("Source", "Formula")

  # Add the metadata and data to the database object
  db_obj@db  <- rbind(varname, descrip, unis, src, db_obj@data)

  # Add column names
  colnames(db_obj@db)  <- c("Time", "Trend")

  # Add row names
  # rownames(db_obj@db)[5:length(rownames(db_obj@db))] <- db_obj@db[5:length(rownames(db_obj@db)), 1]

  return(db_obj)
}
