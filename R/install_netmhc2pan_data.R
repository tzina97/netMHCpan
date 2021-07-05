#' Install the NetMHCpan data to a local folder
#'
#' Install the NetMHCpan data to a local folder.
#'
#' This data can be downloaded from
#' \url{https://services.healthtech.dtu.dk/services/NetMHCpan-4.1/data.tar.gz},
#' without filling in a contact form.
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   install_netMHCpan_data()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_netMHCpan_data <- function(
  netMHCpan_data_url = get_netMHCpan_data_url(),
  netMHCpan_folder_name = rappdirs::user_data_dir(),
  verbose = FALSE
) {
  data_folder_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    "data"
  )
  if (file.exists(data_folder_path)) {
    stop("NetMHCpan data is already installed")
  }

  local_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    "data.Linux.tar.gz"
  )

  dir.create(dirname(local_path), showWarnings = FALSE, recursive = TRUE)
  netMHCpan::check_can_create_file(filename = local_path, overwrite = FALSE)

  utils::download.file(
    url = netMHCpan_data_url,
    destfile = local_path,
    quiet = !verbose
  )
  testit::assert(file.exists(local_path))
  # Linux has a tar file
  utils::untar(
    tarfile = local_path,
    exdir = path.expand(
      file.path(
        netMHCpan_folder_name,
        basename(get_default_netMHCpan_subfolder())
      )
    )
  )
  testit::assert(file.exists(data_folder_path))
}
