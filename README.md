
git 批量操作工具,shell版

- 起因：dubbo项目在配置jenkins自动部署将子模块，服务等拆分到单独git仓库中，导致开发批量操作比较麻烦，而idea也只有pull，push，commit的批量操作，并不能批量切分支，merge等，于是写了个本脚本。

当然本脚本也支持其他shell命令，如：rm等

1、使用方法：

脚本放到需要批量操作的目录中

```
sh git_batch.sh git checkout branchname
#命令运行到某个目录出错，想要跳过错误，可增加-f
sh git_batch.sh -f git checkout branchname
````

2、扩展：
> 可以在git_bash或cygwin中使用别名

首先将git_batch_sh.sh放到用户目录，并在用户目录创建.bashrc文件：
```
export GIT_BATCH_FILE=$HOME"/git_batch_sh.sh"
alias bs='
batch(){
	sh "$GIT_BATCH_FILE" git status;
};batch'

alias bit='
batch(){
	sh "$GIT_BATCH_FILE" git ${@:1};
};batch'

alias batch='
batch(){
	sh "$GIT_BATCH_FILE" ${@:1};
};batch'
```
然后就可以使用`bs`批量执行`git status`命令

也可以这样执行`bit status`，`bit checkout -b branchname`等等
还可以：`batch pwd`，`batch rm *.iml`等等

3、题外话

你也可以把git_bash集成到idea中使用，具体参考：[将idea的Terminal替换为git_bash](http://hupubao.win/article/detail?id=469084492376571904)
