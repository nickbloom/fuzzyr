# fuzzyr: Fuzzy String Matching for R

```

```



Like the [fuzzywuzzy](http://chairnerd.seatgeek.com/fuzzywuzzy-fuzzy-string-matching-in-python/) module for python, all fuzzyr funtions return string similarity scores between 0 and 100.

### fuzz_ratio

`fuzz_ratio` is the simplest function. It simply returns the ratio of the number of unshared characters in two strings to the length of the two strings.


```r
library('fuzzyr')
fuzz_ratio("suny erie county med ctr at buffalo", "suny buffalo erie county medical ctr")
```

```
## [1] 71
```

```r
fuzz_ratio("lorem ipsum dolor sit suny", "suny buffalo erie county medical ctr")
```

```
## [1] 50
```

### substr_ratio

`substr_ratio`  returns the score of two strings based on the ratio of shared words to the length of both strings combined. This function also checks whether unshared words are substrings of each other (e.g. "med" and "medical" in the first example below), and removes them from the denominator in the score calculation.


```r
substr_ratio("suny erie county med ctr at buffalo", "suny buffalo erie county medical ctr")
```

```
## [1] 100
```

```r
substr_ratio("lorem ipsum dolor sit suny", "suny buffalo erie county medical ctr")
```

```
## [1] 8
```

### token_set_ratio

Both `token_set_ratio` and `token_sort_ratio` treat each word in a string as a "token." These tokens are compared across the two strings.

`token_set_ratio` compares two strings, and returns the ratio of set of shared tokens (i.e. only the words appearing in *both* strings) to the length of the first string.


```r
token_set_ratio("suny erie county med ctr at buffalo", "suny buffalo erie county medical ctr")
```

```
## [1] 88
```

```r
token_set_ratio("lorem ipsum dolor sit suny", "suny buffalo erie county medical ctr")
```

```
## [1] 18
```

### token_sort_ratio

`token_sort_ratio` does the same things as `token_set_ratio`, but sorts the tokens alphabetically first.


```r
token_sort_ratio("suny erie county med ctr at buffalo", "suny buffalo erie county medical ctr")
```

```
## [1] 93
```

```r
token_sort_ratio("lorem ipsum dolor sit suny", "suny buffalo erie county medical ctr")
```

```
## [1] 60
```

