p.out<-read.table('ubio_outlier_sample.list',stringsAsFactors=F)
p<-read.table('old.UBIOPREDAX.fam',stringsAsFactors=F,sep='\t')
p.info<-read.table('UBIOPREDAX_Sample_Table.csv',stringsAsFactors=F,header=T,set=",")
p.info<-read.table('UBIOPREDAX_Sample_Table.csv',stringsAsFactors=F,header=T,sep=",")
p$order<-1:nrow(p)
merge(p,p.info[,c('Sample.Name','subjid',"Best.Array")],by.x='V2',by.y="Best.Array")
merge(p,p.info[,c('Sample.Name','subjid',"Best.Array")],by.x='V2',by.y="Best.Array")->p.new
p.new[[1]]<-p.new[[2]]
p.new[[2]]<-ifelse(grepl('^[A|P]',p.new$subjid),p.new$subjid,paste(p.new$Sample.Name,p.new$subjid,sep="_"))
write.table(p.new[,1:6],'UBIOPREDAX.fam',row.names=F,col.names=F,quote=F,sep="\t")
p.new.preserve<-p.new.preserve[grepl('^[A|P]',p.new.preserve[[2]]),]
write.table(p.new.preserve,'UBIOPREDAX_filter_individual.fam',row.names=F,col.names=F,quote=F,sep="\t")
sp.info<-read.table('/home/sile/wd/project/UBIO-asthma/eQTL/shared_preprocessing_data/SAMPLE_ID_INFO.txt',stringsAsFactors=F)
compare<-read.table('/home/sile/wd/raw_data/UBIOPREDAX/UBIOPRED-genotype-files/UBIOPRED-filtered-sample-SNP-clean.fam',stringsAsFactors=F,header=F)
v<-merge(compare,sp.info,by='V2')
v.id<-v$V1.y
p.id<-p.new.preserve[[2]]
require(aberrant)
ubio.proj<-read.table('ubio_shellfish_proj.txt',stringsAsFactors=F,header=F)
kg.proj<-read.table('/home/sile/wd/raw_data/1000GP/pop4_rvcf/shellfish2/shellfish.proj',stringsAsFactors=F)
ubio.sp.info<-read.table('/home/sile/wd/raw_data/1000GP/pop4_rvcf/for_shellfish/geno/pop4_355sample.txt',stringsAsFactors=F)
kg.sp.info<-ubio.sp.info
ubio.sp.info<-read.table('UBIOPREDAX.fam',stringsAsFactors=F)
ubio.sp.info<-ubio.sp.info[[2]]
ubio.proj.abber<-t(ubio.proj[1:2,])
kg.proj.abber<-t(kg.proj[1:2,])/40000
ubio.proj.abber<-t(ubio.proj[1:2,])/40000
kg.proj.ceu<-kg.proj.abber[kg.sp.info[[2]]=='CEU',]
all.combine<-rbind(kg.proj.abber,ubio.proj.abber)
ceu.combine<-rbind(kg.proj.ceu,ubio.proj.abber)
outlier.all<-aberrant(all.combine[,1],all.combine[,2],lambda=20)
outlier.all<-aberrant(all.combine,lambda=20)
all.combine$group<-outlier.all$group
all.combine<-rbind(kg.proj.abber,ubio.proj.abber)
all.detect<-as.matrix(all.combine)
all.detect$group<-outlier.all$group
all.detect$id<-c(kg.sp.info[[1]],ubio.sp.info)
all.detect$pop<-c(kg.sp.info[[2]],rep('ubio',length(ubio.sp.info))
)
colnames(all.detect)[1:2]<-c('PC1','PC2')
ceu.detect<-aberrant(ceu.combine,lambda=20)
outlier.ceu<-ceu.detect
ceu.detect<-as.data.frame(ceu.combine)
ceu.detect$group<-outlier.ceu$group
ceu.detect$id<-c(kg.sp.info[kg.sp.info[[2]]=='CEU',1],ubio.sp.info)
ceu.detect$pop<-c(kg.sp.info[kg.sp.info[[2]]=='CEU',2],rep('ubio',length(ubio.sp.info)))
colnames(ceu.detect)[1:2]<-c('PC1','PC2')
ubio.outlier.byall<-all.detect[all.detect$group=='1' & all.detect$pop='ubio',]
ubio.outlier.byall<-all.detect[all.detect$group=='1' & all.detect$pop=='ubio',]
ubio.outlier.byceu<-all.detect[ceu.detect$group=='1' & ceu.detect$pop=='ubio',]
all.detect[ceu.detect$group=='1' & ceu.detect$pop=='CEU',]
all.detect[all.detect$group=='1' & all.detect$pop=='CEU',]
write.table(ceu.detect,'outlier_detected_by_ceu.txt',row.names=F,col.names=T,sep="\t",quote=F)
write.table(all.detect,'outlier_detected_by_all.txt',row.names=F,col.names=T,sep="\t",quote=F)
all(ubio.outlier.byceu[[4]] %in% ubio.outlier.byall[[4]])
ubio.outlier.byall<-all.detect[all.detect$group=='1' & all.detect$pop=='ubio',]
ubio.outlier.byceu<-ceu.detect[ceu.detect$group=='1' & ceu.detect$pop=='ubio',]
setdiff(ubio.outlier.byceu[,4],ubio.outlier.byall[,4])
all(ubio.outlier.byceu[[4]] %in% ubio.outlier.byall[[4]])
table(sp.info$V5)
compare[!compare[[2]] %in% sp.info[[2]],]
v<-read.table('UBIOPREDAX_Sample_Table.csv',sep=',',header=T,stringsAsFactors=F)
v<-v[,c('Sample.Name','subjid')]
old.sample.info<-merge(compare,v,by.x='V2',by.y='Sample.Name')
old.sample.id<-old.sample.info$subjid
write.table(old.sample.id,'old_QC_sample_id.txt',row.names=F,col.names=F,quote=F)
q(save='yes')
sp.info<-read.table('UBIOPREDAX_ceu_pca.fam',stringsAsFactors=F,sep="\t")
sp.info<-read.table('UBIOPREDAX_ceu_pca.fam',stringsAsFactors=F)
sp.info<-sp.info[[2]]
require(aberrant)
pc12<-aberrant(pcs[,1],pcs[,2],lambda=20)
pc12<-aberrant(pcs[,1:2],lambda=20)
pc12<-aberrant(pcs[,1:2],lambda=40)
pc12<-aberrant(pcs[,1:2],lambda=10)
pc12<-aberrant(pcs[,1:2],lambda=50)
pc12<-aberrant(pcs[,1:2],lambda=80)
pc34<-aberrant(pcs[,3:4],lambda=50)
pc34<-aberrant(pcs[,3:4],lambda=250)
pc34<-aberrant(pcs[,3:4],lambda=500)
pc56<-aberrant(pcs[,5:6],lambda=250)
pdf('ceu_pca2.pdf')
for(i in 1:9){
	plot(pcs[,i],pcs[,i+1],col='red',xlab=paste0('PC',i),ylab=paste0('PC',i+1))
	text(pcs[,i],pcs[,i+1],sp.info,col='blue',cex=0.6)
}
dev.off()

