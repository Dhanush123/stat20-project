library(dplyr)    
library(ggplot2)
library(stringr)
colnames(whr)[4] = "happiness"
data2016 = select(filter(whr,year==2016),"country","happiness")
top10 = head(data2016[order(data2016$happiness, decreasing=TRUE),], 10)
bottom10 = head(data2016[order(data2016$happiness, decreasing=FALSE),], 10)
combo = rbind(top10,bottom10)
combo$country = str_wrap(combo$country, width = 10)
topGraph = ggplot(data=combo,
          aes(x=reorder(country,-happiness),y=happiness,fill=happiness))+
          labs(title="Top and Bottom 10 Countries by Happiness in 2016")+
          labs(subtitle="Note: Happiness is more formally known as \"Life Ladder\"")+
          xlab("Country")+
          ylab("Happiness")+
          geom_bar(stat="identity")
topGraph