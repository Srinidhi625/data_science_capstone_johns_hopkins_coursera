
#library
suppressPackageStartupMessages(library("NLP"))
suppressPackageStartupMessages(library("tm"))
suppressPackageStartupMessages(library("wordcloud"))
suppressPackageStartupMessages(library("RColorBrewer"))
suppressPackageStartupMessages(library("RWeka"))
suppressPackageStartupMessages(library("qdap"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("ngram"))
suppressPackageStartupMessages(library("rJava"))

#sources
source("functions.R")

#set.seed
set.seed(3010)

#reading and sampling
perc <- 0.03

blogs_en        <- readLines("final/en_US/en_US.blogs.txt", encoding = "UTF-8", skipNul = TRUE)
t_blogs_en      <- sample(blogs_en, (length(blogs_en)*perc))
remove(blogs_en)

news_en       <- readLines("final/en_US/en_US.news.txt", encoding = "UTF-8", skipNul = TRUE)
t_news_en     <- sample(news_en, (length(news_en)*perc))
remove(news_en)

twitter_en    <- readLines("final/en_US/en_US.twitter.txt", encoding = "UTF-8", skipNul = TRUE)
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


write(t_all, file = "sample.out", ncolumns = 1)
remove(t_all)

#create ngram
options(java.parameters = "-Xmx8000m")
options(java.parameters = c("-XX:+UseConcMarkSweepGC", "-Xmx8192m"))


linhas        <- readLines("sample.out", encoding = "UTF-8", skipNul = TRUE)

gram2 <- my_ngram(linhas, 2)
saveRDS(gram2, file=paste0("gram2_",perc,".Rda"), compress = TRUE)
gram3 <- my_ngram(linhas, 3)
saveRDS(gram3, file=paste0("gram3_",perc,".Rda"), compress = TRUE)
gram4 <- my_ngram(linhas, 4)
saveRDS(gram4, file=paste0("gram4_",perc,".Rda"), compress = TRUE)

