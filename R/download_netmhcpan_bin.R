#' Download the NetMHCpan binary
#'
#' Download the NetMHCpan binary tarball file
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netmhcpan_bin()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
download_netmhcpan_bin <- function(
  netmhcpan_bin_url = get_netmhcpan_bin_url(),
  netmhcpan_bin_tarfile_path = get_default_netmhcpan_bin_tarfile_path(),
  verbose = FALSE,
  netmhcpan_archive_filename = get_netmhcpan_archive_filename(),

  temp_local_file = tempfile(pattern = "netmhcpan_download_netmhcpan_")
) {
  netmhcpan::check_netmhcpan_bin_url(
    netmhcpan_bin_url = netmhcpan_bin_url,
    verbose = verbose,
    netmhcpan_archive_filename = netmhcpan_archive_filename,
    temp_local_file = temp_local_file
  )

  url <- file.path(netmhcpan_bin_url, netmhcpan_archive_filename)

  if (verbose) {
    message(
      "Downloading NetMHCpan from ", netmhcpan_bin_url,
      " (full URL is ", url, ") to ", netmhcpan_bin_tarfile_path
    )
  }

  netmhcpan::check_can_create_file(
    filename = netmhcpan_bin_tarfile_path,
    overwrite = FALSE
  )

  dir.create(
    path = dirname(netmhcpan_bin_tarfile_path),
    showWarnings = FALSE,
    recursive = TRUE
  )


  tryCatch(
    suppressWarnings(
      utils::download.file(
        url = url,
        destfile = netmhcpan_bin_tarfile_path,
        method = "libcurl",
        quiet = !verbose
      )
    ),
    error = function(e) {
      netmhcpan_version <- stringr::str_match(
        netmhcpan_archive_filename,
        "[:digit:]\\.[:digit:]"
      )[1, 1]
      stop(
        "'netmhcpan_bin_url' is invalid.\n",
        "URL: ", url, "\n",
        "Request a download URL at the NetMHCpan request page at\n",
        "\n",
        paste0(
          "https://services.healthtech.dtu.dk/cgi-bin/sw_request",
          netmhcpan_version,
          "\n"
        ),
        "Full error message: \n",
        "\n",
        e
      )
    }
  )
  testit::assert(file.exists(netmhcpan_bin_tarfile_path))
}
