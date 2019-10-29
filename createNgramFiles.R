
#library
suppressPackageStartupMessages(library("NLP"))
suppressPackageStartupMessages(library("tm"))
suppressPackageStartupMessages(library("wordcloud"))
suppressPackageStartupMessages(library("RColorBrewer"))
suppressPackageStartupMessages(library("RWeka"))
suppressPackageStartupMessages(library("qdap"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("ngram"))

#sources
suppressPackageStartupMessages(source("functions.R"))

#set.seed
set.seed(3010)

#reading and sampling
perc <- 0.1

blogs_en        <- readLines("final/en_US/en_US.blogs.txt", encoding = "UTF-8")
t_blogs_en      <- sample(blogs_en, (length(blogs_en)*perc))
remove(blogs_en)

news_en       <- readLines("final/en_US/en_US.news.txt", encoding = "UTF-8")
t_news_en     <- sample(news_en, (length(news_en)*perc))
remove(news_en)

twitter_en    <- readLines("final/en_US/en_US.twitter.txt", encoding = "UTF-8")
t_twitter_en  <- sample(twitter_en, (length(twitter_en)*perc))
remove(twitter_en)

t_all         <- c(t_blogs_en, t_news_en, t_twitter_en, perc)

remove(t_blogs_en, t_news_en, t_twitter_en)

#cleaning
t_all         <- removePunctuation(t_all)
t_all         <- stripWhitespace(t_all)
t_all         <- removeNumbers(t_all)
t_all         <- tolower(t_all)
t_all         <- t_all[which(t_all!="")]

#create NGRAM - 2, 3, 4

gram2   <- my_ngram(t_all, 2)
gram3   <- my_ngram(t_all, 3)
gram4   <- my_ngram(t_all, 4)









