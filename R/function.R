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
M3_GO_org <- c(
  "","Not selected", "",
  "org.Hs.eg.db","Human","3",
  "org.Mm.eg.db","Mouse","5",
  "org.Rn.eg.db","Rat","15",
  "org.Dm.eg.db","Fly","26",
  "org.Dr.eg.db","Zebrafish","34",
  "org.At.tair.db","Arabidopsis","37",
  "org.Sc.sgd.db","Yeast","40",
  "org.Ce.eg.db","Worm","47",
  "org.Bt.eg.db","Bovine","49",
  "org.Gg.eg.db","Chicken","51",
  "org.Ss.eg.db","Pig","52",
  "org.Mmu.eg.db","Rhesus","54",
  "org.Cf.eg.db","Canine","58",
  "org.EcK12.eg.db","E coli strain K12","70",
  "org.Xl.eg.db","Xenopus","70",
  "org.Pt.eg.db","Chimp","85",
  "org.Ag.eg.db","Anopheles","89",
  "org.EcSakai.eg.db","E coli strain Sakai","104",
  "org.Mxanthus.db","Myxococcus xanthus DK 1622","281")
M3_GO_org <- as.data.frame(t(matrix(M3_GO_org, nrow = 3)))
colnames(M3_GO_org) <- c('Org','Species','Rank')
M3_GO_org <- M3_GO_org[order(M3_GO_org$Species),]
