final_reid.html: code/03_render_report.R \
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
	
	
docker_image = kreid92/550_final
container_path = /home/rstudio/project/report

# Mac/Linus-OS-specific target
.PHONY: report-mac 	
report-mac:
	mkdir -p report
	docker run -v "$$(pwd)/report:$(container_path)" $(docker_image)

# Windows-OS-specific target
.PHONY: report-windows 	
report-windows:
	mkdir -p report
	docker run -v "/$$(pwd)/report:$(container_path)" $(docker_image)