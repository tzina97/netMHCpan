#' Run NetMHCIIpan
#' @inheritParams default_params_doc
#' @return a data frame with the NetMHCIIpan results
#' @examples
#' if (is_netmhc2pan_installed()) {
#'
#'   fasta_filename <- system.file(
#'     "extdata", "example.fasta", package = "netmhc2pan"
#'   )
#'   run_netmhc2pan(fasta_filename)
#'
#'   # Two alleles
#'   alleles <- c("DRB1_0101", "DRB1_0102")
#'   # Run NetMHCpan with these two alleles
#'   run_netmhc2pan(fasta_filename, alleles = alleles)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
run_netMHCpan <- function(
  fasta_filename,
  alleles = "DRB1_0101",
  peptide_length = 15,
  netMHCpan_folder_name = get_default_netMHCpan_folder(),
  temp_xls_filename = netMHCpan::create_temp_xls_filename()
) {
  # Check input
  netMHCpan::check_netMHCpan_installation(netMHCpan_folder_name)
  netMHCpan::check_alleles(
    alleles = alleles,
    netMHCpan_folder_name = netMHCpan_folder_name
  )
  netMHCpan::check_fasta_file_sequence_lengths(
    fasta_filename = fasta_filename,
    peptide_length = peptide_length
  )

  testthat::expect_true(file.exists(fasta_filename))
  bin_file_path <- file.path(
    netMHCpan_folder_name,
    basename(get_default_netMHCpan_subfolder()),
    basename(get_default_netMHCpan_bin_path())
  )
  testthat::expect_true(file.exists(bin_file_path))
  # Adding '-filter' and '1' top the args does not help: the XLS
  # file is created without the desired filter. The text output does
  # change.
  alleles_as_word <- paste0(alleles, sep = ",", collapse = "")
  output_text <- system2(
    command = bin_file_path,
    args = c(
      "-a", alleles_as_word,
      "-length", peptide_length,
      "-xls", "1",
      "-xlsfile", temp_xls_filename,
      "-f", fasta_filename
    ),
    stdout = TRUE
  )
  if (length(output_text) == 1 &&
      output_text == "ERROR: Input file is not in FASTA format"
  ) {
    stop("'fasta_filename' is not a valid FASTA file")
  }
  if (!file.exists(temp_xls_filename)) {
    stop(
      "NetMHCIIpan output file not created. ",
      "alleles_as_word: '", alleles_as_word, "'. ",
      "peptide_length: '", peptide_length, "'. ",
      "temp_xls_filename: '", temp_xls_filename, "'. ",
      "temp_xls_filename: '", temp_xls_filename, "'. ",
      "fasta_filename: '", fasta_filename, "'. ",
      "utils::head(readLines(fasta_filename)): '",
        paste0(
          utils::head(readLines(fasta_filename, warn = FALSE)),
          collapse = " \n"
        ),
      "'. ",
      "NetMHCpan error output: '", output_text, "'"
    )
  }
  testit::assert(file.exists(temp_xls_filename))
  # For 1 alelle, the XLS is easy to parse
  # For multiple alleles, the XLS is saved in wide format,
  # with duplicate column names
  df_raw <- utils::read.csv(temp_xls_filename, sep = "\t",
    col.names = c(
      "Pos", "Peptide", "ID",
      rep(c("one_minus_log50k", "nM", "Rank"), times = length(alleles)),
      "Ave", "NB"
    ),
    header = FALSE,
    stringsAsFactors = FALSE
  )
  names(df_raw)
  # Convert to short form
  # Get rid of weird header
  df_short <- df_raw[c(-1, -2), ]
  # Get rid of 'Ave' and 'NB' column
  colnames(df_short)[ncol(df_short) - 1] == "Ave"
  colnames(df_short)[ncol(df_short) - 0] == "NB"
  last_col_index <- ncol(df_short)
  one_but_last_col_index <- last_col_index - 1
  df_short <- df_short[, c(-last_col_index, -one_but_last_col_index)]
  # Convert to final long form
  n_alleles <- length(alleles)
  n_rows <- nrow(df_short) # number of positions
  df <- data.frame(
    Pos = rep(as.numeric(df_short$Pos), times = n_alleles),
    Peptide = rep(df_short$Peptide, times = n_alleles),
    ID = rep(df_short$ID, times = n_alleles),
    Allele = rep(alleles, each = n_rows),
    one_minus_log50k = NA,
    nM = NA,
    Rank = NA,
    stringsAsFactors = FALSE
  )
  # one_minus_log50k
  for (i in seq_along(alleles)) {
    i_minus_one <- i - 1
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    from_col <- 4 + (i_minus_one * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col],
      pattern = "one_minus_log50k")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + (i_minus_one * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$one_minus_log50k[to_row:to_row_last] <- from
  }
  # nM
  for (i in seq_along(alleles)) {
    i_minus_one <- i - 1
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    from_col <- 5 + (i_minus_one * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col],
      pattern = "nM")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + (i_minus_one * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$nM[to_row:to_row_last] <- from # nolint use same variable as NetMHCIIpan, which is not all lowercase
  }
  # Rank
  for (i in seq_along(alleles)) {
    # one_minus_log50k, one_minus_log50k.1, one_minus_log50k.2, etc..
    i_minus_one <- i - 1
    from_col <- 6 + (i_minus_one * 3)
    testit::assert(
      stringr::str_match(string = colnames(df_short)[from_col],
      pattern = "Rank")
    )
    from <- as.numeric(as.vector(df_short[, from_col]))
    to_row <- 1 + (i_minus_one * n_rows)
    to_row_last <- to_row + n_rows - 1
    df$Rank[to_row:to_row_last] <- from
  }
  # No tibbles, as for multiple alleles,
  # the XLS is saved in wide format,
  # with duplicate column names
  file.remove(temp_xls_filename)
  df
}
