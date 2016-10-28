BEGIN{
	FS="\t"
	OFS="\t"
}

NR>1{
	print chr,$2,$4,$15,$16,$17,$18,$19
}