pc23<-aberrant(pcs[,2:3],lambda=50)
pc45<-aberrant(pcs[,4:5],lambda=50)
pc67<-aberrant(pcs[,6:7],lambda=50)
pc78<-aberrant(pcs[,7:8],lambda=50)
pc89<-aberrant(pcs[,8:9],lambda=50)
pc89<-aberrant(pcs[,8:9],lambda=20)
pc910<-aberrant(pcs[,9:10],lambda=20)
outlier.all<-unique(c(pc12,pc23,pc34,pc45,pc56,pc67,pc78,pc89,pc910))
outlier.all<-unique(c(pc12$outlier,pc23$outlier,pc34$outlier,pc45$outlier,pc56$outlier,pc67$outlier,pc78$outlier,pc89$outlier,pc910$outlier))
q(save='yes')

imiss<-read.table('UBIOPREDAX_missing.imiss',stringsAsFactors=F,header=T)
het<-read.table('UBIOPREDAX_het.het',stringsAsFactors=F,header=T)
install.packages('genoplotter')
source("https://bioconductor.org/biocLite.R")
biocLite("geneplotter")
library("geneplotter")
colors  <- densCols(imiss$logF_MISS,het$meanHet)
imiss$logF_MISS = log10(imiss[,6])
het$meanHet = (het$N.NM. - het$O.HOM.)/het$N.NM.
colors  <- densCols(imiss$logF_MISS,het$meanHet)

pdf('heterozygosity_missing.pdf')
plot(imiss$logF_MISS,het$meanHet, col=colors,xlim=c(-3,-1),ylim=c(0.14,0.20),pch=20, xlab="Proportion of missing genotypes", ylab="Heterozygosity rate")
abline(h=mean(het$meanHet)-(3*sd(het$meanHet)),col="RED",lty=2)
abline(h=mean(het$meanHet)+(3*sd(het$meanHet)),col="RED",lty=2)
abline(v=-1.522879,col='red',lty=2)
ubiopredax.info<-read.table('UBIOPREDAX.fam',stringsAsFactors=F)
text(imiss$logF_MISS,het$meanHet,ubiopredax.info[[2]],cex=0.5,col='red')
dev.off()

imiss.628<-imiss[ubiopredax.info[[2]] %in% sp.info,]
het.628<-het[ubiopredax.info[[2]] %in% sp.info,]
het.cor<-lm(het.628$meanHet ~ pcs[,1]^2+pcs[,2]^2+pcs[,3]^2+pcs[,4]^2+pcs[,1]+pcs[,2]+pcs[,3]+pcs[,4]+pcs[,1]*pcs[,2]+pcs[,1]*pcs[,3]+pcs[,1]*pcs[,4]+pcs[,2]*pcs[,3]+pcs[,2]*pcs[,4]+pcs[,3]*pcs[,4])
homo<-read.table('UBIOPREDAX_homozyg.hom.indiv',stringsAsFactors=F,header=T)
pdf('homo_vs_miss.pdf')
plot(homo$KB,het$meanHet,pch=20,col=colors,xlab='total length_of ROH segments(kb)',ylab='heterozygosity')
text(homo$KB,het$meanHet,ubiopredax.info[[2]],cex=0.6,col='red')
dev.off()
imist$logitF_MISS<-log(imiss$[,6]/(1-imiss[,6]))
imist$logitF_MISS<-log(imiss[,6]/(1-imiss[,6]))
imiss$logitF_MISS<-log(imiss[,6]/(1-imiss[,6]))
