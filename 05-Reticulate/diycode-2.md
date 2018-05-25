https://www.diycode.cc/projects/rstudio/reticulate




### Output Control
These functions enable you to capture or suppress output from Python:

<table style="width:100%;">
<colgroup>
<col width="20%" />
<col width="79%" />
</colgroup>
<thead>
<tr class="header">
<th>Function</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>py_capture_output</td>
<td>Capture Python output for the specified expression and return it as an R character vector.</td>
</tr>
<tr class="even">
<td>py_suppress_warnings</td>
<td>Execute the specified expression, suppressing the display Python warnings.</td>
</tr>
</tbody>
</table>

### Miscellaneous
The functions provide miscellaneous other lower-level capabilities:

<table style="width:100%;">
<colgroup>
<col width="20%" />
<col width="79%" />
</colgroup>
<thead>
<tr class="header">
<th>Function</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>py_unicode</td>
<td>Convert a string to a Python unicode object.</td>
</tr>
<tr class="even">
<td>py_str</td>
<td>Get the string representation of Python object.</td>
</tr>
<tr class="odd">
<td>py_is_null_xptr</td>
<td>Check whether a Python object is a null externalptr.</td>
</tr>
<tr class="even">
<td>py_validate_xptr</td>
<td>Check whether a Python object is a null externalptr and throw an error if it is.</td>
</tr>
</tbody>
</table>

## Using in a Package

### Checking and Testing on CRAN
If you use reticulate in another R package you need to account for the fact that when your package is submitted to CRAN, the CRAN test servers may not have Python, NumPy, or whatever other Python modules you are wrapping in your package. If you don't do this then your package may fail to load and/or pass it's tests when run on CRAN.

There are two things you should do to ensure your package is well behaved on CRAN:

When importing Python modules for use inside your package you should use the delay_load option to ensure that the module (and Python) is loaded only on it's first use. For example:
<pre><code>
# python 'foo' module I want to use in my package
foo <- NULL

.onLoad <- function(libname, pkgname) {
  # delay load foo module (will only be loaded when accessed via $)
  foo <<- import("foo", delay_load = TRUE)
}
When writing tests, check to see if your module is available and if it isn't then skip the test. For example, if you are using the testthat package, you might do this:

# helper function to skip tests if we don't have the 'foo' module
skip_if_no_foo <- function() {
  have_foo <- py_module_available("foo")
  if (!have_foo)
    skip("foo not available for testing")
}

# then call this function from all of your tests
test_that("Things work as expected", {
  skip_if_no_foo()
  # test code here...
})
</code></pre>
### S3 Methods
Python objects exposed by reticulate carry their Python classes into R, so it's possible to write S3 methods to customize e.g. the str or print behavior for a given class (note that it's not typically necessary that you do this since the default str and print methods call PyObject_Str, which typically provides an acceptable default behavior).

If you do decide to implement custom S3 methods for a Python class it's important to keep in mind that when an R session ends the connection to Python objects is lost, so when the .RData saved from one R session is restored in a subsequent R session the Python objects are effectively lost (technically they become NULL R externalptr objects).

This means that you should always use the py_is_null_xptr function on objects before interacting with them in an S3 method. For example:

#' @export
summary.MyPythonClass <- function(object, ...) {
  if (py_is_null_xptr(object))
    stop("Object is NULL")
  else
    # interact with the object to generate the summary
}
There are a couple of shortcut methods you can use to make this more straightforward. The py_validate_xptr function will do the check and automatically throw an error if it fails. So the example above could be re-written as:
<pre><code>
#' @export
summary.MyPythonClass <- function(object, ...) {
  py_validate_xptr(object)
  # interact with the object to generate the summary
}
Finally, the reticulate package exports a py_str generic method which is called from the str method only after doing appropriate validation (if the object is NULL then <pointer: 0x0> is returned). You can implement the py_str method as follows:

#' @importFrom reticulate py_str
#' @export 
py_str.MyPythonClass <- function(object, ...) {
  # interact with the object to generate the string
}
</code></pre>
So in short, to provide custom str and print methods, just implement py_str. For other S3 methods be sure to call either py_validate_xptr or py_is_null_xptr before interacting with the object.
