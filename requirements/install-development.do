# Install requirements used for development

[ -d "$VIRTUAL_ENV" ] || {
  echo "Not in virtualenv!" >&2
  exit 1
}

redo-ifchange dev.txt
pip-sync pip-tools.txt dev.txt >&2
