# nlfff_gpu

> [A Large-Scale Nonlinear Force-Free Field Three-Dimensional Magnetic Fields Data of Solar Active Regions](https://nlfff.dataset.deepsolar.space)

We deploy a cuda version for nlfff. Then we do experiments with RTX 3090, which has achieved 800x times faster speed than CPU. The gpu-memory should be 4x times larger than the size of output 3D data.

## Usage
run code/use.ipynb script, which include:
- prepare input magnetic vector data (we provide a input sample in data/raw)
- compile code
- prepare boundary data
- run grid1, grid2, grid3
- run quality checking
- check output files (we provide a output sample in data/pro)
