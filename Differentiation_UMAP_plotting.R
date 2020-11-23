# point working directory to extracted zip directory
PATH_TO_EXTRACTED_ZIP = "C:/Users/Nabiki/Desktop/development/cardiomyocyte_differentiation"
setwd(PATH_TO_EXTRACTED_ZIP)
getwd()

# install dependencies
install.packages("ggplot2")
install.packages("Hmisc")
install.packages("psych")
install.packages("reshape2")
install.packages("dplyr")
install.packages("plyr")
install.packages("rlist")
install.packages("scales")
install.packages("corrplot")
install.packages("tables")
install.packages("ggrepel")
install.packages("grid")
install.packages("gridExtra")
install.packages("randomcoloR")
install.packages("RColorBrewer")
install.packages("inlmisc")

## Load in all required packages
library("ggplot2")
library("Hmisc")
library("psych")
library("reshape2")
library("dplyr")
library("plyr")
library("rlist")
library("scales")
library("corrplot")
library("tables")
library("ggrepel")
library("grid")
library("gridExtra")
library("randomcoloR")
library("RColorBrewer")
library("inlmisc")


## Read in data sets with UMAP coordinates
DataUMAPS_alldata<-data.frame(read.csv("classification_results_umap_AllData.csv")) # All Day 0 - Day 5 data
DataUMAPS_Day1Eff<-data.frame(read.csv("classification_results_umap_together_Day1Efficiency.csv"))

palette_Perc <- c('#e6194b','#4363d8', '#f58231', '#911eb4', '#46f0f0', '#f032e6', '#bcf60c', '#fabebe', '#008080', '#004530', '#3cb44b') #color palette for coding by differentiation percentage

palette_Day <- c('#e6194b', '#3cb44b', '#ffe119', '#4363d8') #color palette for coding by Day 0 - Day5 

palette_Efficiency <- c('#e6194b', '#4363d8') #color palette for coding by high or low efficiency



#Splitting Data for multi-panel graphs 

DatabyDiff<- split(DataUMAPS_alldata, f = as.factor(DataUMAPS_alldata$PERCENTAGE))
DatabyDay<- split(DataUMAPS_alldata, f = as.factor(DataUMAPS_alldata$DAY))
DatabyEff<- split(DataUMAPS_alldata, f = as.factor(DataUMAPS_alldata$EFFICIENCY))
DatabyCond<- split(DataUMAPS_alldata, f = as.factor(DataUMAPS_alldata$CONDITION))



#UMAP Clustering - All Data Together

##UMaP by Day (Day 0-Day 5)
dev.new()
ggplot(DataUMAPS_alldata, aes(x = cosine1, y = cosine2, color = as.factor(DAY))) + 
  geom_point() +
  scale_color_manual(values=palette_Day)+
  guides(color=guide_legend(title="Day"))+
  xlab("cosine1") + 
  ylab("cosine2") +
  theme(axis.title = element_text(size = 14, face = 'bold')) +
  theme(axis.text.x=element_text(size=14, vjust=0.5)) +
  theme(axis.text.y=element_text(size=14, vjust=0.5))+
  theme(legend.title = element_text(size = 14, face = 'bold')) +
  theme(legend.text = element_text(size = 14)) 
ggsave('UMAP_Differentation_byday.eps') # save eps file



##Plot each Day separately
plot<-list()
for (i in 1:4)
{
  dfDatabyDay<-ldply(DatabyDay[i])
  labelDay<-c("0","1","3","5")
  plot[[i]]<-ggplot(data = dfDatabyDay, aes(x = cosine1, y = cosine2, color = palette_Day[i])) + 
    geom_point() +
    scale_color_manual(labels = labelDay[i],values=palette_Day[i])+
    guides(color=guide_legend(title="Day"))+
    xlab("cosine1") + 
    ylab("cosine2") +
    theme(axis.title = element_text(size = 14, face = 'bold')) +
    theme(axis.text.x=element_text(size=14, vjust=0.5)) +
    theme(axis.text.y=element_text(size=14, vjust=0.5))+
    theme(legend.title = element_text(size = 14, face = 'bold')) +
    theme(legend.text = element_text(size = 14)) +
    scale_x_continuous(limits = c(-12, 12))+
    scale_y_continuous(limits = c(-10, 10))
}


##Arrange in 4x4 grid
plot1<-plot[1:4]
dev.new()
do.call(grid.arrange,plot1)



