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

if [ $1 == "restart" ];
then
  i3-msg restart
elif [ $1 == "reload" ];
then
  i3-msg reload
elif [ $1 == "exit" ];
then
  i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'
fi
