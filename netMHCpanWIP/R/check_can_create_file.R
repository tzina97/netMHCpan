#' Check that a file can be created at a certain path.
#'
#' Will \link{stop} if not. Will \link{stop} if the file already exists.
#' Does so by creating an empty file at the path,
#' and then deleting it.
#' @param filename file that may or may not be created
#' @param overwrite if TRUE, if \code{filename} already exists, it
#' will be deleted by this function
#' @author Richèl J.C. Bilderbeek
#' @export
check_can_create_file <- function(
  filename,
  overwrite = TRUE
) {
  if (file.exists(filename)) {
    if (overwrite == FALSE) {
      stop(
        "Cannot check if a file can be created ",
        "if the desired file already exists. \n",
        "Filename: ", filename
      )
    } else {
      # Delete the file
      file.remove(filename)
      testthat::expect_true(
        !file.exists(filename),
        info = paste0(
          "Cannot delete the file already present at location ", filename
        )
      )
    }
  }
  tryCatch(
    suppressWarnings(
      writeLines(text = "check_can_create_file testing text", con = filename)
    ),
    error = function(e) {} # nolint indeed does nothing
  )
  if (!file.exists(filename)) {
    stop(
      "Cannot create a file at location ", filename
    )
  }
  file.remove(filename)
  testthat::expect_true(
    !file.exists(filename),
    info = paste0(
      "Cannot delete the temporary file created at location ", filename
    )
  )
}
