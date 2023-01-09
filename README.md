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

> This repository is a development repository, see `code/use.ipynb` for a usage example
>
> Subsequent major releases will also be merged into the toolkit [pynlfff](https://github.com/deepsolar/pynlfff).



## Algorithm

The original CPU version code was Wiegelmann(`wiegelmann@mps.mpg.de`) [NLFFF](https://doi.org/10.1007/s11207-012-9966-z) extrapolation algorithm

```tex
@article{Wiegelmann2012Nov,
    author = {Wiegelmann, T. and Thalmann, J. K. and Inhester, B. and Tadesse, T. and Sun, X. and Hoeksema, J. T.},
    title = {{How Should One Optimize Nonlinear Force-Free Coronal Magnetic Field Extrapolations from SDO/HMI Vector Magnetograms?}},
    journal = {Sol. Phys.},
    volume = {281},
    number = {1},
    pages = {37--51},
    year = {2012},
    month = nov,
    issn = {1573-093X},
    publisher = {Springer Netherlands},
    doi = {10.1007/s11207-012-9966-z}
}
```

The GPU version of NLFFF was here

```tex
@misc{Zhang2022,
  author = {Xinze, Zhang},
  title = {The cuda version for nlfff},
  year = {2022},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/deepsolar/nlfff_gpu}},
  commit = {83d83f6ade2bc0eed429e1f90ee39636460bbedc}
}
```



## Contact

GPU Author: Xinze Zhang (`zhangxinze17@mails.ucas.ac.cn`)

Community: https://gitter.im/deepsolar/pynlfff




