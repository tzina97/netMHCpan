#' Create a \code{.xls} file
#' @return a path to a non-existing file,
#' for example, \code{/home/myusername/.cache/temp_582047dac733.xls}
#' @examples
#' create_temp_xls_filename()
#' @author Richèl J.C. Bilderbeek
#' @export
create_temp_xls_filename <- function() {
  tempfile(
    pattern = "temp_",
    tmpdir = rappdirs::user_cache_dir(),
    fileext = ".xls"
  )
}
