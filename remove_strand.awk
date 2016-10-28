BEGIN{
	FS="\t"
	OFS="\t"
}
{
	if(($5=="A"||$5=="T") && ($6=="C"||$6=="G")){
		print $2
	}else if(($5=="A"||$5=="T") && ($6=="C"||$6=="G")){
		print $2
	}else{
		next
	}
}
