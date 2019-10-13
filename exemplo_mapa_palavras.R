#install.packages("tm")
#install.packages("XML")
#install.packages("wordcloud")
#install.packages("RColorBrewer")
#install.packages("caret")
#install.packages("NLP")
#install.packages("openNLP")
#install.packages("RWeka")
#install.packages("qdap")
#install.packages("ggplot2")
#install.packages("tm")
#install.packages("rJava")

library(tm)
library(XML)
library(wordcloud)
library(RColorBrewer)
library(caret)
library(NLP)
library(openNLP)
library(RWeka)
library(qdap)
library(ggplot2)
library(tm)



blogs_en_mp   <- readLines("final/en_US/en_US.blogs.txt",  encoding =  "UTF-8")
modi_txt <- sample(blogs_en_mp, 1000)

modi <- Corpus(VectorSource(modi_txt))

modi_data<-tm_map(modi)

modi_data<-tm_map(modi,stripWhitespace)
modi_data<-tm_map(modi_data,tolower)
modi_data<-tm_map(modi_data,removeNumbers)
modi_data<-tm_map(modi_data,removePunctuation)
modi_data<-tm_map(modi_data,removeWords, stopwords("english"))
tdm_modi<-TermDocumentMatrix (modi_data)
TDM1<-as.matrix(tdm_modi)
v = sort(rowSums(TDM1), decreasing = TRUE)
summary(v) 

wordcloud (modi, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
?wordcloud


gram<-NGramTokenizer(modi_txt)

gramOne<-NGramTokenizer(gram, Weka_control(min=1, max=1))
gramOne<-data.frame(table(gramOne))
gramOne<-gramOne[order(gramOne$Freq, decreasing = TRUE),]
gramOne[1:10,]
barplot(gramOne$Freq[1:10], names.arg = as.character(gramOne$gramOne[1:10]))



gramTwo<-NGramTokenizer(gram, Weka_control(min=2, max=2))
gramTwo<-data.frame(table(gramTwo))
gramTwo<-gramTwo[order(gramTwo$Freq, decreasing = TRUE),]

gramThree<-NGramTokenizer(gram, Weka_control(min=3,max=3))
gramThree<-data.frame(table(gramThree))
gramThree<-gramThree[order(gramThree$Freq, decreasing = TRUE),]

