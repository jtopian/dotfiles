#!/usr/bin/bash

i3dir=$HOME/.config/i3
cfgdir=$i3dir/conf.d
cfgfile=$i3dir/config
confs=$cfgdir/*.conf

#echo ${confs[@]}

echo > $cfgfile

for file in ${confs[@]};
do
	cat $file >> $cfgfile
done
