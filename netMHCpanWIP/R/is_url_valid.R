#' Is the download URL valid?
#'
#' The download link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
is_url_valid <- function(
  netMHCpan_bin_url = get_netMHCpan_bin_url(),
  verbose = FALSE,
  netMHCpan_archive_filename = get_netMHCpan_archive_filename(),
  temp_local_file = tempfile(pattern = "netMHCpan_is_url_valid_")
) {
  is_valid <- FALSE
  tryCatch({
      suppressWarnings(
        check_netMHCpan_bin_url(
          netMHCpan_bin_url = netMHCpan_bin_url,
          verbose = verbose,
          netMHCpan_archive_filename = netMHCpan_archive_filename,
          temp_local_file = temp_local_file
        )
      )
      is_valid <- TRUE
    },
    error = function(e) {
      if (verbose) message("Error message: '", e, "'")
    }
  )
  is_valid
}
