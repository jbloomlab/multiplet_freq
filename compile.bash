#!/bin/bash
# 
# run Jupyter notebook and compile paper

set -e

NB="calcmultiplet.ipynb"
PAPER="paper"

jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=-1 $NB
jupyter nbconvert $NB --to html

latex $PAPER && bibtex $PAPER && latex $PAPER && latex $PAPER
