
git 批量切分支工具,shell版

当然也支持其他shell命令

1、使用方法：

脚本放到需要批量出来的目录中

```
sh git_batch.sh git checkout branchname
#命令运行到某个目录出错，想要跳过错误，可增加-f
sh git_batch.sh -f git checkout branchname
````

2、扩展：
> 可以在git_bash或cygwin中使用别名

首先将git_batch_sh.sh放到用户目录，创建.bashrc文件：
```
export GIT_BATCH_FILE=$HOME"/git_batch_sh.sh"
alias bs='
batch(){
	sh "$GIT_BATCH_FILE" git status;
};batch'

alias bit='
batch(){
	sh "$GIT_BATCH_FILE" git $1;
};batch'
```
然后就可以使用`bs`批量执行`git status`命令啦

也可以这样执行`bit status`，`bit checkout -b branchname`等等

3、题外话

你也可以把git_bash集成到idea中使用，具体参考：[将idea的Terminal替换为git_bash](http://hupubao.win/article/detail?id=469084492376571904)
