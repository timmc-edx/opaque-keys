# Strip any direct django dependencies out of a requirements file

redo-ifchange "$2.txt"
sed '/^[dD]jango==/d' "$2.txt" > $3
