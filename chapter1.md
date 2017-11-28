---
title: Example Raster Disasters
description: >-
  Example exercises that demonstrate the issues with raster::raster().
  

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



