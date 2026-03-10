#' getEGG
#'
#' @param version Version of EGG database to be downloaded
#' @param data_type Type of data to be downloaded (metadata, table, or taxonomic assignments)
#'
#' @returns A R object of the requested data type from the EGG database
#' @export
#'
#' @examples
#'metadata = getEGG(version = "1.0.0", data_type = "metadata")
#'
#'metadata = getEGG(version = "1.0.0", data_type = "table")
#'
#'metadata = getEGG(version = "1.0.0", data_type = "taxonomy")

getEGG = function(version = "1.0.0",
                  data_type = c('metadata', 'table', 'taxonomy')){
  tryCatch({
    zenodo_id = match.arg(
      .pkg_env$database_versions[[version]]
    )
  }, error = function(e){
    stop("Version number not found. Run get_EGG_version() for avaible versions.")
  })
  tryCatch({
    data_type = match.arg(
      .pkg_env$data_type[[data_type]]
    )
  }, error = function(e){
    stop('Data type unavailable. Please select from c("metadata", "table", "taxonomy"')
  })

  url = paste0("https://zenodo.org/records/",
               zenodo_id,
               "/files/",
               data_type,
               ".Rds")

  if(!file.exists(url)){
    stop(paste("File does not exist at:", url))
  }

  tmp = "tmp/data.Rds"
  download.file(url, tmp)
  data = readRDS(tmp)

  file.remove(tmp)

  return(data)
}


