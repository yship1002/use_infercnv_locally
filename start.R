#!/usr/bin/env Rscript
library(infercnv)

args <- commandArgs(trailingOnly=TRUE)

raw_counts_matrix <- args[1]
raw_counts_matrix <- "/lustre/project/wdeng7/R_LIB_Share/Library/infercnv/extdata/oligodendroglioma_expression_downsampled.counts.matrix.gz"

annotations_file <- args[2]
annotations_file <- "/lustre/project/wdeng7/R_LIB_Share/Library/infercnv/extdata/oligodendroglioma_annotations_downsampled.txt"

gene_order_file <- args[3]
gene_order_file <- "/lustre/project/wdeng7/R_LIB_Share/Library/infercnv/extdata/gencode_downsampled.EXAMPLE_ONLY_DONT_REUSE.txt"

ref_group_names <- args[4]
ref_group_names <- c("Microglia/Macrophage","Oligodendrocytes (non-malignant)")

output_folder <- args[5]
output_folder <- "/home/jyang10/test_infercnv"



infercnv_obj = CreateInfercnvObject(raw_counts_matrix=raw_counts_matrix,
                                    annotations_file=annotations_file,
                                    delim="\t",
                                    gene_order_file=gene_order_file,
                                    ref_group_names=ref_group_names)

infercnv_obj = infercnv::run(infercnv_obj,
                             cutoff=1, # cutoff=1 works well for Smart-seq2, and cutoff=0.1 works well for 10x Genomics
                             out_dir=output_folder, 
                             cluster_by_groups=TRUE, output_format="pdf", 
                             denoise=TRUE,no_prelim_plot=TRUE,
                             HMM=TRUE)


