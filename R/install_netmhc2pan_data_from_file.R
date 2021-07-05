#' Install the NetMHCpan data from file
#'
#' Install the NetMHCpan data from the NetMHCpan data tarball file
#' to the default NetMHCpan folder.
#'
#' The NetMHCpan data tarball file can be in any path.
#'
#' The data tarball file can be downloaded from
#' \url{https://services.healthtech.dtu.dk/services/NetMHCpan-4.1/data.tar.gz},
#' without filling in a contact form.
#' @inheritParams default_params_doc
#' @return Nothing
#' @author Richèl J.C. Bilderbeek
#' @export
install_netMHCpan_data_from_file <- function( # nolint long function name indeed
  netMHCpan_data_tarfile_path,
  netMHCpan_folder_name = rappdirs::user_data_dir(),
  verbose = FALSE
) {
  testthat::expect_true(file.exists(netMHCpan_data_tarfile_path))
  data_folder_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    "data"
  )
  if (file.exists(data_folder_path)) {
    stop("NetMHCpan data is already installed at '", data_folder_path, "'")
  }

  local_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    "data.Linux.tar.gz"
  )

  dir.create(dirname(local_path), showWarnings = FALSE, recursive = TRUE)
  netMHCpan::check_can_create_file(filename = local_path, overwrite = FALSE)

  # Linux has a tar file
  utils::untar(
    tarfile = netMHCpan_data_tarfile_path,
    exdir = path.expand(
      file.path(
        netMHCpan_folder_name,
        basename(get_default_netMHCpan_subfolder())
      )
    )
  )
  testit::assert(file.exists(data_folder_path))
}
