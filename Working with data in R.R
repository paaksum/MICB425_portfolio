read.table(file="Saanich.metadata.txt")
read.table(file="Saanich.metadata.txt", header=TRUE, row.names=1, sep="\t")
metadata=read.table(file="Saanich.metadata.txt", header=TRUE, row.names=1, sep="\t")
metadata %>% 
  select(O2_uM)
metadata %>% 
  select(matches("O2|oxygen"))
metadata %>% 
  filter(O2_uM==0)
metadata %>% 
  filter(CH4_nM>100, Temperature_C<10) %>% 
  select(Depth_m, CH4_nM, Temperature_C)
metadata %>% 
  mutate(N2O_uM=N2O_nM/1000)
