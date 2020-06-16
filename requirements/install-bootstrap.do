# Install requirements used for installing and managing requirements

[ -d "$VIRTUAL_ENV" ] || {
  echo "Not in virtualenv!" >&2
  exit 1
}

redo-ifchange pip-tools.txt
pip install -r pip-tools.txt >&2
