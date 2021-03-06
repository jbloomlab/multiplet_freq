#!/bin/bash
# 
# run Jupyter notebook and compile paper

set -e

NB="calcmultiplet.ipynb"
R_NB="calcmultiplet_R.ipynb"
PAPER="paper"

jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=-1 $NB
jupyter nbconvert $NB --to html
jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=-1 $R_NB
jupyter nbconvert $R_NB --to html

latex $PAPER && bibtex $PAPER && latex $PAPER && latex $PAPER
