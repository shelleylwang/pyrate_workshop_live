#!/bin/bash
#SBATCH --job-name=pyrate_workshop_bdnn         # Job name
#SBATCH --array=1-10                     # Array with 10 independent tasks
#SBATCH --mem-per-cpu=200MB                # Memory per CPU core (adjust if needed)
#SBATCH --time=1-00:00:00               # Time limit, e.g., 1 day
#SBATCH --mail-type=begin               # Send email when job begins
#SBATCH --mail-type=end                 # Send email when job ends
#SBATCH --mail-user=sw8569@princeton.edu
#SBATCH --output=/scratch/gpfs/SIMOES/sw8569/pyrate_workshop/bdnn_%j_%A_%a.out
#SBATCH --error=/scratch/gpfs/SIMOES/sw8569/pyrate_workshop/bdnn_%j_%A_%a.err
#SBATCH --no-requeue                    # Disable requeue

# Change to the directory where the script should run
cd /scratch/gpfs/SIMOES/sw8569/pyrate_workshop

# Load necessary modules
module purge
module load anaconda3/2024.2


# Define command to run
python ../PyRate/PyRate.py input_data/pbdb_data_PyRate.py \
-qShift Time_bins_ByStages.txt -mG \
-BDNNmodel 1 \
-BDNNtimevar predictor_data/environmental_data_standardized.csv \
-BDNNtimetrait 0 -BDNN_nsim_expected_cv 0 -translate 199 -BDNNnodes 4 2 -BDNNupdate_f 0.3 \
-n 100000 -s 100 -wd bdnn -j ${SLURM_ARRAY_TASK_ID} 