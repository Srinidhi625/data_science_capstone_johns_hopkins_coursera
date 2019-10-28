
# BIBLIOTECAS
suppressPackageStartupMessages(library("NLP"))
suppressPackageStartupMessages(library("tm"))
suppressPackageStartupMessages(library("wordcloud"))
suppressPackageStartupMessages(library("RColorBrewer"))
suppressPackageStartupMessages(library("RWeka"))
suppressPackageStartupMessages(library("qdap"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("ngram"))
suppressPackageStartupMessages(library("stringi"))
suppressPackageStartupMessages(library("stringr"))


# FUNÇÕES
source("functions.R")

# FRASES PARA LOCALIZA
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





# LEITURA DAS AMOSTRAS
dados <- readLines("sample.out", encoding = "UTF-8")

gram1 <- my_ngram(dados, 1)
gram2 <- my_ngram(dados, 2)
gram3 <- my_ngram(dados, 3)
gram4 <- my_ngram(dados, 4)

#questao
gram3[str_detect(gram3$gramN, "^case of \\w+$", negate = FALSE),]
gram2[str_detect(gram2$gramN, "^of \\w+$", negate = FALSE),]











#gramX[str_detect(gramX$gramN, "^insensitive$",  negate = FALSE),]
  







