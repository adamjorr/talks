library('tidyverse')

refs <- c("E. grandis", "E. melliodora 2", "E. melliodora 1")
unmapped <- c(66949528, 59110579, 61278970)

pdf('figures/generated/unmapped_reads.pdf', width = 8, height = 5)
df <- tibble(Reference = refs, Unmapped = unmapped)
ggplot(df, aes(Reference, Unmapped, group=1)) +
  geom_line() +
  theme(text = element_text(size = 20)) +
  ggtitle("Unmapped Reads For Each Reference")
  
dev.off()
