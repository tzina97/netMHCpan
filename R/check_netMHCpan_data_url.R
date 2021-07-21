#' Check the URL of the NetMHCpan binary tarball
#'
#' Check the URL of the NetMHCpan binary tarball is valid,
#' will stop if not.
#' This URL link expires after 4 hours.
#' @inheritParams default_params_doc
#' @export
check_netmhcpan_data_url <- function(
  netmhcpan_data_url = get_netmhcpan_data_url(),
  verbose = FALSE,
  temp_local_file = tempfile(pattern = "check_netmhcpan_data_url_")
) {
  if (verbose) {
    message(
      "netmhcpan_data_url: ", netmhcpan_data_url, " \n",
      "temp_local_file: ", temp_local_file, " \n"
    )
  }
  netmhcpan::check_can_create_file(
    filename = temp_local_file,
    overwrite = FALSE
  )
  tryCatch({
    suppressWarnings(
      utils::download.file(
        url = netmhcpan_data_url,
        destfile = temp_local_file,
        quiet = !verbose
      )
    )
  }, error = function(e) {
      stop(
        "'netmhcpan_data_url' is invalid.\n",
        "netmhcpan_data_url: ", netmhcpan_data_url, "\n",
        "\n",
        "Full error message: \n",
        "\n",
        e
      )
  })
  file.remove(temp_local_file)
}
