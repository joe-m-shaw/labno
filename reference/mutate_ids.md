# Add sample identifiers from filename as additional data columns

Add sample identifiers from filename as additional data columns

## Usage

``` r
mutate_ids(df, id_col = filename, regex = regex_filename()$standard_regex)
```

## Arguments

- df:

  The dataframe to add identifiers to

- id_col:

  The column in the dataframe which includes the filename

- regex:

  The regular expression to use for identifier matching

## Value

The original dataframe with additional columns of identifiers from the
filename column
