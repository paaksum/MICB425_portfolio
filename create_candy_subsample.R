# Load packages
library(tidyverse)
library(phyloseq)

# Load your data
## Name your data table "Table1" or modify the following code to use your data table's name 

# Modify Table 1 to be a community matrix, i.e. samples as rows (you will only have 1), "species" as columns, and the encompassed data as counts of those "species" in the sample
community = Table1 %>% 
  # Select only name and count columns
  select(name, occurences) %>%
  # Spread into taxa as columns format
  spread(name, occurences) %>% 
  # Convert to phyloseq OTU table data type
  otu_table(taxa_are_rows = FALSE) 

# Create a random subsample (rarefy) the data to 100 observations
subsample = as.data.frame(rarefy_even_depth(community, sample.size=100, replace=FALSE, rngseed=762))
