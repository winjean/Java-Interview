
git
==

### Git branch

	一般用于分支的操作，比如创建分支，查看分支等等，

* git branch

　　　　　　不带参数：列出本地已经存在的分支，并且在当前分支的前面用"*"标记

* git branch -r

　　　　　　查看远程版本库分支列表

* git branch -a

　　　　　　查看所有分支列表，包括本地和远程

* git branch dev

　　　　　　创建名为dev的分支，创建分支时需要是最新的环境，创建分支但依然停留在当前分支

　　　　1.5 git branch -d dev

　　　　　　删除dev分支，如果在分支中有一些未merge的提交，那么会删除分支失败，此时可以使用 git branch -D dev：强制删除dev分支，

　　　　1.6 git branch -vv 

　　　　　　可以查看本地分支对应的远程分支

　　　　1.7 git branch -m oldName newName

　　　　　　给分支重命名
### Git checkout

　　　　1. 操作文件  2. 操作分支

　　　　2.1 操作文件

　　　　　　2.1.1 git checkout filename 放弃单个文件的修改

　　　　　　2.1.2 git checkout . 放弃当前目录下的修改

　　　　2.2 操作分支

　　　　　　2.2.1 git checkout master 将分支切换到master

　　　　　　2.2.2 git checkout -b master 如果分支存在则只切换分支，若不存在则创建并切换到master分支，repo start是对git checkout -b这个命令的封装，将所有仓库的分支都切换到master，master是分支名，

　　　　2.3 查看帮助

　　　　　　git checkout --help

　　　　　　当然git checkout还有许多命令，但这些已经能满足我们日常开发所需