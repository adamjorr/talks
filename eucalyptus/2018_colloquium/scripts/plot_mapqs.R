#!/usr/bin/env Rscript
library('tidyverse')
files <- list.files(pattern = '*10k.txt', full.names=T)
refnames <- c("E. grandis","E. melliodora 1", "E. melliodora 2", "E. melliodora 3")

load_file <- function(filename, refname){
	read.tsv(filename, col_names = F) %>%
		rename_at(1,~"MapQ") %>%
		mutate(Reference = !!refname)
}

load_files <- function(files, refnames){
	map2(files, refnames, load_file) %>%
		bind_rows()
}


data <- load_files(files, refnames)
pdf("mapq_density.pdf")
ggplot(data, aes(MapQ, fill=Reference, colour=Reference)) +
	geom_density(alpha = 0.25) +
dev.off()

# load_file <- function(filename, refname){
# 	read.table(filename) %>%
# 		rename_at(1,~"MapQ") %>%
# 		mutate(Reference = !!refname)
# }

