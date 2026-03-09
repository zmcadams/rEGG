.pkg_env <- new.env(parent = emptyenv())

.pkg_env$database_versions = list(
  '1.0.0' = 18909650 # Initial Version
)

.pkg_env$data_type = list(
  'metadata' = 'metadata',
  'table' = 'Dada2_table',
  'taxonomy' = 'taxonomy'
)
