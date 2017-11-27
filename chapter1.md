---
title: Example Raster Disasters
description: >-
  Example exercises that demonstrate the issues with raster::raster().
  
---
## Load canopy data from tif

```yaml
type: NormalExercise
key: 85fb0ff7a7
lang: r
xp: 100
skills: 1
```

I expect that this will run without problem here, but cause a warning in the build system.

`@instructions`

Run the code to download the tif file and import it as a raster object.

`@hint`

`@pre_exercise_code`
```{r}
library(raster)

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_5973/datasets/canopy.zip", 
  "canopy.zip"
)
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
success_msg("You did it!")
```




---
## Load Manhattan data from tif

```yaml
type: NormalExercise
key: 66c5289c53
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

download.file(
  "http://s3.amazonaws.com/assets.datacamp.com/production/course_4422/datasets/manhattan.zip", 
  "manhattan.zip"
)

unzip("manhattan.zip")
unzip("canopy.zip")

canopy <- raster("canopy.tif")
manhattan <- brick("manhattan.tif")
```

`@sample_code`
```{r}
# Plot the canopy raster (single raster)
plot(canopy)

# Plot the manhattan raster (as a single image for each layer)
plot(manhattan)

# Plot the manhattan raster as an image
plotRGB(manhattan)
```

`@solution`
```{r}
# Plot the canopy raster (single raster)
plot(canopy)

# Plot the manhattan raster (as a single image for each layer)
plot(manhattan)

# Plot the manhattan raster as an image
plotRGB(manhattan)
```

`@sct`
```{r}

```


---
## Ch1Ex11

```yaml
type: NormalExercise
key: d86708c4ec
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
files <- c("manhattan", "canopy")

lapply(files, function(x){
  url1 <- sprintf("http://s3.amazonaws.com/assets.datacamp.com/production/course_4422/datasets/%s.zip", x)
  file1 <- sprintf("%s.zip", x)
  download.file(url1, file1)
  unzip(file1)
}
)
```

`@sample_code`
```{r}
# Read in the canopy layer
canopy <- raster("canopy.tif")

# Check if the data is in memory
inMemory(canopy)

# Use head to peak at the first few records
head(canopy)

# Use getValues() to read the values into a vector
vals <- getValues(canopy)

# Use hist() to create a histogram of the values
hist(vals)
```

`@solution`
```{r}
# Read in the canopy layer
canopy <- raster("canopy.tif")

# Check if the data is in memory
inMemory(canopy)

# Use head to peak at the first few records
head(canopy)

# Use getValues() to read the values into a vector
vals <- getValues(canopy)

# Use hist() to create a histogram of the values
hist(vals)
```

`@sct`
```{r}

```


---
## Ch1Ex12

```yaml
type: NormalExercise
key: 182f6a00aa
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
files <- c("manhattan", "canopy")

lapply(files, function(x){
  url1 <- sprintf("http://s3.amazonaws.com/assets.datacamp.com/production/course_4422/datasets/%s.zip", x)
  file1 <- sprintf("%s.zip", x)
  download.file(url1, file1)
  unzip(file1)
}
)

canopy <- raster("canopy.tif")
manhattan <- brick("manhattan.tif")
```

`@sample_code`
```{r}
# Plot the canopy raster (single raster)
plot(canopy)

# Plot the manhattan raster (as a single image for each layer)
plot(manhattan)

# Plot the manhattan raster as an image
plotRGB(manhattan)
```

`@solution`
```{r}
# Plot the canopy raster (single raster)
plot(canopy)

# Plot the manhattan raster (as a single image for each layer)
plot(manhattan)

# Plot the manhattan raster as an image
plotRGB(manhattan)
```

`@sct`
```{r}

```





---
## Ch3Ex3

```yaml
type: NormalExercise
key: ac2cc3f669
lang: r
xp: 100
skills: 1
```


`@instructions`
Run the code.


`@hint`

`@pre_exercise_code`
```{r}
files <- c("neighborhoods", "manhattan")

lapply(files, function(x){
  url1 <- sprintf("http://s3.amazonaws.com/assets.datacamp.com/production/course_4422/datasets/%s.zip", x)
  file1 <- sprintf("%s.zip", x)
  download.file(url1, file1)
  unzip(file1)
}
)
library(raster)
manhattan <- brick("manhattan.tif")
# Load the sf package
library(sf)

#'___BLOCK_SOLUTION_EXEC___'
```

`@sample_code`
```{r}
# Read in the neighborhods shapefile
neighborhoods <- st_read("neighborhoods.shp")

# Project neighborhoods to match manhattan
neighborhoods <- st_transform(neighborhoods, crs = 32618)

# Compute the neighborhood centroids
centroids <- st_centroid(neighborhoods)

# Plot the neighborhood geometry
plot(st_geometry(neighborhoods), col = "grey", border = "white")
plot(centroids, pch = 16, col = "firebrick", add = TRUE)
```

`@solution`
```{r}
# Read in the neighborhods shapefile
neighborhoods <- st_read("neighborhoods.shp")

# Project neighborhoods to match manhattan
neighborhoods <- st_transform(neighborhoods, crs = 32618)

# Compute the neighborhood centroids
centroids <- st_centroid(neighborhoods)

# Plot the neighborhood geometry
plot(st_geometry(neighborhoods), col = "grey", border = "white")
plot(centroids, pch = 16, col = "firebrick", add = TRUE)
```

`@sct`
```{r}

```




---
## Ch3Ex16

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

