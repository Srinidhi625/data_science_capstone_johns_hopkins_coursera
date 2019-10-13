
suppressPackageStartupMessages(library("NLP"))
suppressPackageStartupMessages(library("tm"))
suppressPackageStartupMessages(library("wordcloud"))
suppressPackageStartupMessages(library("RColorBrewer"))
suppressPackageStartupMessages(library("RWeka"))
suppressPackageStartupMessages(library("qdap"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("ngram"))

blogs_en   <- readLines("final/en_US/en_US.blogs.txt",  encoding = "UTF-8")
news_en    <- readLines("final/en_US/en_US.news.txt", encoding = "UTF-8")
twitter_en <- readLines("final/en_US/en_US.twitter.txt", encoding = "UTF-8")

all_en <- c(blogs_en, news_en, twitter_en)

remove(blogs_en)
remove(news_en)
remove(twitter_en)


frases <- c(
  
  "he guy in front of me just bought a pound of bacon, a bouquet, and a case of",
  "You're the reason why I smile everyday. Can you follow me please? It would mean the",
  "Hey sunshine, can you follow me and make me the",
  "Very early observations on the Bills game: Offense still struggling but the",
  "Go on a romantic date at the",
  "Well I'm pretty sure my granny has some old bagpipes in her garage I'll dust them off and be on my",
  "Ohhhhh #PointBreak is on tomorrow. Love that film and haven't seen it in quite some",
  "After the ice bucket challenge Louis will push his long wet hair out of his eyes with his little",
  "Be grateful for the good times and keep the faith during the",
  "If this isn't the cutest thing you've ever seen, then you must be"
  
)

t_all         <- removePunctuation(all_en)
t_all         <- stripWhitespace(t_all)
t_all         <- removeNumbers(t_all)
t_all         <- tolower(t_all)
t_all         <- t_all[which(t_all!="")]

t_frases         <- removePunctuation(frases)
t_frases         <- stripWhitespace(t_frases)
t_frases         <- removeNumbers(t_frases)
t_frases         <- tolower(t_frases)
t_frases         <- t_frases[which(t_frases!="")]

t_frases[1]

t_all[grepl("and a case of", t_all)]








