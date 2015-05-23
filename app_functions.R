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

model_search <- function(x, Model) {
  cleanIn <- clean_input(x)
  lengthIn <- length(unlist(strsplit(cleanIn, " ")))
  if(lengthIn == 0) return("the")
  modelTry <- unlist(lapply(1:lengthIn,
                     function(y) !is.null(unlist(Model[[y]][strCut(cleanIn, y)]))))
  validInputs <- sum(modelTry)
  if(validInputs == 0) return("the")
  rawOut <- Model[[validInputs]][strCut(cleanIn, validInputs)]
  list(rawOut[[1]][[1]], rawOut[[1]][[2]])
}