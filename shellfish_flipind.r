remove_snp_mismatch<-function(file1='UBIOPREDAX_355_samples_gt.map',file2='pop4_355_snpload.snpload.map'){
	ubio.map<-read.table(file1,stringsAsFactors=F,sep="\t")
	kg.map<-read.table(file2,stringsAsFactors=F,sep="\t")
	ubio.snpid<-ubio.map[[2]]
	kg.snpid<-kg.map[[2]]

	if(identical(ubio.snpid,kg.snpid)){
		ubio.map.allele<-as.matrix(ubio.map[,5:6])
		kg.map.allele<-as.matrix(kg.map[,5:6])
		match<-sapply(1:nrow(ubio.map.allele),function(i)setequal(ubio.map.allele[i,],kg.map.allele[i,]))
		write.table(ubio.snpid[match],'shellfish_mismatch_prune.list',row.names=F,col.names=F,quote=F)
		return(ubio.snpid[match])
	}
}
