### Importing Python modules
You can use the ``import()`` function to import any Python module and call it from R. 
For example, this code imports the Python os module and calls the ``listdir()`` function:
<pre><code>
library(reticulate)
os <- import("os")
os$listdir(".")
 [1] ".git"             ".gitignore"       ".Rbuildignore"    ".RData"          
 [5] ".Rhistory"        ".Rproj.user"      ".travis.yml"      "appveyor.yml"    
 [9] "DESCRIPTION"      "docs"             "external"         "index.html"      
[13] "index.Rmd"        "inst"             "issues"           "LICENSE"         
[17] "man"              "NAMESPACE"        "NEWS.md"          "pkgdown"         
[21] "R"                "README.md"        "reticulate.Rproj" "src"             
[25] "tests"            "vignettes"      
</code></pre>
Functions and other data within Python modules and classes can be accessed via the $ operator (analogous to the way you would 
interact with an R list, environment, or reference class).

Imported Python modules support code completion and inline help:



See Calling Python from R for additional details on interacting with Python objects from within R.

Sourcing Python scripts
You can source any Python script just as you would source an R script using the  ``source_python()`` function. 
For example, if you had the following Python script ``flights.py``:
<pre><code>
import pandas
def read_flights(file):
  flights = pandas.read_csv(file)
  flights = flights[flights['dest'] == "ORD"]
  flights = flights[['carrier', 'dep_delay', 'arr_delay']]
  flights = flights.dropna()
  return flights
  </code></pre>
Then you can source the script and call the read_flights() function as follows:
<pre><code>
source_python("flights.py")
flights <- read_flights("flights.csv")

library(ggplot2)
ggplot(flights, aes(carrier, arr_delay)) + geom_point() + geom_jitter()
</code></pre>
See the ``source_python()`` documentation for additional details on sourcing Python code.

Python REPL
If you want to work with Python interactively you can call the ``repl_python()`` function, which provides a Python REPL embedded within your R session. Objects created within the Python REPL can be accessed from R using the py object exported from reticulate. For example:



Enter exit within the Python REPL to return to the R prompt.

Note that Python code can also access objects from within the R session using the r object (e.g. r.flights). See the repl_python() documentation for additional details on using the embedded Python REPL.

### Type conversions
When calling into Python, R data types are automatically converted to their equivalent Python types. When values are returned from Python to R they are converted back to R types. Types are converted as follows:

R	Python	Examples
Single-element vector	Scalar	1, 1L, TRUE, "foo"
Multi-element vector	List	c(1.0, 2.0, 3.0), c(1L, 2L, 3L)
List of multiple types	Tuple	list(1L, TRUE, "foo")
Named list	Dict	list(a = 1L, b = 2.0), dict(x = x_data)
Matrix/Array	NumPy ndarray	matrix(c(1,2,3,4), nrow = 2, ncol = 2)
Data Frame	Pandas DataFrame	data.frame(x = c(1,2,3), y = c("a", "b", "c"))
Function	Python function	function(x) x + 1
NULL, TRUE, FALSE	None, True, False	NULL, TRUE, FALSE
If a Python object of a custom class is returned then an R reference to that object is returned. You can call methods and access properties of the object just as if it was an instance of an R reference class.

### Learning more
The following articles cover the various aspects of using reticulate:

Calling Python from R — Describes the various ways to access Python objects from R as well as functions available for more advanced interactions and conversion behavior.

R Markdown Python Engine — Provides details on using Python chunks within R Markdown documents, including how call Python code from R chunks and vice-versa.

Python Version Configuration — Describes facilities for determining which version of Python is used by reticulate within an R session.

Installing Python Packages — Documentation on installing Python packages from PyPI or Conda, and managing package installations using virtualenvs and Conda environments.

Using reticulate in an R Package — Guidelines and best practices for using reticulate in an R package.

Arrays in R and Python — Advanced discussion of the differences between arrays in R and Python and the implications for conversion and interoperability.

### Why reticulate?
From the Wikipedia article on the reticulated python:

The reticulated python is a species of python found in Southeast Asia. They are the world’s longest snakes and longest reptiles…The specific name, reticulatus, is Latin meaning “net-like”, or reticulated, and is a reference to the complex colour pattern.

From the Merriam-Webster definition of reticulate:

1: resembling a net or network; especially : having veins, fibers, or lines crossing a reticulate leaf. 2: being or involving evolutionary change dependent on genetic recombination involving diverse interbreeding populations.

The package enables you to reticulate Python code into R, creating a new breed of project that weaves together the two languages.
