getinchikey<-function(getNAME)
{
  ###Baicalin
  ###################################	
  url<- "http://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getNAME, "/property/InChIKey"))},error = function(x) {return(NA)})
  out1<-tryCatch({jsonlite::fromJSON(paste0(url,getNAME, "/property/CanonicalSMILES"))}, error = function(x) {return(NA)})
  out2<-tryCatch({jsonlite::fromJSON(paste0(url,getNAME, "/property/InChI"))}, error = function(x) {return("NA")})
  ############### InchIkey
  OIK<-tryCatch({out$PropertyTable$Properties$InChIKey},error=function(cond){return(NA)})
  ###############################
  ###############################
  return(tryCatch({OIK[1]},error = function(x) {return(NA)}))
  ###############################
  ###############################
}
