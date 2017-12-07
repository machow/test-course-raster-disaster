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
# Load the raster package
library(raster)

# Read in the rasters
canopy <- raster("canopy.tif")

# Get the extent of the canopy object
extent(canopy)

ncell(canopy)
```

`@solution`
```{r}
# Load the raster package
library(raster)

# Read in the rasters
canopy <- raster("canopy.tif")

# Get the extent of the canopy object
extent(canopy)

ncell(canopy)
```

`@sct`
```{r}
msg1 <- 'Did you call `%s()` on `"%s.tif"` and assign it to `%s`?'
msg2 <- "Did you call `%s()` on `%s`?"

ex() %>% {
    check_function(., "raster") %>% check_arg("x") %>% check_equal(incorrect_msg = sprintf(msg1, "raster", "canopy", "canopy"), append = FALSE)
    # TODO: Why are you not working?
    check_object(., "canopy")
    check_output_expr(., "extent(canopy)", missing_msg = sprintf(msg2, "extent", "canopy"), append = FALSE)
    #check_code(., "extent(canopy)", fixed = TRUE, missing_msg = sprintf(msg2, "extent", "canopy"), append = FALSE)
    # TODO: Why are you not working?
    check_output_expr(., "ncell(canopy)", missing_msg = sprintf(msg2, "ncell", "canopy"), append = FALSE)
    #check_code(., "ncell(canopy)", fixed = TRUE, missing_msg = sprintf(msg2, "ncell", "canopy"), append = FALSE)
    check_error(.)
}

success_msg("You did it!")
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
