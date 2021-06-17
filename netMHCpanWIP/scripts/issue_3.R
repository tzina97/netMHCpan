# Update packages
# remove.packages("netmhc2pan")
devtools::install_github("richelbilderbeek/netmhc2pan", ref = "develop")

# Location of the binary tarball file.
# SET THE CORRECT PATH HERE
netmhc2pan_bin_tarfile_path <- "netMHCIIpan-3.2.Linux.tar.gz"
netmhc2pan_data_tarfile_path <- "data.Linux.tar.gz"
testthat::expect_true(file.exists(netmhc2pan_bin_tarfile_path))
testthat::expect_true(file.exists(netmhc2pan_data_tarfile_path))

# Install binary
install_netmhc2pan_bin_from_file(
  netmhc2pan_bin_tarfile_path = netmhc2pan_bin_tarfile_path
)
testthat::expect_true(is_netmhc2pan_bin_installed())

# Install data
install_netmhc2pan_data_from_file(
  netmhc2pan_data_tarfile_path = netmhc2pan_data_tarfile_path
)
testthat::expect_true(is_netmhc2pan_bin_installed())

# Use regular install function to take over the rest
install_netmhc2pan()
