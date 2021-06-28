# Update packages
# remove.packages("netMHCpan")
devtools::install_github("tzina97/netMHCpanW", ref = "develop")

# Location of the binary tarball file.
# SET THE CORRECT PATH HERE
netMHCpan_bin_tarfile_path <- "netMHCpan-4.1.Linux.tar.gz"
netMHCpan_data_tarfile_path <- "data.Linux.tar.gz"
testthat::expect_true(file.exists(netMHCpan_bin_tarfile_path))
testthat::expect_true(file.exists(netMHCpan_data_tarfile_path))

# Install binary
install_netMHCpan_bin_from_file(
  netMHCpan_bin_tarfile_path = netMHCpan_bin_tarfile_path
)
testthat::expect_true(is_netMHCpan_bin_installed())

# Install data
install_netMHCpan_data_from_file(
  netMHCpan_data_tarfile_path = netMHCpan_data_tarfile_path
)
testthat::expect_true(is_netMHCpan_bin_installed())

# Use regular install function to take over the rest
install_netMHCpan()
