BEGIN{
	if(chr==1){
		printf("snpid chr pos\n") >> snp_loc_file
	}
}
{
	printf("%s chr%s %s\n",$3,chr,$4) >> snp_loc_file
	printf("%s ",$3) >> snp_file
	ng=(NF-6)/3
	for(i=1;i<=ng;i++){
		g1=$(3*i+4)
		g2=$(3*i+5)
		g3=$(3*i+6)
		if(g1<0.9 && g2<0.9 && g3<0.9){
			G="NA"
		}
		else{
			G=0
			if(g1<=g2 && g2<=g3){
				G=2
			}
			if(g1<=g2 && g2>=g3){
				G=1
			}
			if(g1>=g2 && g1>=g3){
				G=0
			}
			if(g1>=g2 && g1<=g3){
				G=2
			}
		}
		if(i<ng){
			printf("%s ",G) >> snp_file
		}
		else{	
			printf("%s\n",G) >> snp_file
		}
	}
}
