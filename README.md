
# 📦 SGen – Streaming Signal‑Processing Generator

<p align="center">
  <img src="img/sgen.png" alt="SGen logo" width="300"/>
</p>

SGen is a generator that produces compact, high‑performance hardware designs for a variety of signal‑processing transforms. All generated modules work on *streaming data*: the dataset is split into *chunks* that are processed over several cycles, thus allowing a reduced use of resources. The size of these chunks is called the *streaming width*.

As an example, the figures below represent three discrete Fourier transforms on 8 elements, with a streaming width of 8 (no streaming), 4 and 2.

<p style="display:flex;justify-content:center;">
  <img src="img/dft8basic.svg"   alt="FFT 8‑point, no streaming"   style="margin:0 20px;">
  <img src="img/dft8s4basic.svg" alt="FFT 8‑point, streaming width = 4" style="margin:0 20px;">
  <img src="img/dft8s2basic.svg" alt="FFT 8‑point, streaming width = 2" style="margin:0 20px;">
</p>

The generator emits a Verilog file ready to be synthesised on any FPGA.

* 📄 **Technical overview** – https://acl.inf.ethz.ch/research/hardware
* 🐞 **Bug reports / feature requests** – contact [F. Serre](https://fserre.github.io/)

---

## 🚀 Quick start (requires Java 8+)

1. Download the latest `sgen.bat` from the releases page.  

2. Open a terminal in the folder containing `sgen.bat` and run:

```bash
# Windows
sgen.bat -n 3 wht

# Linux
./sgen.bat -n 3 wht
```

The command above generates a streaming Walsh‑Hadamard transform on `2³ = 8` points.

---

## 🖥️ Command‑line interface

A SGen command line consists of a list of *options* followed by the name of the *transform* you want to generate:

```bash
sgen.bat [options] <transform‑name> [lp matrices...]
```

### Options

| Option | Argument | Meaning                                                                                                                                                                  |
|--------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-n`   | `<n>`    | **Required** – `log₂` of the transform size (e.g. `-n 3` → 8 elements).                                                                                                  |
| `-k`   | `<k>`    | `log₂` of the *streaming width*. `-k 2` ⇒ 4 input / output ports, one transform every `2^(n‑k)` cycles. Omit for *full‑parallel* (one port per data element).            |
| `-r`   | `<r>`    | `log₂` of the radix (used by DFT/WHT). Must divide `n`. For compact designs (`*compact`) it must also satisfy `r ≤ k`. If omitted, the highest possible radix is chosen. |
| `-sf`  | `<sf>`   | Scaling factor for DFTs (applied at every stage). Example: `-sf 0.5 idft`.                                                                                               |
| `-o`   | `<file>` | Output file name.                                                                                                                                                        |
| `-benchmark` | – | Adds a benchmark module in the generated design.                                                                                                                         |
| `-rtlgraph`  | – | Emits a [DOT](https://en.wikipedia.org/wiki/DOT_(graph_description_language)) graph of the generated RTL.                                                                |
| `-dualramcontrol` | – | Uses independent read/write addresses (uses more resources, but offers more flexibile timing constraints). Implicitly enabled for `*compact` designs.                    |
| `-singleported`   | – | Uses single‑ported RAM (read = write address). May increase latency.                                                                                                     |
| `-zip`   | – | Packs the design and all dependencies (e.g. FloPoCo modules) into a zip archive.                                                                                         |
| `-hw`   | `<repr>`| Hardware arithmetic representation of the input data (see the table below).                                                                                              |

#### Hardware data‑type (`-hw`)

| Token | Description                                                                                                                                                         |
|-------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `fixedpoint <int> <frac>` | Signed fixed‑point: `<int>` integer bits, `<frac>` fractional bits.                                                                                                 |
| `signed <size>`   | Signed integer of `<size>` bits (alias of `fixedpoint <size> 0`).                                                                                                   |
| `char`, `short`, `int`, `long` | Signed integers of 8, 16, 32, 64 bits. Equivalent of `signed ?`.                                                                                                    |
| `unsigned <size>` | Unsigned integer of `<size>` bits.                                                                                                                                  |
| `uchar`, `ushort`, `uint`, `ulong` | Unsigned integers of 8, 16, 32, 64 bits. Equivalent of `signed ?`.                                                                                                  |
| `ieee754 <wE> <wF>` | IEEE‑754 format built on top of FloPoCo operators. Unless otherwise specified when generating FloPoCo operators, denormal numbers are flushed to zero.              |
| `float`, `double`, `half` | IEEE‑754 single, double and half precision. Equivalent of `ieee754 ? ?`.                                                                                            |
| `minifloat` | 8‑bit floating‑point (4‑bit exponent, 3‑bit mantissa). Equivalent of `ieee754 4  3`.                                                                                |
| `bfloat16` | Brain‑float 16 (8‑bit exponent, 7‑bit mantissa). Equivalent of `ieee754 8  7`.                                                                                      |
| `flopoco <wE> <wF>` | [FloPoCo](http://flopoco.gforge.inria.fr/) floating‑point (exponent =`wE`, mantissa =`wF`). Requires the corresponding FloPoCo VHDL files in the `flopoco/` folder. |
| `complex <repr>` | Cartesian complex number, each component encoded with `<repr>` and concatenated.                                                                                    |

---

### Supported transforms

| Category                                                                | Command                | Example |
|-------------------------------------------------------------------------|------------------------|---------|
| [Linear permutations](https://acl.inf.ethz.ch/research/hardware/perms/) | `lp`                   | `sgen.bat -n 5 -k 2 lp bitrev` |
| **DFT (full‑throughput / compact)**                                     | `dft` / `dftcompact`   | `sgen.bat -n 4 -k 2 -hw complex fixedpoint 8 8 dft` |
| **Inverse DFT (full‑throughput / compact)**                             | `idft` / `idftcompact` | `sgen.bat -n 10 -k 3 -hw complex fixedpoint 8 8 idft` |
| **Walsh‑Hadamard (full‑throughput / compact)**                          | `wht` / `whtcompact`   | `sgen.bat -n 6 -k 3 -hw fixedpoint 8 8 wht` |
| **Inverse WHT (full‑throughput / compact)**                                                        | `iwht` / `iwhtcompact` | `sgen.bat -n 6 -k 3 -hw fixedpoint 8 8 iwht` |

#### Linear permutations (`lp`)

`lp` expects an *invertible bit‑matrix* (row‑major order) that describes the permutation.  
Convenient shortcuts:

| Shortcut | Meaning |
|----------|---------|
| `bitrev` | Bit‑reversal permutation. |
| `identity` | No change. |

Multiple matrices can be listed, separated by spaces. The *i‑th* matrix will be applied to the *i‑th* incoming dataset. 

This design allows *full‑throughput* pipelines (no idle cycles between datasets). See [this publication](https://fserre.github.io/publications/pdfs/fpga2016.pdf) for details.

#### Example: streaming bit‑reversal

```bash
# 32‑point bit‑reversal, streamed on 4 ports (k=2)
sgen.bat -n 5 -k 2 lp bitrev

# 8‑point bit‑rev on odd datasets, a custom “half‑rev” on evens.
sgen.bat -n 3 -k 1 lp bitrev 100110111
```
---

#### Full-throughput and compact designs
- **Full-thoughput** designs allow to perform the transform without any delay between two datasets.

- **Compact** designs have an architecture that reuses several times the same hardware. They require however a delay between two transforms (see generated description).

---

### RAM‑control strategies

When `n > k` (i.e. the design is streamed), memory blocks are required.  
Choose the most suitable control scheme with the corresponding flag:

| Mode | Flag | Behaviour                                                | Resource / Flexibility trade‑off                                                                                                                                                                                            |
|------|------|----------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Dual‑RAM control** | `-dualramcontrol` | Independent read & write address generators.             | Highest flexibility (datasets can start at any time). Implicit for `*compact` designs.                                                                                                                    |
| **Single‑RAM control** (default) | – | Write address = read address delayed by a constant time. | Fewer resources, but a new dataset must follow the previous one immediately or wait until the previous dataset has completely left the first stage of the pipeline. This is the default mode (except for compact designs).  |
| **Single‑ported RAM** | `-singleported` | Read = write address (single port).                      | Same constraints as single‑RAM control, potentially higher latency.                                                                                                                                                         |

---

### Packaging

Add `-zip` to obtain a zip archive containing:

* The generated Verilog file.
* All required FloPoCo VHDL modules (if any).
* Optional benchmark.

---
