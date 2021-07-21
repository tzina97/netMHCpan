#' Get the full path to the NetMHCpan sub-folder
#' @inheritParams default_params_doc
#' @return the full path to the NetMHCpan sub-folder
#' @examples
#' get_default_netmhcpan_subfolder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netmhcpan_subfolder <- function( # nolint indeed a long function name
  netmhcpan_folder_name = get_default_netmhcpan_folder(),
  netmhcpan_version = get_default_netmhcpan_version()
) { # nolint indeed a long name, I keep it for the sake of readability
  file.path(
    # Leave out the namespace in the next function:
    # The Travis build script sources this function before installing
    # netMHCpan. sourcing this will then result in a 'cannot find
    # package netmhcpan' error
    netmhcpan_folder_name,
    paste0("NetMHCpan-", netmhcpan_version)
  )
}
