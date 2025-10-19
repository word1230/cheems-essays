# 关于大纲（目录）的bug解决


Overview:

- 问题描述
- 解决方法

<!--more-->

## 问题描述

首先我的文章的目录为： 根目录/content/posts/学习java/java基础.md

这里会遇到一个问题：网站中，文章打开后，大纲消失。

原因： 

1. hugo默认只会识别posts目录下的md的大纲
   - 比如posts/java基础 就是可以正常识别的

2. 然后是中文路径的问题
   1. 由于我的路径为  posts/学习java/java基础
   2. **学习java** ，出现了学习两个，是中文路径， 就不支持。

## 解决

对于第一个原因： 

- 可以在archetypes的模板中添加一行

  `type: posts`

对于第二个原因

- 不是用中文，全部换为英文即可
- 比如 Learning Java



---

> 作者: cheems  
> URL: http://localhost:1313/posts/website-building-notes/%E5%85%B3%E4%BA%8E%E7%9B%AE%E5%BD%95%E7%9A%84bug%E8%A7%A3%E5%86%B3/  

