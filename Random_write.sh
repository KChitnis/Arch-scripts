
#!/bin/bash

# CONFIGURE :
dir="/tmp/seed" # or /path/to/my/usb
# ============================================
# ============================================
mkdir -p $dir

n=0 # INIT LOOP NUMBER

function generate () {
    # remove previous base
    rm "$dir"/base

    # generate a block between 100 and 200 MB. You can use just $RANDOM for bigger interval
    b=$(( RANDOM%100+100 ))
    echo "generating base : $b MB"

    dd if=/dev/urandom of="$dir"/base bs=1m count=$b conv=noerror
}

function copy () {
    # Increment n, to generate a new file on each loop
    n=$((n + 1))
    cp "$dir"/base "$dir"/copy-$n
}

# ============================================
# LOOP
while [[ true ]]; do
    generate

    # copy N times where N is random between 100 and 200
    a=$(( RANDOM%100+100 ))
    echo "LOOP $a times for copy ..."

    for (( i = 0; i < $a; i++ )); do
        copy
        echo "Copy $i / $a."
    done
done
