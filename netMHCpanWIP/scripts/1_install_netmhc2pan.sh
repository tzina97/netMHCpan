#!/bin/bash
# Script to install NetMHCIIpan and its dependencies
# on the Peregrine computer cluster
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=install_netmhc2pan
#SBATCH --output=install_netmhc2pan.log
module load GCCcore/4.9.3
module load XZ/5.2.2-foss-2016a
module load R
module load Perl

branch=$1
if [ "$#" -ne 1 ]; then
  branch=master
fi

echo "Installing perl package 'Env':"
/usr/bin/perl -MCPAN -e 'install Env'

echo "Installing GitHub"
Rscript -e "devtools::install_github(\"richelbilderbeek/netmhc2pan\", ref = \"$branch\")"

echo "Installing NetMHC2pan"
Rscript -e 'netmhc2pan::install_netmhc2pan()'

echo "NetMHC2pan binary installed:"
Rscript -e 'netmhc2pan::is_netmhc2pan_bin_installed()'

echo "NetMHC2pan data installed:"
Rscript -e 'netmhc2pan::is_netmhc2pan_data_installed()'

echo "NetMHC2pan set up:"
Rscript -e 'netmhc2pan::is_netmhc2pan_set_up()'

echo "TCSH installed:"
Rscript -e 'netmhc2pan::is_tcsh_installed()'

echo "Default NetMHC22pan_folder: "
Rscript -e 'netmhc2pan::get_default_netmhc2pan_folder()'

echo "Show NetMHC2pan alleles:"
Rscript -e 'utils::head(netmhc2pan::get_netmhc2pan_alleles())'

echo "NetMHC2pan run:"
Rscript -e 'netmhc2pan::run_netmhc2pan(fasta_filename = system.file("extdata", "example.fasta", package = "netmhc2pan"))'

