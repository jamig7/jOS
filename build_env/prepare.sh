echo "Dist Root: ${DIST_ROOT:?}"
echo "LFS variable: ${LFS:?}"

read -p "Continue? (y/n) " -n 1 -r
echo
[[ ! $REPLY =~ ^[Nn]$ ]] || { exit 1; }

mkdir -v $LFS/sources

for f in $(cat $DIST_ROOT/build_env/wget-list)
do
    bn=$(basename $f)

    if ! test -f $LFS/sources/$bn ; then
        wget $f -O $LFS/sources/$bn
    fi
done;