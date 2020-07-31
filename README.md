
git 批量操作工具,shell版

- 起因：dubbo项目在配置jenkins自动部署将子模块，服务等拆分到单独git仓库中，导致开发批量操作比较麻烦，而idea也只有pull，push，commit的批量操作，并不能批量切分支，merge等，于是写了个本脚本。

当然本脚本也支持其他shell命令，如：rm等

1、基本使用（如果想更方便地使用，可参照2、扩展）：

脚本放到需要批量操作的目录中

```
sh git_batch.sh git checkout branchname
#命令运行到某个目录出错，想要跳过错误，可增加-f
sh git_batch.sh -f git checkout branchname
````

2、扩展：
> 可以在git_bash或cygwin中使用别名

首先将git_batch_sh.sh放到用户目录，并在用户目录创建.bashrc文件(windows下可以用命令也可以右键文本，.bashrc.)：
```
export GIT_BATCH_FILE=$HOME"/git_batch_sh.sh"

alias bit='
batch1(){
	sh "$GIT_BATCH_FILE" git ${@:1};
};batch1';


alias batch='
batch2(){
	sh "$GIT_BATCH_FILE" ${@:1};
};batch2';


```
重新打开git_bash或cygwin窗口，然后就可以这样执行`bit status`，`bit checkout -b branchname`等等

还可以：`batch pwd`，`batch rm *.iml`等等

3、题外话

你也可以把git_bash集成到idea中使用，具体参考：[将idea的Terminal替换为git_bash](https://hupubao.com/archives/将idea的terminal替换为gitbash)
