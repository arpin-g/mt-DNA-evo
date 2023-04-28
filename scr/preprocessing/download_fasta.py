//downloading files from NCBI 


from Bio import SeqIO
from Bio import Entrez

for i in range(355, 496):
    Entrez.email = "syuzi.matevosyan1802@gmail.com"
    filename = "MK491" + str(i) + ".fasta"
    if not os.path.isfile(filename):
        # Downloading...
        net_handle = Entrez.efetch(
            db="nucleotide", id="MK491" + str(i), rettype="fasta", retmode="text"
        )
        out_handle = open(filename, "w")
        out_handle.write(net_handle.read())
        out_handle.close()
        net_handle.close()
        print("Saved MK491", i)

#print("Parsing...")
#record = SeqIO.read(filename, "fasta")
#print(record)
