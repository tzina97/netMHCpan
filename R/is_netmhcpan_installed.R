#' Measure if NetMHCpan is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCpan is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhcpan_installed <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder(),
  verbose = FALSE
) {
  assertive::is_if_condition(verbose)
  is_installed <- FALSE
  tryCatch({
    netmhcpan::check_netmhcpan_installation(
      netmhcpan_folder_name = netmhcpan_folder_name
    )
    is_installed <- TRUE
  }, error = function(e) {
      if (isTRUE(verbose)) {
        message(e$ms)
      }
    }
  )
  is_installed
}

#' Measure if NetMHCpan binary is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCpan binary is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhcpan_bin_installed <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder(),
  verbose = FALSE
) {
  bin_file_path <- file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    basename(get_default_netmhcpan_bin_path())
  )
  if (verbose) message("bin_file_path: '", bin_file_path, "'")
  file.exists(bin_file_path)
}

#' Measure if NetMHCpan data folder is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCpan data folder is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhcpan_data_installed <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  data_file_path <- file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    "data"
  )
  file.exists(data_file_path)
}

#' Measure if NetMHCpan is set up
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCpan is set up locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netmhcpan_set_up <- function(
  netmhcpan_folder_name = get_default_netmhcpan_folder()
) {
  file_path <- file.path(
    netmhcpan_folder_name,
    basename(get_default_netmhcpan_subfolder()),
    basename(get_default_netmhcpan_bin_path())
  )
  if (!file.exists(file_path)) return(FALSE)
  # lines <- readLines(file_path)
  # !any(
  #   grepl(
  #     x = lines,
  #     pattern = paste0(
  #       "/usr/cbs/bio/src/",  # nolint file does use absolute path
  #       basename(get_default_netmhcpan_subfolder())
  #     )
  #   )
  # )
  TRUE
}

#' See if tcsh is installed
#' @return TRUE is tcsh is installed,
#'   FALSE otherwise
#' @note To install \code{tcsh} under Linux, do \code{sudo apt install tcsh}
#' @author Richèl J.C. Bilderbeek
#' @export
is_tcsh_installed <- function() {
  error_code <- NA
  tryCatch(
    suppressWarnings(
      error_code <- system2(
        command = "tcsh",
        args = "--version",
        stdout = FALSE,
        stderr = FALSE
      )
    ),
    error = function(e) {
      return(FALSE)
    }
  )
  error_code == 0
}
