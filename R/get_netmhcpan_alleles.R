#' Get a list of the alleles supported by NetMHCpan
#' @inheritParams default_params_doc
#' @return a character vector with the NetMHCpan alleles
#' @examples
#' if (is_netmhcpan_installed()) {
#'   get_netmhcpan_alleles()[1:5]
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_netmhcpan_alleles <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  netmhcpan::check_netmhcpan_installation(netmhcpan_folder_name)
  testit::assert(netmhcpan::is_netmhcpan_installed(netmhcpan_folder_name))
  bin_file_path <- file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    basename(get_default_netmhcpan_bin_path())
  )
  testit::assert(file.exists(bin_file_path))
  alleles_with_comments <- system2(
    command = normalizePath(bin_file_path),
    args = c("-listMHC"),
    stdout = TRUE
  )

  # Get all the lines that do not start with a hashatg
  alleles_without_comments <- stringr::str_subset(
    string = alleles_with_comments,
    pattern = "^#",
    negate = TRUE
  )
  alleles <- stringr::str_subset(
    string = alleles_without_comments,
    pattern = "[:alnum:]+"
  )
  alleles
}
