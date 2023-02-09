## Lab-3d: Development of the MyDNACryptographyPackage

### Objective
The objective of `Lab-3d` is to develop the `MyDNACryptographyPackage` package, which exports two functions:
* The `encrypt` function takes a plaintext string and returns an encrypted message, where the `encryptionkey` used is the DNA encryption key of [Bancroft and coworkers](https://pubmed.ncbi.nlm.nih.gov/10376592/)
* The `decrypt` function takes the encrypted text and returns the plaintext message. 

### Tasks
1. Analyze the overall module structure and determine what each file is doing
1. Analyze the `DNAEncryptionKey` instance constructed in the `build` function in `Factory.jl`
1. Implement the `encrypt` function: takes a plain text string and returns an encrypted data structure
1. Implement the `decrypt` function: takes an encrypted data structure and returns a plain text string
1. Test the `MyDNACryptographyPackage` functionality using sample text messages, e.g., `This is a test`.

### Additional resources
The DNA encryption key used in this study was taken from:
* [Clelland CT, Risca V, Bancroft C. Hiding messages in DNA microdots. Nature. 1999 Jun 10;399(6736):533-4. doi: 10.1038/21092. PMID: 10376592.](https://pubmed.ncbi.nlm.nih.gov/10376592/)