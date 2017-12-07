---
title: Example Raster Disasters
description: >-
  Example exercises that demonstrate the issues with raster::raster().


---
## Canopy

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
## Learning about your raster objects

```yaml
type: NormalExercise
key: b3250608cf
lang: r
xp: 100
skills: 1
```

Instead of storing raster objects in data frames, the `raster` package stores spatial data in specially designed R classes that contain slots where the data and metadata are stored. The data and metadata can be accessed using a suite of functions. For example, the spatial extent (the bounding box) of the object can be accessed with [`extent()`](https://www.rdocumentation.org/packages/raster/topics/extent), the coordinate reference system can be accessed with [`crs()`](https://www.rdocumentation.org/packages/raster/topics/projection) and the number of grid cells can be determined with [`ncell()`](https://www.rdocumentation.org/packages/raster/topics/ncell). 


`@instructions`

- Load the `raster` package.
- Read in the tree canopy layer using `raster()` (it is a single-band raster called "canopy.tif").
- Read in the Manhattan image layer using `brick()` (it is a multi-band raster called "manhattan.tif")
- Use the `extent()` function to get the extent of the canopy layer.
- Use the `crs()` function to get the coordinate reference system of `manhattan`.
- Use the `ncell()` function to determine how many grid cells are in the canopy layer and the manhattan layer.



`@hint`

All the functions in this exercise only require a single argument. In the case of the reading functions like `raster()` the argument is the file name as a string. For the other functions like `ncell()` you feed them a `raster` or `brick` object.

`@pre_exercise_code`
```{r}
files <- c("manhattan", "canopy")

lapply(files, function(x){
  url1 <- sprintf("http://s3.amazonaws.com/assets.datacamp.com/production/course_4422/datasets/%s.zip", x)
  file1 <- sprintf("%s.zip", x)
  download.file(url1, file1)
  unzip(file1)
}
)
#'___BLOCK_SOLUTION_EXEC___'
```

`@sample_code`
```{r}
# Load the raster package
___(___)

# Read in the rasters
canopy <- ___("canopy.tif")
manhattan <- ___("manhattan.tif")

# Get the extent of the canopy object
___(___)

# Get the CRS of the manhattan object
___(___)

# Determine the number of grid cells in both raster objects
___(manhattan)
___(canopy)
```

`@solution`
```{r}
# Load the raster package
library(raster)

# Read in the rasters
canopy <- raster("canopy.tif")
manhattan <- brick("manhattan.tif")

# Get the extent of the canopy object
extent(canopy)

# Get the CRS of the manhattan object
crs(manhattan)

# Determine the number of grid cells in both raster objects
ncell(manhattan)
ncell(canopy)
```

`@sct`
```{r}
test_library_function("raster")

# check_correct({
#     ex() %>% check_object("canopy") %>% check_equal(incorrect_msg = "TODO", append = FALSE)
# }, {
#     ex() %>% check_function("raster") %>% check_arg("x") %>% check_equal(incorrect_msg = "TODO", append = FALSE)
# })
# 
# check_correct({
#     ex() %>% check_object("manhattan") %>% check_equal(incorrect_msg = "TODO", append = FALSE)
# }, {
#     ex() %>% check_function("brick") %>% check_arg("x") %>% check_equal(incorrect_msg = "TODO", append = FALSE)
# })
# 
# ex() %>% {
#     check_output_expr(., "extent(canopy)", missing_msg = "TODO", append = FALSE)
#     check_output_expr(., "crs(manhattan)", missing_msg = "TODO", append = FALSE)
#     check_output_expr(., "ncell(manhattan)", missing_msg = "TODO", append = FALSE)
#     check_output_expr(., "ncell(canopy)", missing_msg = "TODO", append = FALSE)
#     check_error(.)
# }

msg1 <- 'Did you call `%s()` on `"%s.tif"` and assign it to `%s`?'
msg2 <- "Did you call `%s()` on `%s`?"

ex() %>% {
    check_function(., "raster") %>% check_arg("x") %>% check_equal(incorrect_msg = sprintf(msg1, "raster", "canopy", "canopy"), append = FALSE)
    check_function(., "brick") %>% check_arg("x") %>% check_equal(incorrect_msg = sprintf(msg1, "brick", "manhattan", "manhattan"), append = FALSE)
    # TODO: Why are you not working?
    #check_output_expr(., "extent(canopy)", missing_msg = sprintf(msg2, "extent", "canopy"), append = FALSE)
    check_code(., "extent(canopy)", fixed = TRUE, missing_msg = sprintf(msg2, "extent", "canopy"), append = FALSE)
    # TODO: Why are you not working?
    #check_output_expr(., "crs(manhattan)", missing_msg = sprintf(msg2, "crs", "manhattan"), append = FALSE)
    check_code(., "crs(manhattan)", fixed = TRUE, missing_msg = sprintf(msg2, "crs", "manhattan"), append = FALSE)
    # TODO: Why are you not working?
    #check_output_expr(., "ncell(manhattan)", missing_msg = sprintf(msg2, "ncell", "manhattan"), append = FALSE)
    check_code(., "ncell(manhattan)", fixed = TRUE, missing_msg = sprintf(msg2, "ncell", "manhattan"), append = FALSE)
    # TODO: Why are you not working?
    #check_output_expr(., "ncell(canopy)", missing_msg = sprintf(msg2, "ncell", "canopy"), append = FALSE)
    check_code(., "ncell(canopy)", fixed = TRUE, missing_msg = sprintf(msg2, "ncell", "canopy"), append = FALSE)
    check_error(.)
}

success_msg("Great work! Although rasters are not stored as data frames, the metadata can easily be extracted using functions like `extent()`, `crs()` and `ncell()`.")
```