#' Check the URL of the NetMHCIIpan binary tarball
#'
#' Check the URL of the NetMHCIIpan binary tarball is valid,
#' will stop if not.
#' This URL link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
check_netMHCpan_data_url <- function(
  netMHCpan_data_url = get_netMHCpan_data_url(),
  verbose = FALSE,
  temp_local_file = tempfile(pattern = "check_netMHCpan_data_url_")
) {
  if (verbose) {
    message(
      "netMHCpan_data_url: ", netMHCpan_data_url, " \n",
      "temp_local_file: ", temp_local_file, " \n"
    )
  }
  netMHCpan::check_can_create_file(
    filename = temp_local_file,
    overwrite = FALSE
  )
  tryCatch({
    suppressWarnings(
      utils::download.file(
        url = netMHCpan_data_url,
        destfile = temp_local_file,
        quiet = !verbose
      )
    )
  }, error = function(e) {
      stop(
        "'netMHCpan_data_url' is invalid.\n",
        "netMHCpan_data_url: ", netMHCpan_data_url, "\n",
        "\n",
        "Full error message: \n",
        "\n",
        e
      )
  })
  file.remove(temp_local_file)
}
