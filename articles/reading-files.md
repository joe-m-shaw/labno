# Reading files with labno

``` r

library(labno)
library(readr)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(purrr)
library(ggplot2)
```

I built `labno` in response to common problems I face whilst doing my
job as a clinical scientist.

My job is to validate new genetic tests. My chosen approach for this is
to perform exploratory data analysis using tidyverse packages.

As part of this work, I have to:

1.  Read a variety of file types (.csv, .xlsx, .vcf, .json, .html, .pdf,
    .tsv)

2.  Analyse data at multiple levels (patient, sample, replicate, gene)

As an example, let us take a scenario where there are multiple files
with genetic results in, and the sample identifiers are only in the
filenames.

``` r


files <- list.files(path = "data/",
           pattern = ".*.csv",
           full.names = TRUE)

files
#> [1] "data//WS123456_12345678a_PierreBEZUKHOV.csv"
#> [2] "data//WS123456_12345678b_PierreBEZUKHOV.csv"
#> [3] "data//WS123456_12345678c_PierreBEZUKHOV.csv"
#> [4] "data//WS123456_23456789_AnnaKARENINA.csv"   
#> [5] "data//WS123456_34567890_IvanILYCH.csv"
```

Each file consists of results for different genes.

For the purpose of this example, I have randomly generated a “score” for
each gene. This is not real clinical data.

``` r


file1 <- read_csv(file = files[1],
                  show_col_types = FALSE)

file1
#> # A tibble: 10 × 2
#>    gene   score
#>    <chr>  <dbl>
#>  1 gene1  97.7 
#>  2 gene2  11.3 
#>  3 gene3  98.9 
#>  4 gene4  64.0 
#>  5 gene5   3.49
#>  6 gene6  11.4 
#>  7 gene7  86.8 
#>  8 gene8  13.8 
#>  9 gene9  49.7 
#> 10 gene10 10.6
```

I want to get all the results into one dataframe, along with all the
relevant identifiers.

I can do this by creating a simple function which combines `read_csv`
from `readr` with the `mutate_ids` function from `labno`.

``` r


read_csv_with_filename <- function(filepath){
  
  output <- read_csv(filepath,
                     show_col_types = FALSE) |> 
    mutate(filename = basename(filepath))
  
  return(output)
}
```

Using `map` from `purrr` I can then iterate this function over the file
list and bind the data together.

``` r


all_data <- files |> 
  map(\(files) read_csv_with_filename(files)) |> 
  list_rbind() |> 
  mutate_ids()
```

This gives me the data in a single dataframe with each row annotated
with the correct sample identifiers.

| gene | score | filename | labno | worksheet | suffix | name | labno_suffix | labno_suffix_worksheet |
|:---|---:|:---|:---|:---|:---|:---|:---|:---|
| gene1 | 97.6955141 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene2 | 11.2687355 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene3 | 98.8593290 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene4 | 64.0114902 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene5 | 3.4885046 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene6 | 11.3642443 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene7 | 86.7547998 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene8 | 13.8269989 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene9 | 49.7064066 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene10 | 10.6104016 | WS123456_12345678a_PierreBEZUKHOV.csv | 12345678 | WS123456 | a | PierreBEZUKHOV | 12345678a | 12345678a_WS123456 |
| gene1 | 5.4439993 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene2 | 72.0719737 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene3 | 60.4684200 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene4 | 79.2336205 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene5 | 24.4005622 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene6 | 11.0944414 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene7 | 3.3582193 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene8 | 98.3774984 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene9 | 55.4686784 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene10 | 80.9327019 | WS123456_12345678b_PierreBEZUKHOV.csv | 12345678 | WS123456 | b | PierreBEZUKHOV | 12345678b | 12345678b_WS123456 |
| gene1 | 94.2702363 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene2 | 84.8811300 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene3 | 89.4712796 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene4 | 62.9010040 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene5 | 50.5924463 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene6 | 25.2354199 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene7 | 67.6015973 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene8 | 14.0432803 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene9 | 75.8114634 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene10 | 95.3160182 | WS123456_12345678c_PierreBEZUKHOV.csv | 12345678 | WS123456 | c | PierreBEZUKHOV | 12345678c | 12345678c_WS123456 |
| gene1 | 50.4452151 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene2 | 94.4651708 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene3 | 36.3450093 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene4 | 1.7642395 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene5 | 89.2965208 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene6 | 70.4437311 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene7 | 42.9037774 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene8 | 60.4224573 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene9 | 88.9575026 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene10 | 0.5565599 | WS123456_23456789_AnnaKARENINA.csv | 23456789 | WS123456 |  | AnnaKARENINA | 23456789 | 23456789_WS123456 |
| gene1 | 43.3481782 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene2 | 25.9921850 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene3 | 11.1211967 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene4 | 34.3106907 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene5 | 82.0752608 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene6 | 25.2085669 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene7 | 34.3805890 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene8 | 15.1524318 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene9 | 58.4151974 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |
| gene10 | 76.6390498 | WS123456_34567890_IvanILYCH.csv | 34567890 | WS123456 |  | IvanILYCH | 34567890 | 34567890_WS123456 |

Then I can explore this collated data using `ggplot2`.

![](reading-files_files/figure-html/plots-1.png)
