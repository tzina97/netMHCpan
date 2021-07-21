#' Is the download URL valid?
#'
#' The download link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
is_url_valid <- function(
  netmhcpan_bin_url = get_netmhcpan_bin_url(),
  verbose = FALSE,
  netmhcpan_archive_filename = get_netmhcpan_archive_filename(),
  temp_local_file = tempfile(pattern = "netmhcpan_is_url_valid_")
) {
  is_valid <- FALSE
  tryCatch({
      suppressWarnings(
        check_netmhcpan_bin_url(
          netmhcpan_bin_url = netmhcpan_bin_url,
          verbose = verbose,
          netmhcpan_archive_filename = netmhcpan_archive_filename,
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
