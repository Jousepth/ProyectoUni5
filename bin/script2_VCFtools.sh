#Script VCFtools with several typical functions
#Jousepth Gallardo HIdalgo
#20/02/2020

#In case vcftool is not installed remove #
#docker pull biocontainers/vcftools:0.1.15 

#creating a variable that runs vcftools inside a container
vcftools="docker run -u 1600 --rm -v /home/cirio/JG/ProyectoUni5/data:/data biocontainers/vcftools:0.1.15 vcftools"


#a) How many individuals and variants (SNPs) does the file have?
$vcftools --vcf ../data/wolf_2020_JG.vcf

#b) Calculate the frequency of each allele for all individuals within the file and save the result in a file.
$vcftools --vcf ../data/wolf_2020_JG.vcf --freq --out ../data/frecuencias

#c) How many sites in the archive do not have missing data?
$vcftools --vcf ../data/wolf_2020_JG.vcf --max-missing 1

#d) Calculate the frequency of each allele for all individuals but only for sites without lost data and save the result in a file.
$vcftools --vcf ../data/wolf_2020_JG.vcf --freq --max-missing 1 --out ../data/clear_data

#e) How many sites have a minor allele frequency <0.05?
$vcftools --vcf ../data/wolf_2020_JG.vcf --max-maf 0.05

#f) Calculate the heterozygosity of each individual.
$vcftools --vcf ../data/wolf_2020_JG.vcf --het --out ../data/heterozygosity

#g) Calculate the nucleotide diversity per site.
$vcftools --vcf ../data/wolf_2020_JG.vcf --site-pi --out ../data/diversity

#h) Calculate nucleotide diversity per site only for chromosome 3 sites
$vcftools --vcf ../data/wolf_2020_JG.vcf --chr chr03 --site-pi --out ../data/diversity_Chr03

#i) Filter sites that have a minor allele frequency <0.05 and create a new file called wolves_maf05.vcf.
$vcftools --vcf ../data/wolf_2020_JG.vcf --max-maf 0.05 --recode --out ../data/wolves_maf05

#j) Convert the wolves_maf05.vcf file to plink format.
$vcftools --vcf ../data/wolves_maf05.recode.vcf --plink

#for scrip in r 
./plink --vcf ../data/wolf_2020_JG.vcf --chr-set 38 --out ../data/wolf_2020_JG_plink
