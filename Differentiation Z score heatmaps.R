# Load dependencies
library("ggplot2")
library("ggdendro")
library("reshape2")
library("grid")
library("gplots")
library("RColorBrewer")
library("scales")
library("spatstat")

# Read in data
alldata_day0 <- read.csv(file = "Differentiation_ZscoreData_day0.csv", header = TRUE)
Zcols_day0<-c("CONDITION", "FAD.Intensity","FAD.a1","FAD.a2","FAD.t1","FAD.t2","FAD.tm", "NADPH.Intensity", "NADPH.a1","NADPH.a2","NADPH.t1","NADPH.t2","NADPH.tm","Redox.Ratio")
Zscores_day0<-alldata_day0[Zcols_day0]

alldata_day1 <- read.csv(file = "Differentiation_ZscoreData_day1.csv", header = TRUE)
Zcols_day1<-c("CONDITION", "FAD.Intensity","FAD.a1","FAD.a2","FAD.t1","FAD.t2","FAD.tm", "NADPH.Intensity", "NADPH.a1","NADPH.a2","NADPH.t1","NADPH.t2","NADPH.tm","Redox.Ratio")
Zscores_day1<-alldata_day1[Zcols_day1]


alldata <- read.csv(file = "Differentiation_ZscoreData.csv", header = TRUE)
Zcols<-c("CONDITION", "FAD.Intensity","FAD.a1","FAD.a2","FAD.t1","FAD.t2","FAD.tm", "NADPH.Intensity", "NADPH.a1","NADPH.a2","NADPH.t1","NADPH.t2","NADPH.tm","Redox.Ratio")
Zscores<-alldata[Zcols]



# Run clustering
Zscores_day0.matrix <- as.matrix(Zscores_day0[, -c(1)])
rownames(Zscores_day0.matrix) <- Zscores_day0$CONDITION
Zscore_day0.dendro <- as.dendrogram(hclust(d = dist(x = Zscores_day0.matrix)))

Zscores.matrix <- as.matrix(Zscores[, -c(1)])
rownames(Zscores.matrix) <- Zscores$CONDITION




# Run clustering
Zscores_day1.matrix <- as.matrix(Zscores_day1[, -c(1)])
rownames(Zscores_day1.matrix) <- Zscores_day1$CONDITION
Zscore_day1.dendro <- as.dendrogram(hclust(d = dist(x = Zscores_day1.matrix)))


# Create dendro
dendro.plot <- ggdendrogram(data = Zscore.dendro, rotate = TRUE)


# Preview the plot
print(dendro.plot)


#Separate data by Condition, variable, and corresponding Z score value
Zscore.long <- melt(Zscores, id = c("CONDITION"))



##Reorder Z score heatmap
Zscoredendro.order <- order.dendrogram(Zscore.dendro)
Zscore.order<- c(22:1)

Zscore.long$CONDITION <- factor(x = Zscore.long$CONDITION,
                                levels = Zscores$CONDITION[Zscore.order], 
                                ordered = TRUE)

Zscore.long$CONDITION <- factor(x = Zscore.long$CONDITION,
                               levels = Zscores$CONDITION[Zscoredendro.order], 
                               ordered = TRUE)


#########################################################
### Customizing and plotting the heat map
#########################################################

# creates a own color palette from blue to white
my_palette <- colorRampPalette(c("#FDFDA1", "#8E8ECB", "#0404FE"))(n = 299)

# (optional) defines the color breaks manually for a "skewed" color transition
col_breaks = c(seq(-2,-0.6667,length= 100),  # for red
               seq(-0.6666,0.6666,length=100),           # for yellow
               seq(0.6667,2,length=100))             # for green

# creates a 5 x 5 inch image
png("../images/Zscore_heatmap.png",    # create PNG for the heat map        
    width = 16*300,        # 5 x 300 pixels
    height = 9*300,
    res = 300,            # 300 pixels per inch
    pointsize = 8)        # smaller font size



##Plot Z-score heatmap with all data
dev.new()
heatmap.2(Zscores.matrix,
          notecol="black",      # change font color of cell labels to black
          density.info="none",  # turns off density plot inside color legend
          trace="none",         # turns off trace lines inside the heat map
          margins =c(9,9),     # widens margins around plot
          col=my_palette,       # use on color palette defined earlier
          #breaks=col_breaks,    # enable color transition at specified limits
          dendrogram="row",     # only draw a row dendrogram
          Colv="NA") 


##Plot Z-score heatmap with just Day 0 data
dev.new()
heatmap.2(Zscores_day0.matrix,
          notecol="black",      # change font color of cell labels to black
          density.info="none",  # turns off density plot inside color legend
          trace="none",         # turns off trace lines inside the heat map
          margins =c(9,9),     # widens margins around plot
          col=my_palette,       # use on color palette defined earlier
          #breaks=col_breaks,    # enable color transition at specified limits
          dendrogram="row",     # only draw a row dendrogram
          Colv="NA") 



##Plot Z-score heatmap with just Day 1 data
dev.new()
heatmap.2(Zscores_day1.matrix,
          notecol="black",      # change font color of cell labels to black
          density.info="none",  # turns off density plot inside color legend
          trace="none",         # turns off trace lines inside the heat map
          margins =c(9,9),     # widens margins around plot
          col=my_palette,       # use on color palette defined earlier
          #breaks=col_breaks,    # enable color transition at specified limits
          dendrogram="row",     # only draw a row dendrogram
          Colv="NA")            # turn off column clustering

