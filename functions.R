


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

cleanPhrase <- function(frase){
  
  frase         <- removePunctuation(frase)
  frase         <- stripWhitespace(frase)
  frase         <- removeNumbers(frase)
  frase         <- tolower(frase)
  frase         <- frase[which(frase!="")]
  frase         <- trimws(frase)
  return(frase)
  
}

predictWord <- function(frase){
  
  if(length(frase) > 0){
    
    qtd_words <- sapply(strsplit(frase, " "), length)
    
  }else{
    
    return("Digit something...")
    
  }
  
  if(qtd_words == 1){
    
    predict <- as.character(gram2[str_detect(gram2$gramN, paste0("^",frase," \\w+$"), negate = FALSE), 1][1])
    
    return(paste0("NO PREDICTIONS AVALIBLES FOR: ", frase))
    
    predict <- tail(strsplit(predict, split=" ")[[1]],1)
    return(predict)
    
  }else if(qtd_words == 2){
    
    predict <- as.character(gram3[str_detect(gram3$gramN, paste0("^",frase," \\w+$"), negate = FALSE), 1][1])
    
    if(is.na(predict)){
      
      frase         <-  tail(strsplit(frase, split=" ")[[1]],3)
      frase         <-  paste0(frase[3])
      
      predict <- as.character(gram2[str_detect(gram2$gramN, paste0("^",frase," \\w+$"), negate = FALSE), 1][1])  
      
      if(is.na(predict)){
        
        return(paste0("NO PREDICTIONS AVALIBLES FOR: ", frase))
        
      }
      
    }
    
  }else if(qtd_words >= 3){
    
    frase         <-  tail(strsplit(frase, split=" ")[[1]],3)
    frase         <-  paste0(frase[1], " ", frase[2], " ", frase[3])
    
    predict <- as.character(gram4[str_detect(gram4$gramN, paste0("^",frase," \\w+$"), negate = FALSE), 1][1])
    
    if(is.na(predict)){
      
      frase         <-  tail(strsplit(frase, split=" ")[[1]],3)
      frase         <-  paste0(frase[2], " ", frase[3])
      
      predict <- as.character(gram3[str_detect(gram3$gramN, paste0("^",frase," \\w+$"), negate = FALSE), 1][1])
      
      if(is.na(predict)){
        
        frase         <-  tail(strsplit(frase, split=" ")[[1]],3)
        frase         <-  paste0(frase[3])
        
        predict <- as.character(gram2[str_detect(gram2$gramN, paste0("^",frase," \\w+$"), negate = FALSE), 1][1])  
        
        if(is.na(predict)){
          
          return(paste0("NO PREDICTIONS AVALIBLES FOR: ", frase))
          
        }
        
      }
      
    } 
    
  }
  
  predict <- tail(strsplit(predict, split=" ")[[1]],1)
  return(predict)
  
}








