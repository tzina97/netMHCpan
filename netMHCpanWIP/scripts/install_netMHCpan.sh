#!/bin/bash
#
# Installs NetMHCpan using the R code in the 'netMHCpan' package
#
# Because the R code in the package uses 'netMHCpan::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/install_netMHCpan.sh
#
#
cat R/install_netMHCpan.R > tempscript.R
cat R/capitalize_first_char.R >> tempscript.R
cat R/get_default_netMHCpan_bin_path.R >> tempscript.R
cat R/get_default_netMHCpan_folder.R >> tempscript.R
cat R/get_default_netMHCpan_subfolder.R >> tempscript.R
cat R/get_netMHCpan_bin_url.R >> tempscript.R
cat R/is_netMHCpan_installed.R >> tempscript.R
echo "install_netMHCpan()" >> tempscript.R
sed -i'.orginal' "s/netMHCpan:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
