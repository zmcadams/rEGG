#' Subsetting EGG Files
#'
#' @importFrom utils write.csv
#'
#' @param samples Object containing sample IDs to be subset from EGG dataset
#' @param metadata EGG metadata object
#' @param table EGG table object
#' @param taxonomy EGG taxonomy object
#' @param output_file Name of output directory to be created
#'
#' @returns Writes three comma-separated values files
#' @export
#'
#' @examples
#'
#' metadata = data.frame(
#'  sampleid = c("A", "B"),
#'  group = c(1, 2)
#' )
#'
#' samples = c("A", "B")
#'
#' table = data.frame(
#'  featureid = c("a1", "b1"),
#'  A = c(1,0),
#'  B = c(0,1)
#' )
#'
#' taxonomy = data.frame(
#'  featureid = c("a1", "b1"),
#'  taxon = c("Bacteria.Bacillota", "Bacteria.Pseudomonadota")
#' )
#'
#' subsetEGG(samples = samples,
#'           metadata = metadata,
#'           table = table,
#'           taxonomy = taxonomy,
#'           output_file = 'filtered_data'
#' )
#'
#' unlink('filtered_data', recursive = TRUE)
#'
subsetEGG = function(
    samples = NULL,
    metadata = NULL,
    table = NULL,
    taxonomy = NULL,
    output_file = NULL
)
{
  # Checks if file already exists, creates if not.
  if (file.exists(output_file)) {
    stop("Output file exists. Please choose a different name.")
  }
  dir.create(output_file)

  if(is.null(metadata)){
    remove(output_file)
    stop("Metadata object was not included in command.\n
         Output folder removed.")
  }

  metadata = metadata[metadata$sampleid %in% samples, ]

  write.csv(metadata,
            file = paste0(output_file,'/metadata.csv'),
            row.names = F)

  if(is.null(table)){
    stop("Table object was not included in command.\n
         Remove output folder and rerun with table object.")
  }

  table = table[, c('featureid', samples), drop = F]

  table <- table[rowSums(table[sapply(table, is.numeric)]) != 0, ]

  write.csv(table,
            file = paste0(output_file,'/table.csv'),
            row.names = F)

  if(is.null(taxonomy)){
    stop("Taxonomy object was not included in command.\n
         Remove output folder and rerun with taxonomy object.")
  }

  taxonomy = taxonomy[taxonomy$featureid %in% table$featureid, ]
  write.csv(taxonomy, file = paste0(output_file,'/taxonomy.csv'), row.names = F)

}
