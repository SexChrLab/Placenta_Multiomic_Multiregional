# Multiregional Placenta Gene Expression Analysis

This directory contains code that produces the analysis and figures to analyze placenta gene expression for differences between sexes and between hypertensive and normotensive pregnancies.  

# DE_Pipeline_newmodel.Rmd

This code shows how limma::voom with DREAM was used to calculate differential gene expression in placenta with 4 samples from each. 

This code was used to calculate differential expression for 4 profiles: 
1. Within only male placentas, comparing those from hypertensive pregnancies to those from normotensive pregnancies
2. Within only female placentas, comparing those from hypertensive pregnancies to those from normotensive pregnancies
3. Within only placentas from normotensive pregnancies, comparing males to females
4. Within only placentas from hypertensive pregnancies, comparing males to females

# gene_expression_analysis.Rmd/.pdf

This code shows how to gene expression was compared between placenta samples grouped by placenta, fetal sex, and hypertension status during pregnancy.  This includes the analysis of gene expression differences as well as calculation of intraplacental variation.

It includes the construction of: 
1) Scatter plots comparing differential gene expression profiles
2) Boxplots showing the expression of specific genes in 4 sample groups based on fetal sex and hypertension status
3) Gene set enrichment analysis of sex-stratified profiles of placentas from hypertensive versus normotensive pregnancies and of genes ranked by intraplacental variation
4) Network representation of the significant enrichment results
5) Clustering of genes significantly different between at least two of the 4 sample groups
6) Characterization of previously published placental markers of preeclampsia

# compare_proportions_CIBERSORTx_scRNA/_snRNA/.Rmd/.pdf

This code shows how results of CIBERSORTx analyzed using single cell (sc) and single nucleus (sn) RNA sequencing to construct reference matrices to deconvolve estimated cell type proportions were analyzed for differences between sexes and hypertension status.

# RRHO_compare_datasets.Rmd

This code shows how rank-rank hypergeometric overlap (RRHO) analysis was used to compare differential gene expression profiles between the Valleywise multiregional placenta gene expression dataset and 2 other published placenta preeclampsia datasets: 
1. Histopathologic and Transcriptomic Profiling Identifies Novel Trophoblast Defects
 in Patients With Preeclampsia and Maternal Vascular Malperfusion
 
 Mariko Horii, Cuong To, Robert Morey, Marni B. Jacobs, Yingchun Li, Katharine K. 
 Nelson, Morgan Meads, Brent A. Siegel, Donald Pizzo, Rebecca Adami, Kathy 
 Zhang-Rutledge, Leah Lamale-Smith, Louise C. Laurent, Mana M. Parast,
 Modern Pathology,Volume 36, Issue 2,2023,100035,ISSN 0893-3952,
 https://doi.org/10.1016/j.modpat.2022.100035.

2. Sex-specific placental transcriptome alterations in late-onset preeclampsia reveal male-biased immune and metabolic dysregulation

 Melanie D Smith, Seema Plaisier, James Breen, K Justinian Bogias, Tanja 
 Jankovic-Karasoulos, Dylan McCullough, Dale McAninch, Anya L Arthurs, Melissa A 
 Wilson , Katherine A Pillman, Claire T Roberts
 Biol Sex Differ. 2025 Dec 24;17(1):8. doi: 10.1186/s13293-025-00781-w.
 https://doi.org/10.1186/s13293-025-00781-w
