suppressPackageStartupMessages(library("NLP"))
suppressPackageStartupMessages(library("tm"))
suppressPackageStartupMessages(library("wordcloud"))
suppressPackageStartupMessages(library("RColorBrewer"))
suppressPackageStartupMessages(library("RWeka"))
suppressPackageStartupMessages(library("qdap"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("ngram"))

blogs_en   <- readLines("final/en_US/en_US.blogs.txt",  encoding = "UTF-8", skipNul = TRUE)
news_en    <- readLines("final/en_US/en_US.news.txt", encoding = "UTF-8", skipNul = TRUE)
twitter_en <- readLines("final/en_US/en_US.twitter.txt", encoding = "UTF-8", skipNul = TRUE)

set.seed(3010)

qtd_sample    <- 10000
t_blogs_en    <- sample(blogs_en, qtd_sample)
t_news_en     <- sample(news_en, qtd_sample)
t_twitter_en  <- sample(twitter_en, qtd_sample)
t_all         <- c(t_blogs_en, t_news_en, t_twitter_en)
remove(t_blogs_en, t_news_en, t_twitter_en)

t_all         <- removePunctuation(t_all)
t_all         <- stripWhitespace(t_all)
t_all         <- removeNumbers(t_all)
t_all         <- tolower(t_all)
t_all         <- t_all[which(t_all!="")]


write(t_all, file = "sample.out", ncolumns = 1)
