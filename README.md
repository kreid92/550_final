# Project Description

The data is  survey-based data collected across Canada as part of the 
Pregnancy during the COVID-19 Pandemic (PdP) project. This purpose of this 
project is to produce an analysis of the dataset.

# Structure 

Code: All code used to generate tables, figures, and analysis.

`code/00_clean_data.R` cleans the data.
  - clean data should be saved to `output/`

`code/01_make_table1.R` produces Table 1.
	- table 1 output should be saved to `output/`

`code/02_make_scatter.R` produces the scatter plot.
  - scatter plot should be saved to `output/`
  
`code/03_render_report.R`is used to render the report from the command line. 
  - the report saves to the parent project folder.

Output: The outputs of the code.
Raw Data: Original dataset.

All parts of the project are combined in `Final_Reid.Rmd`

# Building the Project

* Use 'make clean' in R terminal to remove previously generated files.
* Use 'make install' in R terminal to restore the package library to synchronize packages with the project.
* Use 'make' in R terminal to create the tables and figures, as well as build the final report.
