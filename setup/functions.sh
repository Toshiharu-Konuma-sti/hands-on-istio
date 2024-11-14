
call_own_fname()
{
	OFNM=$(basename $0)
	echo "$OFNM"
}

# $1: Current directory (setup)
call_path_of_experience()
{
	TARGET=$(realpath $1/../try-my-hand)
	echo "$TARGET"
}

# {{{ call_show_start_banner()
# $0: the name of the script being executed 
call_show_start_banner()
{
	echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n> START: Script = [$(call_own_fname)]\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
}
# }}}

# {{{ call_show_finish_banner()
# $0: the name of the script being executed 
call_show_finish_banner()
{
	echo "\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n< FINISH: Script = [$(call_own_fname)]\n<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
}
# }}}


