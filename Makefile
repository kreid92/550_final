Final_Reid.html: code/03_render_report.R \
  Final_Reid.rmd analysis
	Rscript code/03_render_report.R

output/data_clean.rds: code/00_clean_data.r pregnancy_covid_pandemic.csv
	Rscript code/00_clean_data.r
	
output/table_one.rds: code/01_make_table1.r output/data_clean.rds
	Rscript code/01_make_table1.r

output/scatterplot.png: code/02_make_scatter.r output/data_clean.rds
	Rscript code/02_make_scatter.r
	
.PHONY: analysis
analysis: output/table_one.rds output/scatterplot.png

.PHONY: clean	
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html