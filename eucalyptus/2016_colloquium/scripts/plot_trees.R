#!usr/bin/env Rscript
#Rscript plot_trees.R

library('ape')
library('phytools')
mycolors <- c('lightgreen','yellow','purple','red')

tree <- read.tree('../data/gatk.nwk')
pdf('gatk_tree2.pdf',8,8)

#Fix labels
tree$tip.label = unlist(lapply(tree$tip.label, FUN=function(x) strsplit(x,'_')[[1]][1]))
tree$tip.label = gsub("M2c","M3a",tree$tip.label) #fix an oopsie
m <- regexpr("[0-9]+",tree$tip.label)
tree$tip.label = regmatches(tree$tip.label,m)

plot(tree, no.margin = TRUE, cex = 2)
dev.off()

pdf('gatk_tree_rotated.pdf',8,8)
plot(tree,no.margin = TRUE, cex = 2, adj = .5, srt = -90)
dev.off()



q()