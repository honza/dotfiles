QMK_TREE=~/code/qmk_firmware

pushd $QMK_TREE || exit

make planck/rev6:honza

popd || exit
