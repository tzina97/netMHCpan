# netmhc2pan

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/netmhc2pan)](https://cran.r-project.org/package=netmhc2pan)
[![](http://cranlogs.r-pkg.org/badges/grand-total/netmhc2pan)]( https://CRAN.R-project.org/package=netmhc2pan)
[![](http://cranlogs.r-pkg.org/badges/netmhc2pan)](https://CRAN.R-project.org/package=netmhc2pan)

Branch   |[GitHub Actions](https://github.com/richelbilderbeek/netmhc2pan/actions)                                     |[![Travis CI logo](pics/TravisCI.png)](https://travis-ci.com)                                                                             |[![Codecov logo](pics/Codecov.png)](https://www.codecov.io)
---------|-------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------
`master` |![R-CMD-check](https://github.com/richelbilderbeek/netmhc2pan/workflows/R-CMD-check/badge.svg?branch=master) |[![Build Status](https://travis-ci.com/richelbilderbeek/netmhc2pan.svg?branch=master)](https://travis-ci.com/richelbilderbeek/netmhc2pan) |[![codecov.io](https://codecov.io/github/richelbilderbeek/netmhc2pan/coverage.svg?branch=master)](https://codecov.io/github/richelbilderbeek/netmhc2pan/branch/master)
`develop`|![R-CMD-check](https://github.com/richelbilderbeek/netmhc2pan/workflows/R-CMD-check/badge.svg?branch=develop)|[![Build Status](https://travis-ci.com/richelbilderbeek/netmhc2pan.svg?branch=develop)](https://travis-ci.com/richelbilderbeek/netmhc2pan)|[![codecov.io](https://codecov.io/github/richelbilderbeek/netmhc2pan/coverage.svg?branch=develop)](https://codecov.io/github/richelbilderbeek/netmhc2pan/branch/develop)

R package for [NetMHCIIpan](https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-3.2) [1].

> Please note that this page is intended for academic users only. Other users are requested
> to contact the Software Package Manager at health-software@dtu.dk

 * [YouTube video](https://youtu.be/08A_kf4v2UA) or [download video](http://richelbilderbeek.nl/netmhc2pan.ogv)

## Install

Use `usethis` (or `devtools`) to install the `netmhc2pan` package:

```{r}
usethis::install_github("richelbilderbeek/netmhc2pan")
```

Load the `netmhc2pan` library:

```{r}
library(netmhc2pan)
```

Install NetMHCIIpan to a default folder using `netmhc2pan` and a download URL.
The download URL can be obtained from the 
NetMHCIIpan website at
[https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-3.2](https://services.healthtech.dtu.dk/service.php?NetMHCIIpan-3.2)
and expires after four hours.

```{r}
install_netmhc2pan("https://services.healthtech.dtu.dk/download/fb4dee93-ddbb-4639-ab21-45fdfd0ed23e")
```

### Installation troubleshooting

#### URL is expired

Request a new download link

#### `cannot open URL 'https://services.healthtech.dtu.dk/download/[number]/netMHCIIpan-3.2.Linux.tar.gz'`

From a fresh download link, you *can* download the file, 
yet not install using the `install_netmhc2pan` function.

In that case, use the `install_netmhc2pan_bin_from_file` function:
 
```
install_netmhc2pan_bin_from_file("netMHCIIpan-3.2.Linux.tar.gz")
```

This function assumes that the file `netMHCIIpan-3.2.Linux.tar.gz` is in the working
directory.

After this, install like normal:

```
install_netmhc2pan()
```

#### `cannot open URL 'https://www.cbs.dtu.dk/services/NetMHCIIpan-3.2/data.Linux.tar.gz'`

This happens when the university website is down (yes, this has happened!).

In that case, use the `install_netmhc2pan_data_from_file` function:
 
```
install_netmhc2pan_data_from_file("data.Linux.tar.gz")
```

This function assumes that the file `data.Linux.tar.gz` is in the working
directory.

After this, install like normal:

```
install_netmhc2pan()
```

## Usage

We start from a FASTA file with one or more protein sequences:

```{r}
fasta_filename <- system.file(
  "extdata", "example.fasta", package = "netmhc2pan"
)
```

This is how to content of such a FASTA file looks like:

```{r}
message(readLines(fasta_filename), sep = "\n")
```

```
>sp|L0T550|RIP2_MYCTU_158_180
AVLWAGVAFLAFLQLTALVLNLL
```

MHC2 has multiple alleles that bind differently to protein parts.
NetMHCIIpan supports more than 5000 alleles:

```{r}
all_alleles <- get_netmhc2pan_alleles()
testit::assert(length(all_alleles) > 5000)
```

We simply pick the first two alleles:

```{r}
alleles <- all_alleles[1:2]
```

Running the NetMHCIIpan analysis: 

```{r}
bindings <- run_netmhc2pan(
  fasta_filename = fasta_filename,
  alleles = alleles
)
```

The data frame `bindings` contains the results:

```{r}
knitr::kable(bindings)
```

| Pos|Peptide         |ID                                     |Allele    | one_minus_log50k|      nM| Rank|
|---:|:---------------|:--------------------------------------|:---------|----------------:|-------:|----:|
|   1|AVLWAGVAFLAFLQL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.510|  201.09| 39.0|
|   2|VLWAGVAFLAFLQLT |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.475|  293.98| 47.0|
|   3|LWAGVAFLAFLQLTA |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.524|  172.31| 36.0|
|   4|WAGVAFLAFLQLTAL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.566|  109.07| 26.0|
|   5|AGVAFLAFLQLTALV |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.602|   73.94| 19.0|
|   6|GVAFLAFLQLTALVL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.680|   31.93|  7.0|
|   7|VAFLAFLQLTALVLN |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.688|   29.20|  6.5|
|   8|AFLAFLQLTALVLNL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.680|   32.04|  7.0|
|   9|FLAFLQLTALVLNLL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0101 |            0.669|   35.92|  8.5|
|   1|AVLWAGVAFLAFLQL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.346| 1188.96| 38.0|
|   2|VLWAGVAFLAFLQLT |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.329| 1414.85| 44.0|
|   3|LWAGVAFLAFLQLTA |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.379|  823.82| 28.0|
|   4|WAGVAFLAFLQLTAL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.406|  616.05| 21.0|
|   5|AGVAFLAFLQLTALV |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.425|  504.55| 17.0|
|   6|GVAFLAFLQLTALVL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.458|  353.10| 11.0|
|   7|VAFLAFLQLTALVLN |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.456|  360.90| 11.0|
|   8|AFLAFLQLTALVLNL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.456|  361.54| 11.0|
|   9|FLAFLQLTALVLNLL |sp&#124;L0T550&#124;RIP2_MYCTU_158_180 |DRB1_0102 |            0.442|  420.88| 14.0|

The strongest binding is between the MHC2 allele `DRB1_0101`
at the 7th (to and including 21st) amino acid of the `sp&#124;L0T550&#124;RIP2_MYCTU_158_180`
protein, as it is in the top 6.5% of best binders.

## FAQ

### Under which operating systems does `netmhc2pan` work?

`netmhc2pan` can only work on the set of operating systems NetMHCIIpan
works on. Currently, only Linux is supported:

Operating system|Supported by NetMHCIIpan|Supported by `netmhc2pan`
----------------|------------------------|-------------------------
Darwin          |Y                       |N
Linux           |Y                       |Y
Windows         |N                       |N

### How to solve `Can't locate Env.pm in @INC`?

Install the Perl `Env` package with:

```
/usr/bin/perl -MCPAN -e 'install Env'
```

See notes at [this Issue](https://github.com/richelbilderbeek/netmhc2pan/issues/1).

### Are there similar packages?

These are the ones I use:

 * [mhcnuggetsr](https://github.com/richelbilderbeek/mhcnuggetsr): predicts
   IC50 values for MHC-I and MHC-II haplotypes
 * [epitope-prediction](https://github.com/jtextor/epitope-prediction): predicts
   IC50 values for MHC-I haplotypes

## References

 * [1] Improved methods for predicting peptide binding affinity to MHC class II molecules.
   Jensen KK, Andreatta M, Marcatili P, Buus S, Greenbaum JA, Yan Z, Sette A, Peters B, Nielsen M.
   Immunology. 2018 Jan 6. doi: 10.1111/imm.12889.
   PubMed: [29315598](http://www.ncbi.nlm.nih.gov/pubmed/29315598)
