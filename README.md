
git 批量切分支工具,shell版

当然也支持其他shell命令

使用方法：

脚本放到需要批量出来的目录中

```
sh git_batch_sh.sh git checkout branchname
#命令运行到某个目录出错，想要跳过错误，可增加-f
sh git_batch_sh.sh -f git checkout branchname
````
