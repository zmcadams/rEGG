#' getEGG
#'
#' @param version Version of EGG database to be downloaded
#' @param data_type Type of data to be downloaded (metadata, table, or taxonomic assignments)
#'
#' @returns A R object of the requested data type from the EGG database.
#' @export
#'
#' @examples
#'metadata = getEGG(version = "1.1.1", data_type = "metadata")
#'
#'taxonomy = getEGG(version = "1.1.1", data_type = "taxonomy")

getEGG = function(version = "1.1.1",
                  data_type = c('metadata', 'table',
                                'taxonomy', 'biosample')){

  ## Check if version is available.
  ## If yes, then store Zenodo ID
  if (!version %in% names(.pkg_env$database_versions)) {
    stop("Version number not found. Run getEGG_version() for available versions.")
  }

  zenodo_id = .pkg_env$database_versions[[version]]

  ## Check if a single data type was entered.
  ## Check if data type is available.
  ## If yes, then store.
  if(length(data_type) != 1){
    stop("Please enter a single data type value.")
  }

  if(!data_type %in% names(.pkg_env$data_type)){
    stop('Data type unavailable. Please select from c("metadata", "table", "taxonomy", "biosample"')
  }

  data_type = .pkg_env$data_type[[data_type]]

  ## Read RDS file from Zenodo database
  data = readRDS(zendown::zen_file(zenodo_id, data_type))

  return(data)

}


