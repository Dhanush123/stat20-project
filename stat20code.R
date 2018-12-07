library(dplyr)    
library(ggplot2)
library(stringr)
#renamed life ladder column so it's easier to access column and it's more intuitive as to what data the column has when I'm using it
colnames(whr)[4] = "happiness"
#we only need 2 columns from countries in 2016
data2016 = select(filter(whr,year==2016),"country","happiness")
#getting 10 most and least happiest countries
top10 = head(data2016[order(data2016$happiness, decreasing=TRUE),], 10)
bottom10 = head(data2016[order(data2016$happiness, decreasing=FALSE),], 10)
#combining the top and bottom 10 happiest countries' data
combo = rbind(top10,bottom10)
#formatting the country names to not overlap in bar chart
combo$country = str_wrap(combo$country, width = 10)
finalChart = ggplot(data=combo,
          aes(x=reorder(country,-happiness),y=happiness,fill=happiness))+
          labs(title="Top and Bottom 10 Countries by Happiness in 2016")+
          labs(subtitle="Note: Happiness is more formally known as \"Life Ladder\"")+
          labs(caption="By Dhanush Patel")+
          xlab("Country")+
          ylab("Happiness")+
          geom_bar(stat="identity")
finalChart
#happiest country
topHappiness = head(combo,1)$happiness
#saddest country
bottomHappiness = tail(combo,1)$happiness
topHappiness
bottomHappiness
#happiness difference between most and least happiest countries
biggestDifference = topHappiness-bottomHappiness
biggestDifference
#happiness averages for top 10 happiest and bottom 10 happiest countries
topAverage = sum(head(combo,5)$happiness)/5
bottomAverage = sum(tail(combo,5)$happiness)/5
topAverage
bottomAverage
differenceAverage = topAverage - bottomAverage
differenceAverage