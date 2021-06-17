#!/bin/bash
#
# Installs NetMHC2pan using the R code in the 'netmhc2pan' package
#
# Because the R code in the package uses 'netmhc2pan::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/install_netmhc2pan.sh
#
#
cat R/install_netmhc2pan.R > tempscript.R
cat R/capitalize_first_char.R >> tempscript.R
cat R/get_default_netmhc2pan_bin_path.R >> tempscript.R
cat R/get_default_netmhc2pan_folder.R >> tempscript.R
cat R/get_default_netmhc2pan_subfolder.R >> tempscript.R
cat R/get_netmhc2pan_bin_url.R >> tempscript.R
cat R/is_netmhc2pan_installed.R >> tempscript.R
echo "install_netmhc2pan()" >> tempscript.R
sed -i'.orginal' "s/netmhc2pan:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal
