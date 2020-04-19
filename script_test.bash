#!/bin/bash

printf "\e[38;5;196m"
echo "     @@@    @@@@@@    @@@@@@   @@@  @@@     @@@@@@@  @@@@@@@@   @@@@@@   @@@@@@@  @@@@@@@@  @@@@@@@   "
printf "\e[38;5;196m"
echo "    @@@@   @@@@@@@@  @@@@@@@   @@@  @@@     @@@@@@@  @@@@@@@@  @@@@@@@   @@@@@@@  @@@@@@@@  @@@@@@@@  "
printf "\e[38;5;196m"
echo "   @@!@!        @@@  !@@       @@!  @@@       @@!    @@!       !@@         @@!    @@!       @@!  @@@  "
printf "\e[38;5;160m"
echo "  !@!!@!       @!@   !@!       !@!  @!@       !@!    !@!       !@!         !@!    !@!       !@!  @!@  "
printf "\e[38;5;160m"
echo " @!! @!!      !!@    !!@@!!    @!@!@!@!       @!!    @!!!:!    !!@@!!      @!!    @!!!:!    @!@!!@!   "
printf "\e[38;5;124m"
echo "!!!  !@!     !!:      !!@!!!   !!!@!!!!       !!!    !!!!!:     !!@!!!     !!!    !!!!!:    !!@!@!    "
printf "\e[38;5;124m"
echo ":!!:!:!!:   !:!           !:!  !!:  !!!       !!:    !!:            !:!    !!:    !!:       !!: :!!   "
printf "\e[38;5;88m"
echo "!:::!!:::  :!:           !:!   :!:  !:!       :!:    :!:           !:!     :!:    :!:       :!:  !:!  "
printf "\e[38;5;88m"
echo "     :::   :: :::::  :::: ::   ::   :::        ::     :: ::::  :::: ::      ::     :: ::::  ::   :::  "
printf "\e[38;5;52m"
echo "     :::   :: : :::  :: : :     :   : :        :     : :: ::   :: : :       :     : :: ::    :   : :  "
echo -e "\033[0m"
echo "                                                                                    by mpivet-p"

my_tests ()
{
	FILES=$(find $1 -name *.cmd -type f)
	for FILE in $FILES
	do
		echo "========[ $FILE ]=========" >> out
		valgrind --leak-check=full --show-leak-kinds=definite,indirect $SH42 <$FILE 2>&1 | tail -n 10 >> out
	done
}

if [ $# == 0 ]
then
	DIRS=$(find cmd -type d -maxdepth 1 -not -name cmd)
	SH42=/Users/arsciand/42/42sh/42sh
else
	DIRS=$*
fi

tput sc
echo -en "\e[33;1mTests running..."

for dir in $DIRS
do
	my_tests $dir
done

tput rc
echo -e "\e[32;1mTests done       "
