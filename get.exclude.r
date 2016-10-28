get.exclude<-function(snp.info,exclude.list){
	a<-if((snp.info[[1]] %in% exclude.list[[1]]) && any(snp.info[[4]]>=exclude.list[exclude.list[[1]]==snp.info[[1]],2] & snp.info[[4]]<=exclude.list[exclude.list[[1]]==snp.info[[1]],3])) 1 else 0
	return(a)
}
