#' Create a \code{.fasta} file
#' @return a path to a non-existing file,
#' for example, \code{/home/myusername/.cache/temp_582046426735.fasta}
#' @examples
#' create_temp_fasta_filename()
#' @author Richèl J.C. Bilderbeek
#' @export
create_temp_fasta_filename <- function() {
  tempfile(
    pattern = "temp_",
    tmpdir = rappdirs::user_cache_dir(),
    fileext = ".fasta"
  )
}
