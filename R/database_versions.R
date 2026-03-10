# Create environment within package to store variables
.pkg_env <- new.env(parent = emptyenv())

# List to store EGG version numbers and corresponding
# Zenodo IDs.
.pkg_env$database_versions = list(
  '1.0.0' = 18909650
)

# List to store data types accessible via rEGG.
.pkg_env$data_type = list(
  'metadata' = 'metadata',
  'table' = 'Dada2_table',
  'taxonomy' = 'taxonomy'
)
