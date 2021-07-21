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
  alleles <- system2(
    command = bin_file_path,
    args = c("-list"),
    stdout = TRUE
  )

  # Remove the tab-duplicated alleles
  #
  # Find the duplicate indices, verify the name
  # before and after tab is exactly the same
  duplicate_indices <- which(
    stringr::str_count(alleles, pattern = "\t") != 0
  )
  for (i in duplicate_indices) {
    duplicate_allele <- alleles[i]
    s <- stringr::str_split(duplicate_allele, pattern = "\t")[[1]]
    testthat::expect_equal(s[1], s[2])
    alleles[i] <- s[1]
  }

  alleles
}
