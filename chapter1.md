---
title: Example Raster Disasters
description: >-
  Example exercises that demonstrate the issues with raster::raster().
  


---
## Ch3Ex16 - 1

```yaml
type: NormalExercise
key: 872c71e666
lang: r
xp: 100
skills: 1
```


`@instructions`
Run the code.

`@hint`

`@pre_exercise_code`
```{r}
files <- c("canopy", "impervious")

lapply(files, function(x){
  url1 <- sprintf("http://s3.amazonaws.com/assets.datacamp.com/production/course_4422/datasets/%s.zip", x)
  file1 <- sprintf("%s.zip", x)
  download.file(url1, file1)
  unzip(file1)
  Sys.sleep(0.5)
}
)

library(raster)
```

`@sample_code`
```{r}
# Read in the canopy and impervious layer
canopy <- raster("canopy.tif")
impervious <- raster("impervious.tif")

# Function f with 2 arguments and the specified code
f <- function(rast1, rast2){
  rast1 < 20 & rast2 > 80
}

# Do the overlay using f as fun
canopy_imperv_overlay <- overlay(canopy, impervious, fun = f)

# Plot the result
plot(canopy_imperv_overlay)
```

`@solution`
```{r}
# Read in the canopy and impervious layer
canopy <- raster("canopy.tif")
impervious <- raster("impervious.tif")

# Function f with 2 arguments and the specified code
f <- function(rast1, rast2){
  rast1 < 20 & rast2 > 80
}

# Do the overlay using f as fun
canopy_imperv_overlay <- overlay(canopy, impervious, fun = f)

# Plot the result
plot(canopy_imperv_overlay)
```

`@sct`
```{r}

```


---
## Ch3Ex16 - 2

```yaml
type: NormalExercise
key: f360f5b6db
lang: r
xp: 100
skills: 1
```


`@instructions`
Run the code.

`@hint`

`@pre_exercise_code`
```{r}

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_5973/datasets/canopy.zip", 
  "canopy.zip"
)

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_4422/datasets/impervious.zip", 
  "impervious.zip"
)

unzip("canopy.zip")
unzip("impervious.zip")

library(raster)
```

`@sample_code`
```{r}
# Read in the canopy and impervious layer
canopy <- raster("canopy.tif")
impervious <- raster("impervious.tif")

# Function f with 2 arguments and the specified code
f <- function(rast1, rast2){
  rast1 < 20 & rast2 > 80
}

# Do the overlay using f as fun
canopy_imperv_overlay <- overlay(canopy, impervious, fun = f)

# Plot the result
plot(canopy_imperv_overlay)
```

`@solution`
```{r}
# Read in the canopy and impervious layer
canopy <- raster("canopy.tif")
impervious <- raster("impervious.tif")

# Function f with 2 arguments and the specified code
f <- function(rast1, rast2){
  rast1 < 20 & rast2 > 80
}

# Do the overlay using f as fun
canopy_imperv_overlay <- overlay(canopy, impervious, fun = f)

# Plot the result
plot(canopy_imperv_overlay)
```

`@sct`
```{r}

```




---
## Impervious

```yaml
type: NormalExercise
key: f68e99c689
lang: r
xp: 100
skills: 1
```


`@instructions`
Run the code.

`@hint`

`@pre_exercise_code`
```{r}

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_4422/datasets/impervious.zip", 
  "impervious.zip"
)


unzip("impervious.zip")

library(raster)
```

`@sample_code`
```{r}
impervious <- raster("impervious.tif")
```

`@solution`
```{r}
impervious <- raster("impervious.tif")
```

`@sct`
```{r}

```




---
## Canopy - again

```yaml
type: NormalExercise
key: 1e044b90da
lang: r
xp: 100
skills: 1
```


`@instructions`

Run the code. 

`@hint`

`@pre_exercise_code`
```{r}
library(raster)

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_5973/datasets/canopy.zip", 
  "canopy.zip"
)

Sys.sleep(0.5)
unzip("canopy.zip")



```

`@sample_code`
```{r}
canopy <- raster("canopy.tif")
```

`@solution`
```{r}
canopy <- raster("canopy.tif")
```

`@sct`
```{r}

```