#Plots each conditon by day
plot<-list()
for (i in 1:11)
{
  dfDatabyCond<-ldply(DatabyCond[i])
  dfDatabyCond$DAY<-as.factor(dfDatabyCond$DAY)
  plot[[i]]<-ggplot(data = dfDatabyCond, aes_string(x = dfDatabyCond$cosine1, y = dfDatabyCond$cosine2, color = as.factor(dfDatabyCond$DAY))) + 
    geom_point() +
    scale_color_manual(values=palette_Day, labels = abbreviate)+
    guides(color=guide_legend(title="Day"))+
    xlab("cosine1") + 
    ylab("cosine2") +
    theme(axis.title = element_text(size = 14, face = 'bold')) +
    theme(axis.text.x=element_text(size=14, vjust=0.5)) +
    theme(axis.text.y=element_text(size=14, vjust=0.5))+
    theme(legend.title = element_text(size = 14, face = 'bold')) +
    theme(legend.text = element_text(size = 14)) +
    scale_x_continuous(limits = c(-12, 12))+
    scale_y_continuous(limits = c(-10, 10))
  
}

#Arranges plots in 4x4 grid
plot1<-plot[1:4]
plot2<-plot[5:8]
plot3<-list()
plot3[1]<-plot[9]
plot3[2]<-plot[10]
plot3[3]<-plot[11]


plot3[4]<-list(ggplot() + theme_void())
dev.new()
do.call(grid.arrange,plot1)
dev.new()
do.call(grid.arrange,plot2)
dev.new()
do.call(grid.arrange,plot3)




##Plot UMAP of Day 1 Efficiency (not based all Day 0 - Day 5 data)
DatabyEFF<- split(DataUMAPS_Day1Eff, f = as.factor(DataUMAPS_Day1Eff$EFFICIENCY))



##Only High efficiency plot
dev.new()
ggplot(DatabyEFF[[1]], aes(x = canberra1, y = canberra2, color = as.factor(EFFICIENCY))) + 
  geom_point() +
  scale_color_manual(values=palette_Efficiency)+
  guides(color=guide_legend(title="EFFICIENCY"))+
  xlab("UMAP1") + 
  ylab("UMAP2") +
  theme(axis.title = element_text(size = 14, face = 'bold')) +
  theme(axis.text.x=element_text(size=14, vjust=0.5)) +
  theme(axis.text.y=element_text(size=14, vjust=0.5))+
  theme(legend.title = element_text(size = 14, face = 'bold')) +
  theme(legend.text = element_text(size = 14)) +
  scale_x_continuous(limits = c(-12, 12))+
  scale_y_continuous(limits = c(-10, 10))
ggsave("Day1_efficiency_UMAP_High.eps") # Save eps file


##Only Low efficiency plot
dev.new()
ggplot(DatabyEFF[[2]], aes(x = canberra1, y = canberra2, color = as.factor(EFFICIENCY))) + 
  geom_point() +
  scale_color_manual(values=palette_Efficiency[2])+
  guides(color=guide_legend(title="EFFICIENCY"))+
  xlab("UMAP1") + 
  ylab("UMAP2") +
  theme(axis.title = element_text(size = 14, face = 'bold')) +
  theme(axis.text.x=element_text(size=14, vjust=0.5)) +
  theme(axis.text.y=element_text(size=14, vjust=0.5))+
  theme(legend.title = element_text(size = 14, face = 'bold')) +
  theme(legend.text = element_text(size = 14)) +
  scale_x_continuous(limits = c(-12, 12))+
  scale_y_continuous(limits = c(-10, 10))
ggsave("Day1_efficiency_UMAP_Low.eps") #save eps file


##Low and High efficiency graph
dev.new()
ggplot(DataUMAPS_Day1Eff, aes(x = canberra1, y = canberra2, color = as.factor(EFFICIENCY))) + 
  geom_point() +
  scale_color_manual(values=palette_Efficiency)+
  guides(color=guide_legend(title="EFFICIENCY"))+
  #geom_dotplot(binaxis = "y", stackdir = "center", position=position_dodge(1), binwidth = .075) +
  xlab("UMAP1") + 
  ylab("UMAP2") +
  theme(axis.title = element_text(size = 14, face = 'bold')) +
  theme(axis.text.x=element_text(size=14, vjust=0.5)) +
  theme(axis.text.y=element_text(size=14, vjust=0.5))+
  #theme(legend.position = "none") 
  theme(legend.title = element_text(size = 14, face = 'bold')) +
  theme(legend.text = element_text(size = 14)) +
  scale_x_continuous(limits = c(-12, 12))+
  scale_y_continuous(limits = c(-10, 10))
ggsave("Day1_efficiency_UMAP_LowHigh.eps") #save eps file


