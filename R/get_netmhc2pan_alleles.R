#' Get a list of the alleles supported by NetMHCpan
#' @inheritParams default_params_doc
#' @return a character vector with the NetMHCpan alleles
#' @examples
#' if (is_netMHCpan_installed()) {
#'   get_netMHCpan_alleles()[1:5]
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_netMHCpan_alleles <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder()
) {
  netMHCpan::check_netMHCpan_installation(netMHCpan_folder_name)
  testit::assert(netMHCpan::is_netMHCpan_installed(netMHCpan_folder_name))
  bin_file_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    basename(get_default_netMHCpan_bin_path())
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
