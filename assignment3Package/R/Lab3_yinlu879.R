# 1.1 Write the R code
# 1.1.1 euclidean()

#' Find greatest common divisor of two numbers.
#' @param x1 number 1
#' @param x2 number 2
#' @return  The greatest common divisor of \code{x1} and \code{x2}
#' @examples
#' euclidean(123612, 13892347912)
#' euclidean(100, 1000)
#' @references \url{https://en.wikipedia.org/wiki/Euclidean_algorithm}
euclidean = function(x1, x2){
  while(x2 != 0){
    temp = x2
    x2 = x1 %% x2
    x1 = temp
  }
  return(x1)
}

#1.1.2 *dijkstra()

#' Dijkstra's algorithm - Find the shortest path of the given graph.
#' @param df A data frame (the graph).
#' @param init_nod A numbe (the start node).
#' @return  The shortest path to every other node from the starting node as a vector. 
#' @references \url{https://en.wikipedia.org/wiki/Dijkstra\%27s_algorithm}
#' @examples
#' wiki_graph <- 
#' data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6), 
#'            v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5), 
#'            w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))

dijkstra = function(df, init_nod){
  stopifnot(is.numeric(init_nod))
  result = rep(NA, length(unique(df$v1)))
  result[init_nod] = 0
  checkList = c(init_nod)
  while(length(checkList) != 0){
    index = which(df$v1 == checkList[1])
    for(i in index){
      if(is.na(result[df$v2[i]]) || result[df$v2[i]] > result[df$v1[i]] + df$w[i]){
        result[df$v2[i]] = result[df$v1[i]] + df$w[i]
        checkList = c(checkList, df$v2[i])
      }
    }
    checkList = checkList[checkList != checkList[1]]
  }
  return(result)
}


wiki_graph <- 
  data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6), 
             v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5), 
             w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
dijkstra(wiki_graph, 1)
dijkstra(wiki_graph, 3)

