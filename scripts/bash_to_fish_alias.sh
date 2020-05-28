## copy the aliases to the fish config file
cat ./bash/bash_aliases > ./fish/config.fish

## extract the names of the functions
awk -F= '!/^#/ { print $1 }' ~/.bash_aliases | awk '{ print $2 }' > funcnames.temp

## save all the aliases as native fish functions
for funcname in (cat funcnames.temp)
    funcsave $funcname
end

## remove the temporary files
rm funcnames.temp
