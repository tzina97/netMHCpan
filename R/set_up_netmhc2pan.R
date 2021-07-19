#' Install the NetMHCpan binary to a local folder
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' \donttest{
#'   set_up_netMHCpan()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
set_up_netMHCpan <- function(
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  verbose = FALSE
) {
#   return()
#   if (verbose) {
#     message("Set up NetMHCpan in folder '", netMHCpan_folder_name, "'")
#   }
#   bin_path <- file.path(
#     netMHCpan_folder_name,
#     basename(get_default_netMHCpan_subfolder()),
#     basename(get_default_netMHCpan_bin_path())
#   )
#   if (!file.exists(bin_path)) {
#     stop(
#       "NetMHCpan binary is absent at path '", bin_path, "'\n",
#       "\n",
#       "Tip: call 'netMHCpan::install_netMHCpan'\n",
#       "     to install the NetMHCpan binary"
#     )
#   }
#   lines <- readLines(bin_path)
#
#   # Change sentenv
#   setenv_line_idx <- which(
#     lines == paste0(
#       "setenv\tNMHOME\t/usr/cbs/bio/src/",
#       basename(get_default_netMHCpan_subfolder())
#     )
#   )
#   lines[setenv_line_idx] <- paste0("setenv\tNMHOME\t", dirname(bin_path))
#
#   # Change temp folder
#   tmpdir_line_idx <- which(
#     lines == "\tsetenv  TMPDIR  /scratch"
#   )
#   lines[tmpdir_line_idx] <- "\tsetenv  TMPDIR  /tmp"
#
#   writeLines(text = lines, con = bin_path)
}
