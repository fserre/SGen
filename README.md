# sgen
SGen is a generator capable of producing efficient hardware designs operating on streaming datasets. “Streaming” means that the dataset is divided into several chunks that are processed during several cycles, thus allowing a reduced use of resources. The size of these chunks is referred as the streaming width. It outputs a Verilog file that can be used for FPGAs.
