# Note that in this workshop example, the by_hand_data.txt was created using the pbdb_data.csv, so the same data is being used in both cases, but with different formats. You can use either format, but the pbdb format is more straightforward if you are downloading data from the PBDB, and the by_hand format is more flexible if you are using data from other sources.

source("C:/Users/SimoesLabAdmin/Documents/PyRate/pyrate_utilities.r")

extract.ages.pbdb(file = "C:\\Users\\SimoesLabAdmin\\Documents\\pyrate_workshop\\pbdb_data.csv", replicates = 10) 
# Notes: using extract.ages.pbdb means your file should be a csv as above, (unless you reset the sep argument) so pbdb_datat.txt, sep="\t"
# and your column names should be accepted_name, min_ma and max_ma

# extract.ages(file = "C:\\Users\\SimoesLabAdmin\\Documents\\pyrate_workshop\\by_hand_data.txt", replicates = 10)
# using extract.ages, means your file must be a txt, no options for otherwise
# you need columns: Species, Status, min_age, max_age, in that order + possibly a "site" and "trait" column but not both. The 'Status' column is added by you, by hand