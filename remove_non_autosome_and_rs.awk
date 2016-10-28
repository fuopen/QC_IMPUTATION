##################
### input file should be the bim file

BEGIN{
	FS="\t"
}

{
	if($1<=22 && $1>0 && $2 ~ /^rs/){
		print $2
	}
}
