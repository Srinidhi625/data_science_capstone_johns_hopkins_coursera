


my_ngram <-function(x, n){
  
  gramN             <- NGramTokenizer(x, Weka_control(min=n, max=n))
  gramN             <- data.frame(table(gramN))
  gramN             <- gramN[order(gramN$Freq, decreasing = TRUE),]
  
  return(gramN)
  
}


coverage <- function(x, freq){
  
  tmp = 0
  max = trunc(sum(x$Freq) * freq)
  
  
  for(i in 1:nrow(x)){
    
    tmp = x$Freq[i] + tmp
    
    
    if(tmp > max){
      
      return(i)
      
    }
    
  }
  
}

predictWord <- function(frase){
  

  
  
  return(paste0(frase, " <- "))
  
  
}

cleanPhrase <- function(frase){
  
  frase         <- removePunctuation(frase)
  frase         <- stripWhitespace(frase)
  frase         <- removeNumbers(frase)
  frase         <- tolower(frase)
  frase         <- frase[which(frase!="")]
  
  return(frase)
  
}









