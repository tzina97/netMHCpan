#' Convert the first character to upper case.
#'
#' Convert the first character to upper case. If the first
#' character is upper case, nothing will happen.
#' @param s a string
#' @return the string, with the first letter in uppercase
#' @author Richèl J.C. Bilderbeek
#' @examples
#' capitalize_first_char("hello")
#' @export
capitalize_first_char <- function(s) {
  testit::assert(is.character(s))
  testit::assert(nchar(s) > 0)
  substr(s, 1, 1) <- toupper(substr(s, 1, 1))
  s
}
