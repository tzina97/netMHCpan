get_default_netmhcpan_data_tarfile_path <- function( # nolint indeed a long function name
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    "data.tar.gz"
  )
}
