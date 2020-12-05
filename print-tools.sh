#!/usr/bin/env bash

clear_line () {
  printf '\r\033[2K'
}

move_cursor_up () {
  printf '\033[1A'
}

set_font () {
	case "${1,,}" in

    #FOREGROUND COLOR
		39|defaultfg) printf "\e[39m";;
		30|blackfg|black) printf "\e[30m";;
		31|redfg|red) printf "\e[31m";;
		32|greenfg|green) printf "\e[32m";;
		33|yellowfg|yellow) printf "\e[33m";;
		34|bluefg|blue) printf "\e[34m";;
		35|magentafg|magenta) printf "\e[35m";;
		36|cyanfg|cyan) printf "\e[36m";;
		37|lightgrayfg|lightgray|"light gray") printf "\e[37m";;
		90|darkgrayfg|darkgray|"dark gray") printf "\e[90m";;
		91|lightredfg|lightred|"light red") printf "\e[91m";;
		92|lightgreenfg|lightgreen|"light green") printf "\e[92m";;
		93|lightyellowfg|lightyellow|"light yellow") printf "\e[93m";;
		94|lightbluefg|lightblue|"light blue fg") printf "\e[94m";;
		95|lightmagentafg|lightmagenta|"light magenta fg") printf "\e[95m";;
		96|lightcyanfg|lightcyan|"light cyan fg") printf "\e[96m";;
		97|whitefg|white) printf "\e[97m";;

    #BACKGROUND COLOR
    49|defaultbg) printf "\e[49m";;
		40|blackbg) printf "\e[40m";;
		41|redbg) printf "\e[41m";;
		42|greenbg) printf "\e[42m";;
		43|yellowbg) printf "\e[43m";;
		44|bluebg) printf "\e[44m";;
		45|magentabg) printf "\e[45m";;
		46|cyanbg) printf "\e[46m";;
		47|ligthgraybg|"light gray bg") printf "\e[47m";;
		100|darkgraybg|"dark gray bg") printf "\e[100m";;
		101|ligthredbg|"light red bg") printf "\e[101m";;
		102|ligthgreenbg|"light green bg") printf "\e[102m";;
		103|ligthyellowbg|"light yellow bg") printf "\e[103m";;
		104|ligthbluebg|"light blue bg") printf "\e[104m";;
		105|ligthmagentabg|"light magenta bg") printf "\e[105m";;
		106|ligthcyanbg|"light cyan bg") printf "\e[106m";;
		107|whitebg) printf "\e[107m";;

    #ATTRIBUTES SETTERS
		1|bold|bright) printf "\e[1m";;
		2|dim) printf "\e[2m";;
		4|underlined) printf "\e[4m";;
		5|blink) printf "\e[5m";;
		7|reverse|swap) printf "\e[7m";;
		8|hidden) printf "\e[8m";;

    #ATTRIBUTES UNSETTERS
		0|reset|default) printf "\e[0m";;
		21|unbold|bright) printf "\e[21m";;
		22|undim) printf "\e[22m";;
		24|ununderlined) printf "\e[24m";;
		25|unblink) printf "\e[25m";;
		27|unreverse|unswap) printf "\e[27m";;
		28|unhidden) printf "\e[28m";;

    #MANUAL OR FAIL
		*)
			#missing numbers are: 3, 6, 9, 10:21, 23, 26, 29, 38, 48, 50:90, 98:100, 108: (seem to have no effect)
			if [[ "$1" =~ '[0-9]\+' ]]; then
				printf "\e[$1m"
			else
				#RESET ALL
				printf "\e[39m\e[49m\e[0m"
				[[ -n "$1" ]] && return -1
			fi;;
	esac
	shift
	[[ -n "$1" ]] && set_font $@ || true
}
