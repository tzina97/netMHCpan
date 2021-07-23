#!/bin/bash
#
# Installs NetMHCpan using the R code in the 'netmhcpan' package
#
# Because the R code in the package uses 'netmhcpan::' in calling
# its functions, this script removes these prefixes.
#
# Usage:
#
#  ./scripts/install_netmhcpan.sh
#
#
cat R/*.R > tempscript.R
echo "install_netmhcpan()" >> tempscript.R
#echo "testthat::expect_true(is_netmhcpan_installed())" >> tempscript.R
echo 'if (!is_netmhcpan_installed()) message("NETMHCPAN IS NOT INSTALLED!")' >> tempscript.R
echo "if (!is_netmhcpan_installed()) return(314)" >> tempscript.R
sed -i'.orginal' "s/netmhcpan:://g" tempscript.R
cat tempscript.R
Rscript tempscript.R
rm tempscript.R
rm tempscript.R.orginal

