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
