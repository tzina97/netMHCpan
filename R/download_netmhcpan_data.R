download_netmhcpan_data <- function(
  netmhcpan_data_url = get_netmhcpan_data_url(),
  netmhcpan_data_tarfile_path = get_default_netmhcpan_data_tarfile_path(),
  verbose = FALSE,
  temp_local_file = tempfile(pattern = "netmhcpan_download_netmhcpan_data_")
) {
  netmhcpan::check_netmhcpan_data_url(
    netmhcpan_data_url = netmhcpan_data_url,
    verbose = verbose,
    temp_local_file = temp_local_file
  )

  url <- file.path(netmhcpan_data_url)

  if (verbose) {
    message(
      "Downloading NetMHCpan from ", netmhcpan_data_url,
      " (full URL is ", url, ") to ", netmhcpan_data_tarfile_path
    )
  }

  netmhcpan::check_can_create_file(
    filename = netmhcpan_data_tarfile_path,
    overwrite = FALSE
  )

  dir.create(
    path = dirname(netmhcpan_data_tarfile_path),
    showWarnings = TRUE,
    recursive = TRUE
  )


tryCatch(
  suppressWarnings(
    utils::download.file(
      url = url,
      destfile = netmhcpan_data_tarfile_path,
      method = "libcurl",
      quiet = !verbose
    )
  ),
  error = function(e) {is_url_valid()
    stop(
      "'netmhcpan_data_url' is invalid.\n",
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
testit::assert(file.exists(netmhcpan_data_tarfile_path))
}

