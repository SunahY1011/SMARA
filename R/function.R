#' Load a matrix from a file
#' 
#' 
#' @param infile Path to the input file
#' @return A matrix of the infile
#' @export
load_mat <- function(infile){
  in.dt <- data.table::fread(infile, header = TRUE)
  in.dt <- in.dt[!duplicated(in.dt[,1]),]
  in.mat <- as.matrix(in.dt[,1,with=FALSE])
  rownames(in.mat) <- unlist(in.dt[,1,with=FALSE])
  in.mat
}
