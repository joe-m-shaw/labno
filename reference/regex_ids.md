# Regular expressions for sample identifiers

**worksheet** The worksheet identifier is "WS" followed by six digits.

## Usage

``` r
regex_ids()
```

## Value

A named list of regular expressions for different identifiers, including
brackets for grouping

## Details

**labno** The DNA "lab number" (labno) is an eight digit numeric string
which is used to identify DNA samples at the Manchester Genomic
Laboratory Hub. The labno has the year as the first 2 digits (2026 = 26)
and the remaining 6 digits increase from 1. Example: the first sample of
2026 would have labno 26000001.

**suffix** When multiple replicates of a DNA lab number (labno) are
tested on the same worksheet, a letter is added directly after each
labno.

Example: 12345678a, 12345678b, 12345678c

**name** The patient name, which may include numbers if it is a
non-patient sample such as a reference material. Files analysed on the
cloud will not have patient names in the filenames.

## Examples

``` r
regex_ids()$labno
#> [1] "(\\d{8})"
```
