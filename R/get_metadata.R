#' Pull EGG Data Files
#'
#' @param version Version of EGG database; default = 1.0.0
#'
#' @returns
#' @export
#'
#' @examples
#'
getEGG = function(version = "1.0.0",
                  data_type = c('metadata', 'table', 'taxonomy')){
  zenodo_id = .pkg_env$database_versions[[version]]
  data_type = .pkg_env$data_type[[data_type]]
  url = paste0("https://zenodo.org/records/",
               zenodo_id,
               "/files/",
               data_type,
               ".Rds")
  tmp = "tmp/data.Rds"
  download.file(url, tmp)
  data = readRDS(tmp)
  file.remove(tmp)
  return(data)
}


