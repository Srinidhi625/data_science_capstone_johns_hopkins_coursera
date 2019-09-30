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
library(wordcloud)
library(RColorBrewer)

blogs_en   <- readLines("final/en_US/en_US.blogs.txt",  encoding =  "UTF-8")
modi_txt <- sample(blogs_en, 1000)

modi <- Corpus(VectorSource(modi_txt))

modi_data<-tm_map(modi,stripWhitespace)

modi_data<-tm_map(modi_data,tolower)

modi_data<-tm_map(modi_data,removeNumbers)

modi_data<-tm_map(modi_data,removePunctuation)

modi_data<-tm_map(modi_data,removeWords, stopwords("english"))

tdm_modi<-TermDocumentMatrix (modi_data) #Creates a TDM

TDM1<-as.matrix(tdm_modi) #Convert this into a matrix format

v = sort(rowSums(TDM1), decreasing = TRUE) #Gives you the frequencies for every word

summary(v) 

wordcloud (modi_data, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))



