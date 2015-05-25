clean_input <- function(x) {
  cleanOut <- tolower(x)
  cleanOut <- gsub("\u0092s ", "", cleanOut, perl = TRUE)
  cleanOut <- gsub("st. louis", "st louis", cleanOut, perl = TRUE)
  cleanOut <- gsub("george w. bush", "george w bush", cleanOut, perl = TRUE)
  cleanOut <- gsub("^#", " ", cleanOut, perl = TRUE) 
  cleanOut <- gsub("'", "", cleanOut, perl = TRUE)
  cleanOut <- gsub("…", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("“", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("”", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("‘", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("’", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("–", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub(" the ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub(" is ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub(" at ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub(" which ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub(" on ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub(" a ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub(" an ", " ", cleanOut, perl = TRUE)
  cleanout <- gsub(" and ", " ", x, perl = TRUE)
  cleanOut <- gsub("^the ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("^is ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("^at ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("^which ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("^on ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("^a ", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("^an ", " ", cleanOut, perl = TRUE)
  cleanout <- gsub("^and ", " ", x, perl = TRUE)
  cleanOut <- gsub("(?![<s>])[[:punct:]]", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("\\d", " ", cleanOut, perl = TRUE)
  cleanOut <- gsub("^ *|(?<= ) | *$", "", cleanOut, perl=TRUE)
  cleanOut <- unlist(strsplit(cleanOut, " "))
  paste(tail(cleanOut, 4), collapse = " ")
}

strCut <- function(x, n) {
  sString <- unlist(strsplit(x, " "))
  paste(tail(sString, n), collapse = " ")
}

countValidIn <- function(lenIn, modUsed, inString) {
  modelTry <- unlist(lapply(1:lenIn,
                            function(y) !is.null(unlist(modUsed[[y]][strCut(inString, y)]))))
  sum(modelTry)
}

baseList <- c("the", "be", "to")
baseProb <- c(.01, .01, .01)

model_search <- function(x, Model) {
  cleanIn <- clean_input(x)
  lengthIn <- length(unlist(strsplit(cleanIn, " ")))
  if(lengthIn == 0) return(list(c("The", "Be", "To"), baseProb))
  validInputs <- countValidIn(lengthIn, Model, cleanIn)
  if(validInputs == 0) return(list(baseList, baseProb))
  rawOut <- Model[[validInputs]][strCut(cleanIn, validInputs)]
  outDefecit <- 3 - length(rawOut[[1]][[1]])
  if(outDefecit > 0) {
    if(lengthIn > 1) {
      validAdds <- countValidIn((lengthIn - 1), Model, cleanIn)
      addOut <- c(Model[[validAdds]][strCut(cleanIn, validAdds)][[1]][[1]], baseList)
      addPick <- addOut[which(!is.element(addOut, rawOut[[1]][[1]]))]
      rawOut[[1]][[1]] <- c(rawOut[[1]][[1]], addPick[1:outDefecit])
      rawOut[[1]][[2]] <- c(rawOut[[1]][[2]], rep(.01, outDefecit))
    }
    if(lengthIn == 1){
      possibleAdd <- baseList[which(!is.element(baseList, rawOut[[1]][[1]]))]
      rawOut[[1]][[1]] <- c(rawOut[[1]][[1]], possibleAdd[1:outDefecit])
      rawOut[[1]][[2]] <- c(rawOut[[1]][[2]], rep(.01, outDefecit))
    }
  }
  list(rawOut[[1]][[1]], rawOut[[1]][[2]])
}