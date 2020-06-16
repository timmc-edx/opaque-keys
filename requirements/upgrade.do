# Rebuild all .txt files whether they need it or not

# Handle pip-tools specially, since the result of upgrading it can
# affect dependency resolution. Make sure we converge on a pip-tools
# version that no longer changes its mind about what pip-tools to
# install.
cp pip-tools.txt pip-tools.txt.tmp-old
ok=
for i in $(seq 5); do
    redo-ifchange install-bootstrap
    rm pip-tools.txt
    redo pip-tools.txt

    if diff pip-tools.txt pip-tools.txt.tmp-old >/dev/null; then
        ok=yes # converged!
        break
    fi
    echo "pip-tools.txt changed, reupgrading it (try #$i)" >&2
    cp pip-tools.txt pip-tools.txt.tmp-old
done

if [ "$ok" = "" ]; then
    echo "$0: fatal: pip-tools.txt did not converge!" >&2
    exit 1
fi
rm pip-tools.txt.tmp-old


# Find all .txt files with corresponding .in files (except pip-tools)
normal_output_files() {
    for input in *.in; do
        # pip-tools is handled specially
        if [ "$input" != "pip-tools.in" ]; then
            echo "${input%.in}.txt"
        fi
    done
}

# Delete the outputs and rebuild them all as a batch
rm -f -- `normal_output_files`
redo-ifchange `normal_output_files`
