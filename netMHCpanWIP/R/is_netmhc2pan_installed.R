#' Measure if NetMHCIIpan is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCIIpan is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netMHCpan_installed <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  verbose = FALSE
) {
  assertive::is_if_condition(verbose)
  is_installed <- FALSE
  tryCatch({
    netMHCpan::check_netMHCpan_installation(
      netMHCpan_folder_name = netMHCpan_folder_name
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

#' Measure if NetMHCIIpan binary is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCIIpan binary is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netMHCpan_bin_installed <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  verbose = FALSE
) {
  bin_file_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    basename(get_default_netMHCpan_bin_path())
  )
  if (verbose) message("bin_file_path: '", bin_file_path, "'")
  file.exists(bin_file_path)
}

#' Measure if NetMHCIIpan data folder is installed locally
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCIIpan data folder is installed locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netMHCpan_data_installed <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder()
) {
  data_file_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    "data"
  )
  file.exists(data_file_path)
}

#' Measure if NetMHCIIpan is set up
#' @inheritParams default_params_doc
#' @return TRUE is NetMHCIIpan is set up locally,
#'   FALSE otherwise
#' @author Richèl J.C. Bilderbeek
#' @export
is_netMHCpan_set_up <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder()
) {
  file_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    basename(get_default_netMHCpan_bin_path())
  )
  if (!file.exists(file_path)) return(FALSE)
  lines <- readLines(file_path)
  !any(
    grepl(
      x = lines,
      pattern = paste0(
        "/usr/cbs/bio/src/",  # nolint file does use absolute path
        basename(get_default_netMHCpan_subfolder())
      )
    )
  )
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
