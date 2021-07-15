#' Get the full path to the NetMHCpan sub-folder
#' @inheritParams default_params_doc
#' @return the full path to the NetMHCpan sub-folder
#' @examples
#' get_default_netMHCpan_subfolder()
#' @author Richèl J.C. Bilderbeek
#' @export
get_default_netMHCpan_subfolder <- function( # nolint indeed a long function name
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  netMHCpan_version = get_default_netMHCpan_version()
) { # nolint indeed a long name, I keep it for the sake of readability
  file.path(
    # Leave out the namespace in the next function:
    # The Travis build script sources this function before installing
    # netMHCpan. sourcing this will then result in a 'cannot find
    # package netMHCpan' error
    netMHCpan_folder_name,
    paste0("NetMHCpan-", netMHCpan_version)
  )
}
