#!/bin/bash
# Script to install NetMHCpan and its dependencies
# on the Peregrine computer cluster
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --job-name=install_netMHCpan
#SBATCH --output=install_netMHCpan.log
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
Rscript -e "devtools::install_github(\"tzina97/netMHCpanW\", ref = \"$branch\")"

echo "Installing NetMHCpan"
Rscript -e 'netMHCpan::install_netMHCpan()'

echo "NetMHCpan binary installed:"
Rscript -e 'netMHCpan::is_netMHCpan_bin_installed()'

echo "NetMHCpan data installed:"
Rscript -e 'netMHCpan::is_netMHCpan_data_installed()'

echo "NetMHCpan set up:"
Rscript -e 'netMHCpan::is_netMHCpan_set_up()'

echo "TCSH installed:"
Rscript -e 'netMHCpan::is_tcsh_installed()'

echo "Default NetMHCpan_folder: "
Rscript -e 'netMHCpan::get_default_netMHCpan_folder()'

echo "Show NetMHCpan alleles:"
Rscript -e 'utils::head(netMHCpan::get_netMHCpan_alleles())'

echo "NetMHCpan run:"
Rscript -e 'netMHCpan::run_netMHCpan(fasta_filename = system.file("extdata", "example.fasta", package = "netMHCpan"))'



