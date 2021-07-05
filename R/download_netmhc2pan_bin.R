#' Download the NetMHCpan binary
#'
#' Download the NetMHCpan binary tarball file
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netMHCpan_bin()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
download_netMHCpan_bin <- function(
  netMHCpan_bin_url = get_netMHCpan_bin_url(),
  netMHCpan_bin_tarfile_path = get_default_netMHCpan_bin_tarfile_path(),
  verbose = FALSE,
  netMHCpan_archive_filename = get_netMHCpan_archive_filename(),
  temp_local_file = tempfile(pattern = "netMHCpan_download_netMHCpan_")
) {
  netMHCpan::check_netMHCpan_bin_url(
    netMHCpan_bin_url = netMHCpan_bin_url,
    verbose = verbose,
    netMHCpan_archive_filename = netMHCpan_archive_filename,
    temp_local_file = temp_local_file
  )

  url <- file.path(netMHCpan_bin_url, netMHCpan_archive_filename)

  if (verbose) {
    message(
      "Downloading NetMHCpan from ", netMHCpan_bin_url,
      " (full URL is ", url, ") to ", netMHCpan_bin_tarfile_path
    )
  }
  dir.create(
    path = dirname(netMHCpan_bin_tarfile_path),
    showWarnings = FALSE,
    recursive = TRUE
  )

  netMHCpan::check_can_create_file(
    filename = netMHCpan_bin_tarfile_path,
    overwrite = FALSE
  )

  tryCatch(
    suppressWarnings(
      utils::download.file(
        url = url,
        destfile = netMHCpan_bin_tarfile_path,
        quiet = !verbose
      )
    ),
    error = function(e) {
      netMHCpan_version <- stringr::str_match(
        netMHCpan_archive_filename,
        "[:digit:]\\.[:digit:]"
      )[1, 1]
      stop(
        "'netMHCpan_bin_url' is invalid.\n",
        "URL: ", url, "\n",
        "Request a download URL at the NetMHCpan request page at\n",
        "\n",
        paste0(
          "http://www.cbs.dtu.dk/cgi-bin/nph-sw_request?netMHCpan",
          netMHCpan_version,
          "\n"
        ),
        "Full error message: \n",
        "\n",
        e
      )
    }
  )
  testit::assert(file.exists(netMHCpan_bin_tarfile_path))
}
