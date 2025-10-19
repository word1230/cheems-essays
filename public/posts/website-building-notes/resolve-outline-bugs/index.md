# 关于大纲（目录）的bug解决


Overview:

- 问题描述
- 解决方法

<!--more-->

## 问题描述

首先我的文章的目录为： 根目录/content/posts/学习java/java基础.md

这里会遇到一个问题：网站中，文章打开后，大纲消失。

原因： 

1. hugo默认只会识别posts目录下的中文文件名的md的大纲  而一旦出现了子目录，则子目录和文件名都需要英文
   - 比如posts/java基础 就是可以正常识别的 

## 解决

- 这就是一个取舍的问题了
- 我不太能接受本地无法分类
- 所以将所有的都换成英文即可 



---

> 作者: cheems  
> URL: http://localhost:1313/posts/website-building-notes/resolve-outline-bugs/  

