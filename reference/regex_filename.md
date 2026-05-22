# Regular expressions for filenames

Regular expressions for filenames

## Usage

``` r
regex_filename()
```

## Value

A named list of regular expressions for different filename formats

## Examples

``` r
regex_filename()$standard_regex
#> $regex
#> [1] "^.*(WS\\d{6})_(\\d{8})(a|b|c|d|)_([:alnum:]{2,30}).*$"
#> 
#> $groups
#> $groups$worksheet
#> [1] 1
#> 
#> $groups$labno
#> [1] 2
#> 
#> $groups$suffix
#> [1] 3
#> 
#> $groups$name
#> [1] 4
#> 
#> 
```
