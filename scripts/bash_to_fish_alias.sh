## extract the names of the functions
awk -F= '!/^#/ { print $1 }' ~/.bash_aliases | awk '{ print $2 }' > funcnames.temp
## extract the bodies of the functions
awk -F= '!/^#/ { print $2 }' ~/.bash_aliases |awk -F# '{ print $1 }' > funcs.temp

## remove the temporary files
rm funcnames.temp
rm funcs.temp
