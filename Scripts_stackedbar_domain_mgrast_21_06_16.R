# Load required libraries
library(vegan);
library(RColorBrewer);
library(ggplot2)


#### Open data file
tab_domain_mg <- read.delim("/Users/elhamkarimi/Desktop/Metagenomics_Paper/Results/MG_Rast/Taxnonomy_files/table_omain_mgrast_R_21_06_16.csv", sep = ";", row.names = 1)


### Create a normalized table
tab_domain_mg_norm <- tab_domain_mg  
for (i in 1:20) {
  tab_domain_mg_norm [,i] <- tab_domain_mg  [,i]/sum(tab_domain_mg  [,i])*100
  
}

# Get just the top 
number_of_categories = 7

# Stacked Bar Plot with Colors and Legend
colors <- c("#013ADF","#F7BE81","#8A0808","#81DAF5","#FFFF00","#31B404","#FF00FF")

barplot(as.matrix(tab_domain_mg_norm),
        col =colors ,
        xlab="Samples",
        ylab="Relative abondance%",
        space = c(0.5, 0.5), 
        pin=(5)
)
title("Domain presented in Microhabitat",
      cex.main = 1.1)
legend ("topright",legend= rownames(tab_domain_mg_norm),fill = colors, cex = 0.75, pt.cex=0.35, ncol = 1, bty='n', lty = c(1,2))


#### Stacked bar for Viroues in diferent biomes ###
tab_virous_norm  <- tab_domain_mg_norm[4,]


colors <- "#81DAF5"

barplot(as.matrix(tab_virous_norm),
        col =colors ,
        xlab="Samples",
        ylab="Relative abondance %",
        ylim = c(0,1)
        )
title("Domain presented in Microhabitat",
      cex.main = 1.1)
legend ("topright",legend= rownames(tab_virous_norm),fill = colors, cex = 0.75, pt.cex=0.35, ncol = 1, bty='n', lty = c(1,2))


  
