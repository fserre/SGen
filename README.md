# SGen
SGen is a generator capable of producing efficient hardware designs operating on streaming datasets. “Streaming” means that the dataset is divided into several chunks that are processed during several cycles, thus allowing a reduced use of resources. The size of these chunks is referred as the streaming width. It outputs a Verilog file that can be used for FPGAs.

### Quick Start
The easiest way to use SGen is by using [SBT](https://www.scala-sbt.org/):

```
git clone https://github.com/fserre/sgen.git
cd sgen
sbt "run -n 3 wht"
```

This generates a streaming Walsh-Hadamard tranform of size 2^3=8.

### Streaming linear permutations
[Linear permutations](https://acl.inf.ethz.ch/research/hardware/perms/) can be implemented using the `lp` command:
```
# generates a bit-reversal permutation on 32 points, streamed on 2^2=4 ports.
sbt "run -n 5 -k 2 lp bitrev"

# generates a streaming datapath that performs a bit-reversal permutation on 8 points on the first dataset, and a "half-reversal" on the second dataset on 2 ports
sbt "run -n 3 -k 1 lp bitrev 100110111"
