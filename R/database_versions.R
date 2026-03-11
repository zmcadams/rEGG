# Create environment within package to store variables
.pkg_env <- new.env(parent = emptyenv())

# List to store EGG version numbers and corresponding
# Zenodo IDs.
.pkg_env$database_versions = list(
  '1.0.0' = 18909650, # original database
  '1.1.0' = 18959770, # added BioSample IDs
  '1.1.1' = 18960181  # converted BioSample CSV to Rds
)

# List to store data types accessible via rEGG.
.pkg_env$data_type = list(
  'metadata' = 'metadata.Rds',
  'table' = 'dada2_table.Rds',
  'taxonomy' = 'taxonomy.Rds',
  'biosample' = 'biosampleID.Rds'
)
