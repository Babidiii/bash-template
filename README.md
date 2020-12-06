# Bash template

## **bash-tpl**

Parsing method :

* `getopt`  
  https://man7.org/linux/man-pages/man1/getopt.1.html
* `getopts`  
  https://www.man7.org/linux/man-pages/man1/getopts.1p.html
* `bash parsing method`



## **hopt-gen**

Generate help_options functions based on one of the parsing methods chosen.  
In order to generate a bit of the help function, the parsing logic must be delimited by `BEGIN_PARAMETERS_LOOP` and `BEGIN_PARAMETERS_LOOP`.  

For example :
```bash
# ...
# BEGIN_PARAMETERS_LOOP
while [[ $# -gt 0 ]]; do
  i="${1}"
  case ${i} in
    -p|--parse)
      # logic
      shift
      ;;
    -h|--help) 
      help_options && exit 0
      shift
      ;;
    -o|--output)
      output="${2}"
      shift 2
      ;;
    *) 
      printf "Unknown parameter passed: %s\n" "${1}" 1>&2
      usage
      exit 1
      ;;
  esac
done
# END_PARAMETERS_LOOP
# ...
```

Will show the following outuput :
```bash
help_options(){
        printf "Options : \n"
        printf "\t-p, --parse   command description \n"
        printf "\t-h, --help    command description \n"
        printf "\t-o, --output  command description \n"
}
```

Where *command description* could be changed for any other description related to the option.


# Upgrade

* hopt-gen
  * Merge output of hopt-gen inside the code 
  * Add sections of options with specifics Keyword as comment inside de PARAMETERS_LOOP in order to enhanced the help_options functions output.
* bash-tpl
  * Add `getopts` parsing method implementation
  * Possibility to add personnal templates
  * Add options in order to add colors/text decorations in the output of the script with import of color script.

* Optional
  * TUI with templates/features selections 

