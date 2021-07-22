# Update packages
# remove.packages("netmhcpan")
devtools::install_github("tzina97/netMHCpan", ref = "develop")

# Location of the binary tarball file.
# SET THE CORRECT PATH HERE
netMHCpan_bin_tarfile_path <- "netmhcpan-4.1.Linux.tar.gz"
netMHCpan_data_tarfile_path <- "data.Linux.tar.gz"
testthat::expect_true(file.exists(netmhcpan_bin_tarfile_path))
testthat::expect_true(file.exists(netmhcpan_data_tarfile_path))

# Install binary
install_netmhcpan_bin_from_file(
  netmhcpan_bin_tarfile_path = netmhcpan_bin_tarfile_path
)
testthat::expect_true(is_netmhcpan_bin_installed())

# Install data
install_netmhcpan_data_from_file(
  netmhcpan_data_tarfile_path = netmhcpan_data_tarfile_path
)
testthat::expect_true(is_netmhcpan_bin_installed())

# Use regular install function to take over the rest
install_netmhcpan()
