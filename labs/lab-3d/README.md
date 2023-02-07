## Lab-3d: Development of the MyDNACryptographyPackage

### Objective
The objective of `Lab-3d` is to develop the `MyDNACryptographyPackage` package which exports two functions:
* The `encyrpt` function takes a plaintext string and returns an encrypted message, where the `encryptionkey` used is the DNA encryption key of [Bancroft and coworkers](https://pubmed.ncbi.nlm.nih.gov/10376592/)
* The `decrypt` function takes the encrypted text and returns the plaintext message. 

### Tasks
1. Implement the `encrypt` function
1. Implement the `decrypt` function 
1. Test the `MyDNACryptographyPackage` functionality using sample text messages

### Additional resources
The DNA encryption key used in this study was taken from:
* [Clelland CT, Risca V, Bancroft C. Hiding messages in DNA microdots. Nature. 1999 Jun 10;399(6736):533-4. doi: 10.1038/21092. PMID: 10376592.](https://pubmed.ncbi.nlm.nih.gov/10376592/)