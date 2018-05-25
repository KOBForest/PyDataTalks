%- http://blog.revolutionanalytics.com/2018/03/reticulate.html

Use Python functions and modules in R with the "reticulate" package

Since its inception over 40 years ago, when S (R's predecessor) was just a sketch on John Chambers' wall at Bell Labs, R has always been a language for providing interfaces. I was reminded of this during Dirk Eddelbuettel's presentation at the Chicago R User Group meetup last night, where he enumerated Chambers' three principles behind its design (from his 2016 book, ***Extending R***):

* Object: Everything that exists in R is an object
* Function: Everything that happens in R is a function call
* Interface: Interfaces to other software are a part of R

The third principle "Interface" is demonstrated by R's broad connections to data sources, numerical and statistical computation libraries, graphical systems, external applications, and other languages. And it's further supported by the formal announcement this week of the reticulate package from RStudio, which provides a new interface between R and Python. With reticulate, you can:

Import objects from Python, automatically converted into their equivalent R types. (For example, Pandas data frames become R data.frame objects, and NumPy arrays become R matrix objects.)
Import Python modules, and call their functions from R 
Source Python scripts from R
Interactively run Python commands from the R command line
Combine R code and Python code (and output) in R Markdown documents, as shown in the snippet below

Rmarkdown_engine_zoomed


