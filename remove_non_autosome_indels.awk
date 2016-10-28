##################
### input file should be the bim file

BEGIN{
	FS="\t"
}

{
	if($1<=22 && $1>0 && $2 ~ /^rs/){
		if(length($5)==1 && length($6)==1){
			if($5!="-" && $6!="-"){
				if($5!="0" && $6!="0"){
					print $2
				}
			}
		}
	}
}
