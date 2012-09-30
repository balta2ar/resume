#!/usr/bin/env bash

# This build script does two things:

#CMD=pdflatex
CMD=xelatex

# 1. Compile the pdfs (to output/) and copy back the results
if command -v $CMD >/dev/null 2>&1; then
  mkdir -p output;
  mkdir -p pdf;
  for f in *-resume.tex; do
    $CMD -output-directory output $f
    pdf=output/${f%.tex}.pdf; [ -e $pdf ] && mv $pdf ./pdf/;
  done;
else
  echo "Could not find XeLaTeX, skipping PDF generation.";
  echo "See the README.md file for instructions on installing XeLaTeX or how to generate the PDF online.";
fi

# 2. Make combined versions
mkdir -p combined
for f in *-resume.tex; do
  sed '/\\include{resume-commands}/{
    s/\\include{resume-commands}//g
    r resume-commands.tex
  }' $f > combined/$f;
  sed -i '1i%%%% GENERATED FILE - MODIFICATIONS MAY BE LOST %%%%' combined/$f;
  echo; echo "build.sh: combined/$f generated"; echo;
done
