#' Get EGG Version History
#'
#' @returns Data frame with version history and corresponding Zenodo ID.
#' @export
#'
#' @examples
#' getEGG_version()
getEGG_version = function(){

  df = stack(.pkg_env$database_versions, )

  names(df) = c('Zenodo_ID', 'Version')

  return(df)

}
