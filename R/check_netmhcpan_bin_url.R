#' Check the URL of the NetMHCpan binary tarball
#'
#' Check the URL of the NetMHCpan binary tarball is valid,
#' will stop if not.
#' This URL link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
check_netmhcpan_bin_url <- function(
  netmhcpan_bin_url = get_netmhcpan_bin_url(),
  verbose = FALSE,
  netmhcpan_archive_filename = get_netmhcpan_archive_filename(),
  temp_local_file = tempfile(pattern = "check_netmhcpan_bin_url_")
) {
  url <- file.path(netmhcpan_bin_url, netmhcpan_archive_filename)
  if (verbose) {
    message(
      "netmhcpan_bin_url: ", netmhcpan_bin_url, " \n",
      "netmhcpan_archive_filename: ", netmhcpan_archive_filename, " \n",
      "temp_local_file: ", temp_local_file, " \n",
      "url: ", url
    )
  }
  netmhcpan::check_can_create_file(
    filename = temp_local_file,
    overwrite = FALSE
  )
  dir.create(dirname(temp_local_file), showWarnings = FALSE, recursive = TRUE)

  tryCatch({
    suppressWarnings(
      utils::download.file(
        url = url,
        destfile = temp_local_file,
        method = "libcurl",
        quiet = !verbose
      )
    )
  }, error = function(e) {
      stop(
        "'netmhcpan_bin_url' is invalid.\n",
        "URL: ", url, "\n",
        "Request a download URL at the NetMHCpan request page at\n",
        "\n",
        paste0(
          "http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?netMHCpan",
          get_default_netmhcpan_version(),
          "\n"
        ),
        "Full error message: \n",
        "\n",
        e
      )
  })
  file.remove(temp_local_file)
}
