This repository is intended for Lean users who would like to
experiment with the current state of the automatic port of Mathlib3 to Lean4.
Please expect everything to be horribly broken. :-)

Clone this repository, then run `make`.
This will download a large file
containing the artifacts from `binport` and `synport`,
and compile everything.

(You can also run `make clean`, `make download-release` and `make build`
separately.)

After running `make`, open this folder in VSCode, and open `Testdep.lean`.
You should be in a Lean environment with access to the current automatic
port of Mathlib3 to Lean4.