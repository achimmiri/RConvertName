getPubchemCID<-function(getNAME)
{
  ###Baicalin
  ###################################	
  url<- "http://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/"
  out<-tryCatch({jsonlite::fromJSON(paste0(url,getNAME, "/property/InChIKey"))},error = function(x) {return(NA)})
  out1<-tryCatch({jsonlite::fromJSON(paste0(url,getNAME, "/property/CanonicalSMILES"))}, error = function(x) {return(NA)})
  out2<-tryCatch({jsonlite::fromJSON(paste0(url,getNAME, "/property/InChI"))}, error = function(x) {return("NA")})
  OIN<-tryCatch({out2$PropertyTable$Properties$InChI},error=function(cond){return(NA)})
  ############# Compound CID
  OCID<-tryCatch({out1$PropertyTable$Properties$CID},error=function(cond){return(NA)})
  ##############################
  return(tryCatch({OCID[1]},error = function(x) {return(NA)}))
}
