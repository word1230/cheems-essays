---
title: "hugo大纲（目录）无法显示的bug解决"
description: "本文详细介绍了在Hugo中，由于文章的URL包含中文或特殊字符，导致FixIt主题下大纲（Table of Contents）无法渲染的bug，并提供了通过配置slug和permalink实现的终极解决方案"  
date: 2025-10-20T00:27:47+08:00
type: posts
slug: cbb9bd42 # 随机字符串
categories: 
  - 分类
collections: 
  - 合集
draft: false    
---

Contents:

- 问题描述
- 解决方法

**环境说明:**

- **操作系统:** Windows 10

- **Hugo 版本:** v0.151.2

- **主题:** FixIt

<!--more-->

## 问题描述

### 现象复现

当我的文章存储在包含中文路径时，问题就会出现。例如，我的源文件路径如下：`根目录/content/posts/学习 Java/Java 基础.md`

在 `hugo server` 本地预览或部署后，访问该文章页面，会发现**右侧的大纲目录完全不显示**。但是，文章内容本身是正常的。



### 原因分析

1. Hugo 默认会根据你的文件路径来生成文章的 URL。对于上述路径，生成的 URL 可能会是这样的：`https://your-site/posts/学习 Java/Java 基础/`

   问题就出在这个 URL 上。URL 中包含了未经处理的**中文字符**

2. 大多数主题（包括 FixIt）的大纲功能是依靠 JavaScript 在前端动态生成的。这些脚本需要解析当前页面的 URL 来定位标题、生成链接。当 URL 包含这些非标准的特殊字符时，JavaScript 的 `URL encoder` 或解析器可能会出错，导致脚本无法正确定位或执行，最终使得大纲生成失败。

3. 简单来说，**罪魁祸首是包含了特殊字符的“脏”URL**，而不是 Hugo 本身或主题的 Bug。

## 解决： 配置永久链接（Permalinks）与 Slug（推荐）

- 既然 url 出了问题，修改生成的 url 即可

- 原理： 将文章的URL与它的文件路径解耦，改用一个唯一的、URL友好的标识符（slug）来生成链接。

- 思路： 让文章对应的 url 变为： <https://your-site/posts/随机字符串>

- 操作步骤

  - 打开 根目录/config/_default/hugo.toml

  - 搜索 `[permalinks]` 在其下增加一行 `posts = "/:section/:slug/"`

    ```toml
    [permalinks]
      posts = "/:section/:slug/"        # 设置生成的url
    ```

  - 打开根目录/archetypes/default.md 在元信息添加一行
  
    ```yaml
    slug: {{ substr (md5 (printf "%s%d" .Name now.Unix)) 0 8 }}  # 随机生成8位字符串
    ```
  
  - 同时为了保证本地使用的多级目录可以被识别,元信息需要添加 type字段
  
    ```toml
    type: posts
    ```
  
- 效果： url 变为了 <https://your-site/posts/cbb9x342> ，而且不管本地多少目录层级都可以识别到。
