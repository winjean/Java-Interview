
git 使用
==

### SSH Key
* ssh-keygen -t rsa -C "19548901@qq.com"  
	密钥类型可以用 -t 选项指定;如果没有指定则默认生成用于SSH-2的RSA密钥,这里使用的是rsa  
	-C 来指定所指定的注释，可以方便用户标识这个密钥，指出密钥的用途或其他有用的信息。所以在这里输入自己的邮箱或者其他都行  
	生成id_rsa、id_rsa.pub文件

### Git branch

	一般用于分支的操作，比如创建分支，查看分支等等，

* git branch
	不带参数：列出本地已经存在的分支，并且在当前分支的前面用"\*"标记

* git branch -r  
	查看远程版本库分支列表

* git branch -a  
	查看所有分支列表，包括本地和远程

* git branch dev  
	创建名为dev的分支，创建分支时需要是最新的环境，创建分支但依然停留在当前分支

* git branch -d dev  
	删除dev分支，如果在分支中有一些未merge的提交，那么会删除分支失败，此时可以使用 git branch -D dev：强制删除dev分支，

* git branch -vv  
	可以查看本地分支对应的远程分支

* git branch -m oldName newName  
	给分支重命名

* git push origin dev  
	在远程创建分支

* git push origin --delete dev  
	删除远程分支	

* git push --set-upstream origin dev  
	设置远程分支与本地分支相关联


### Git checkout
	可用于操作文件和操作分支

* git checkout filename  
	放弃单个文件的修改

* git checkout .  
	放弃当前目录下的修改

* git checkout master  
	将分支切换到master

* git checkout -b master  
	如果分支存在则只切换分支，若不存在则创建并切换到master分支，  
	repo start是对git checkout -b这个命令的封装，将所有仓库的分支都切换到master，master是分支名，  

* git checkout --help  
	当然git checkout还有许多命令，但这些已经能满足我们日常开发所需

### git merge
* git merge dev  
	Dev表示某分支，表示在当前分支合并Dev分支

* git merge -m  "comment"  dev  
	-m可以加上merge时要添加的描述性语句，如果出现冲突，那么先解决冲突，再将文件git add，git commit，之后再merge

### git rebase
* git rebase --continue  
	解决完合并冲突后，继续合并未合并完的操作

* git rebase -- abort  
	终止rebase操作，将分支回到rebase开始前的状态

