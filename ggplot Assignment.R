library(tidyverse)
source("https://bioconductor.org/biocLite.R")
biocLite("phyloseq")
library("phyloseq")
load("phyloseq_object.RData")
ggplot(metadata, aes(x=O2_uM, y=Depth_m))+
  geom_point(shape="square")
ggplot(metadata, aes(x=O2_uM, y=Depth_m))+
  geom_point(size=1)
ggplot(metadata, aes(x=O2_uM, y=Depth_m, size=OxygenSBE_V))+
  geom_point()

#Exercise 1
ggplot(metadata, aes(x=PO4_uM, y=Depth_m))+
  geom_point(shape=17, color="purple")

#Exercise 2
metadata %>% 
  mutate(Temperature_F=Temperature_C*1.8+32) %>% 
  ggplot(aes(x=Temperature_F, y=Depth_m))+
  geom_point()

#gglot with phyloseq
physeq
plot_bar(physeq, fill="Phylum")
physeq_percent=transform_sample_counts(physeq, function(x) 100 * x/sum(x))
plot_bar(physeq, fill = "Phylum")
plot_bar(physeq_percent, fill = "Phylum")+
  geom_bar(aes(fill=Phylum), stat="identity")

#Exercise 3
plot_bar(physeq_percent, fill = "Species")+
  geom_bar(aes(fill=Phylum), stat="identity")+
  labs(title="Species from 10 to 200 m in Saanich Inlet", x="Sample depth", y="Percent relative abundance")

#Faceting
plot_bar(physeq_percent, fill = "Phylum")+
  geom_bar(aes(fill=Phylum), stat="identity")+
  facet_wrap(~Phylum)
plot_bar(physeq_percent, fill = "Phylum")+
  geom_bar(aes(fill=Phylum), stat="identity")+
  facet_wrap(~Phylum, scales = "free_y")+
  theme(legend.position = "none")

#Exercise 4
metadata %>% 
  gather(nutrients, uM, O2_uM, PO4_uM, SiO2_uM, NO3_uM, NH4_uM, NO2_uM) %>% 
  ggplot(aes(Depth_m, uM))+
  geom_point()+
  geom_line()+
  facet_wrap(~nutrients, scales = "free_y")+
  theme(legend.position = "none")
