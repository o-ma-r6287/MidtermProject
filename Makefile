.PHONY: all clean

all: report.html

report.html: report.Rmd outputs/gtsummarytable.png outputs/muac_outcomes_by_arm.png outputs/weight_outcomes_by_arm.png
	Rscript render_report.R

outputs/gtsumarytable.png: code/descriptives.R data/f75_interim.csv
	mkdir -p outputs
	Rscript code/descriptives.R
	
outputs/bivariate_A_table.png: code/02_bivariate_analysis.R data/f75_interim.csv
	mkdir -p outputs
	Rscript code/02_bivariate_analysis.R

outputs/muac_outcomes_by_arm.png: code/03_boxplots.R data/f75_interim.csv
	Rscript code/03_boxplots.R

outputs/weight_outcomes_by_arm.png: code/03_boxplots.R data/f75_interim.csv
	Rscript code/03_boxplots.R

install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
clean:
	rm -f outputs/*.png
	rm -f report.html