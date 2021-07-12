#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param alleles one or more alleles, e.g. \code{DRB1_0101}.
#'   See \link{get_netMHCpan_alleles} for a full list
#' @param do_filter set to TRUE if the results of NetMHCpan must be filtered
#' @param fasta_filename the name of a FASTA file with protein sequences
#' @param folder_name the folder to install NetMHCpan, which is
#'   \code{"/home/[usename]/.local/share"} by default
#' @param mhc_haplotype one MHC haplotype, e.g. \code{DRB1_0101}.
#'   See \link{get_netMHCpan_alleles} for a full list
#' @param netMHCpan_archive_filename the NetMHCpan archive
#'   filename, for example \code{netMHCpan-4.1.Linux.tar.gz},
#'   which is used in installation of NetMHCpan.
#'   Use \link{get_netMHCpan_archive_filename} to get this filename.
#' @param netMHCpan_bin_tarfile_path path of the
#'   NetMHCpan binary tarball file
#' @param netMHCpan_bin_url URL to download the
#'   NetMHCpan binary tarball file from,
#'   similar to, for example,
#'   \code{https://services.healthtech.dtu.dk/services/NetMHCpan-4.1/data.tar.gz}.
#'   Use \link{get_netMHCpan_bin_url} to get the default URL.
#' @param netMHCpan_data_tarfile_path path of the
#'   NetMHCpan data tarball file
#' @param netMHCpan_data_url URL to download the
#'   NetMHCpan data tarball file from,
#'   similar to, for example,
#'   \url{https://services.healthtech.dtu.dk/services/NetMHCpan-4.1/data.tar.gz}.
#'   Use \link{get_netMHCpan_data_url} to get the default URL.
#' @param netMHCpan_folder_name the folder (to be) used by NetMHCpan.
#'   From this location, a subfolder for NetMHCpan is created.
#'   Use \link{get_default_netMHCpan_folder} to see the location
#'   of the default NetMHCpan folder.
#'   Use \link{get_default_netMHCpan_subfolder} to see the location
#'   of the default NetMHCpan subfolder.
#' @param netMHCpan_subfolder the subfolder (to be) used by NetMHCpan.
#'   Use \link{get_default_netMHCpan_subfolder} to see the location
#'   of the default NetMHCpan subfolder
#' @param netMHCpan_version the NetMHCpan version,
#'   for example \code{4.1}.
#'   Use \link{get_default_netMHCpan_version} to get the default
#'   NetMHCpan version
#' @param os the operating system as obtained by \code{rappdirs::app_dir()$os}.
#'   \code{netMHCpan} supports Linux ('\code{unix}') only
#' @param peptide_length length of a peptide
#' @param peptides one or more peptide sequences
#' @param protein_sequence a protein sequence, for example \code{FAMILYVW}
#' @param temp_fasta_filename name for a temporary FASTA file,
#'   which will be deleted automatically
#' @param temp_local_file path to the temporary file to store the URL to.
#'   This file will be deleted afterwards.
#' @param temp_xls_filename name for a temporary \code{xls} file,
#'   which will be deleted automatically
#' @param verbose set to TRUE for more output
#' @param xls_filename name of an \code{xls} file
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  alleles,
  do_filter,
  fasta_filename,
  folder_name,
  mhc_haplotype,
  netMHCpan_archive_filename,
  netMHCpan_bin_tarfile_path,
  netMHCpan_bin_url,
  netMHCpan_data_tarfile_path,
  netMHCpan_data_url,
  netMHCpan_folder_name,
  netMHCpan_subfolder,
  netMHCpan_version,
  os,
  peptide_length,
  peptides,
  protein_sequence,
  temp_fasta_filename,
  temp_local_file,
  temp_xls_filename,
  verbose,
  xls_filename
) {
  # Nothing
}
