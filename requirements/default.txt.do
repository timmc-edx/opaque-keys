# Compile a .txt requirements file from a .in dependencies file
#
# This will not work properly if only some of the .txt files have been
# removed; use `redo upgrade` rather than targeting one of these files
# directly.

redo-ifchange "$2.in"

# Declare a redo dependency on any constraints (-c) and requirements
# (-r) targets, too. (Whether or not they need to be rebuilt.)
#
# Find the lines, strip down to the path, and mark them as dependencies
grep -h -P '^-[rc]\s+([^#]+?)\s*(#.*)$' "$2.in" \
| sed 's/^-[rc]\s\+//' | sed 's/\s*\(#.*\)//' \
| sort | uniq \
| while read d; do
    redo-ifchange "$d"
done

export CUSTOM_COMPILE_COMMAND="make upgrade"
pip-compile --rebuild --upgrade -o $3 "$2.in"
