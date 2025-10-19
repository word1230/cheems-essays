---
title: "{{ replace .Name "-" " " | title }}"
description: "{{ replace .Name "-" " " | title }}"  
date: {{ .Date }}
type: posts
slug: {{ substr (md5 (printf "%s%d" .Name now.Unix)) 0 8 }}
categories: 
  - 分类
collections: 
  - 合集
draft: false   
---

Contents:

- 

<!--more-->
