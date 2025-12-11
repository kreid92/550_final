report/final_reid.html: code/03_render_report.R \
  final_reid.rmd analysis
	Rscript code/03_render_report.R

output/data_clean.rds: code/00_clean_data.R raw_data/pregnancy_covid_pandemic.csv
	Rscript code/00_clean_data.R
	
output/table_one.rds: code/01_make_table1.R output/data_clean.rds
	Rscript code/01_make_table1.R

output/scatterplot.png: code/02_make_scatter.R output/data_clean.rds
	Rscript code/02_make_scatter.R
	
.PHONY: analysis
analysis: output/table_one.rds output/scatterplot.png

.PHONY: clean	
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html

.PHONY: install 
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
	
	
	
	
	
	
	
	# docker run -v "/$(pwd)"/report:/home/rstudio/project/report krei92/550_final
