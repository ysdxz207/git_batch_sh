#批量git操作v2
#Author:W.feihong
#使用方法：sh git_batch.sh git checkout branchname
#报错不终止，继续执行：sh git_batch.sh -f git checkout branchname

force=0
if [ "$1" == "-f" ]
	then
		force=1
		git_command=${@:2}
	else
		git_command=${@:1}
fi

current_pwd=`pwd`
success=1

find `pwd` -type d -name ".git" > git.tmp
sed -i "s/\/.git/\//g" git.tmp

while read LINE
do
	echo $LINE
	cd "$LINE"

	eval $git_command
	
	if [ $? -eq 0 ]
	then
		echo "-----------------------------"
	else
		echo -e "\033[36;41m Error \033[0m"
		success=0
		
		if [ $force -eq 0 ]
		then
			break
		fi
	fi
done < git.tmp

cd "$current_pwd"

rm -rf git.tmp

if [ $success -eq 1 ]
then
	echo -e "\033[37;42m Done!!! \033[0m"
fi

