This repository is no longer in use. Please see https://github.com/leanprover-community/mathport
for instructions on using mathport and its downloadable artifacts.

----

This repository is intended for Lean users who would like to
experiment with the current state of the automatic port of Mathlib3 to Lean4.
Please expect everything to be horribly broken. :-)

Clone this repository, then run `make`.
This will download a large file
containing the artifacts (both `.olean` files and synported `.lean` files),
and compile everything.

(You can also run `make clean`, `make download-release` and `make build`
separately.)

After running `make`, open this folder in VSCode, and open `Testdep.lean`.
You should be in a Lean environment with access to the current automatic
port of Mathlib3 to Lean4.
