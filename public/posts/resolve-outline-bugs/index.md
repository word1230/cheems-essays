# 关于大纲（目录）的bug解决


Overview:

- 问题描述
- 解决方法

<!--more-->

## 问题描述

首先我的文章的目录为： 根目录/content/posts/学习java/java基础.md

这里会遇到一个问题：网站中，文章打开后，大纲消失。

原因： 

1. 文章的url对应的并没有做处理，而是直接显示中文。导致大纲识别失败。
   - 也就是说问题出现在了url上

## 解决

### 方法一

非常简单

不在本地进行分类，直接在posts目录下建markdown文件。 此时是支持中文 文件名的。

### 方法二

- 既然url出了问题，修改生成的url即可

- 操作步骤

  - 打开 根目录/config/_default/hugo.toml

  - 搜索 `[permalinks]` 在其下增加一行 `posts = "/:section/:filename/"` 

    ```
    [permalinks]
      posts = "/:section/:filename/"
    ```

    

我不太能接受本地无法分类


---

> 作者: cheems  
> URL: http://localhost:1313/posts/resolve-outline-bugs/  

