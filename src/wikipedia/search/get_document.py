import sys



def retrieve_document(fin,title,fout):
	titleplus="title=\""+title+"\""
	print >> sys.stderr, "looking for:", titleplus 
	start=False 
	for l in fin:
		l=l.strip()
		if l.find(titleplus)>=0:
			start = True
			continue 
		if l.find("</doc>")>=0:
			start = False
		if start:
			print >> fout, l
		
		

retrieve_document(sys.stdin,sys.argv[1],sys.stdout)

