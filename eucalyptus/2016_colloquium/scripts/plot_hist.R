#!usr/bin/Rscript
#Rscript plot_hist.R bowtie_1_mapq_freqs.txt
library('ggplot2')
library('reshape')
library('RColorBrewer')

file1 <- "../data/bowtie1_mapq_freqs.txt"
file2 <- "../data/bowtie2_mapq_freqs.txt"

#plot E. grandis mapping
f1 <- read.table(file1)
f1 <- f1[order(f1$V1),]
pdf(file='bowtie1_hist.pdf',8,8)
ggplot(data=f1, aes(x=V1,y=V2)) +
	geom_bar(stat="identity") +
	xlab("Mapping Quality Score") +
	ylab("Number of Reads") +
	ggtitle("Quality of Reads Mapped to E. grandis")
dev.off()

#plot E. melliodora 1 mapping
f2 <- read.table(file2)
f2 <- f2[order(f2$V1),]
pdf(file='bowtie2_hist.pdf',8,8)
ggplot(data=f2, aes(x=V1,y=V2)) +
	geom_bar(stat="identity") +
	xlab("Mapping Quality Score") +
	ylab("Number of Reads") +
	ggtitle("Quality of Reads Mapped to E. melliodora 1")
dev.off()

#Both on the same plot
pdf(file='both_hist.pdf',8,8)
f3 <- merge(f1,f2,by="V1")
names(f3) <- c("quality","grandis","melliodora")
f4 <- melt(f3,id.vars="quality",measure.vars=c("grandis","melliodora"))
ggplot(data=f4,aes(x=quality,y=value,fill=variable)) +
	geom_bar(stat="identity",position=position_dodge()) +
	scale_fill_brewer(guide = guide_legend(title="Reference"),
		labels=c("E. grandis","E. melliodora"),
		type="qual",palette="Dark2") +
	xlab("Mapping Quality Score") +
	ylab("Number of Reads") +
	ggtitle("Comparison of Read Quality")
dev.off()

q()
