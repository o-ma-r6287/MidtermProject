.PHONY: all clean

all: report.html

report.html: report.Rmd outputs/mauc_outcomes_by_arm.png outputs/weight_outcomes_by_arm.png
	Rscript render_report.R

outputs/mauc_outcomes_by_arm.png: code/03_boxplots.R data/f75_interim.csv
	Rscript code/03_boxplots.R

outputs/weight_outcomes_by_arm.png: code/03_boxplots.R data/f75_interim.csv
	Rscript code/03_boxplots.R

install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
clean:
	rm -f outputs/*.png
	rm -f report.html