# Virtual target so that constraints.txt isn't interpreted as a
# requirements output file.

cat constraints.txt
redo-stamp < constraints.txt
