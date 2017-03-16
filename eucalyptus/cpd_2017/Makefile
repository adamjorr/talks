PLTHISTFIGS=figures/generated/both_hist.pdf figures/generated/bowtie1_hist.pdf figures/generated/bowtie2_hist.pdf figures/generated/aligner_comparison_hist.pdf
PLTTREESFIGS=figures/generated/gatk_tree.pdf figures/generated/disco_tree.pdf figures/generated/true_tree.pdf figures/generated/gatk_tree_rightwards.pdf figures/generated/disco_tree_rightwards.pdf
GENERATEDFIGS=${PLTHISTFIGS} ${PLTTREESFIGS}

all: cpd_2017.pdf ${GENERATEDFIGS}

cpd_2017.pdf: cpd_2017.tex $(GENERATEDFIGS)
	pdflatex cpd_2017.tex

${PLTHISTFIGS}: data/bowtie1_mapq_freqs.txt data/bowtie2_mapq_freqs.txt data/bt2_bwa_mapq.txt data/bt2_ngm_mapq.txt scripts/plot_hist.R
	Rscript scripts/plot_hist.R

${PLTTREESFIGS}: data/discosnp.nwk data/gatk.nwk scripts/plot_trees.R
	Rscript scripts/plot_trees.R





