#' Convert a formal haplotype name to its NetMHCpan notation
#'
#' Convert a formal MHC haplotype name to the notation used by NetMHCpan.
#' @inheritParams default_params_doc
#' @export
to_netmhcpan_name <- function(mhc_haplotype) {
  s <- stringr::str_replace_all(
    mhc_haplotype,
    "\\*",
    ""
  )

  #Need commented-out code only for DLA-starting alleles
  is_dla <- stringr::str_detect(mhc_haplotype, "DLA-")
  dla_indices <- which(is_dla)
  s[dla_indices] <- stringr::str_replace_all(
    s[dla_indices],
    ":",
    ""
  )
  s
}
