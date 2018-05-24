%- http://blog.revolutionanalytics.com/2018/03/reticulate.html

Use Python functions and modules in R with the "reticulate" package
Since its inception over 40 years ago, when S (R's predecessor) was just a sketch on John Chambers' wall at Bell Labs, R has always been a language for providing interfaces. I was reminded of this during Dirk Eddelbuettel's presentation at the Chicago R User Group meetup last night, where he enumerated Chambers' three principles behind its design (from his 2016 book, Extending R):

Object: Everything that exists in R is an object
Function: Everything that happens in R is a function call
Interface: Interfaces to other software are a part of R

The third principle "Interface" is demonstrated by R's broad connections to data sources, numerical and statistical computation libraries, graphical systems, external applications, and other languages. And it's further supported by the formal announcement this week of the reticulate package from RStudio, which provides a new interface between R and Python. With reticulate, you can:

Import objects from Python, automatically converted into their equivalent R types. (For example, Pandas data frames become R data.frame objects, and NumPy arrays become R matrix objects.)
Import Python modules, and call their functions from R 
Source Python scripts from R
Interactively run Python commands from the R command line
Combine R code and Python code (and output) in R Markdown documents, as shown in the snippet below
Rmarkdown_engine_zoomed

The reticulate package was first released on Github in January 2017, and has been available on CRAN since March 2017. It has already spawned several higher-level integrations between R and Python-based systems, including:

H204GPU, a R package for H20's GPU-based scikit-learn-like suite of algorithms;
greta, a packagefor Bayesian model estimation with Markov-chain Monte-carlo, based on Tensorflow
spacyr, a wrapper for the spaCy natural language processing toolkit; and
XRPython, John Chamber's interface to Python based on his XR package for language extensions to R, which now uses reticulate for its low-level interface to Python.
The reticulate package is available now on CRAN. You can find more details in the announcement at the link below.

RStudio blog: reticulate: R interface to Python

Update March 31: Corrected date of first availability of reticulate on CRAN

 
