
my_ngram <-function(x, n){
  
  gramN             <- NGramTokenizer(x)
  gramN             <- NGramTokenizer(gramN, Weka_control(min=n, max=n))
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