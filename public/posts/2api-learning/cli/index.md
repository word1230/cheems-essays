# CliProxyAPI


Overview:

- 工具的作用
- 如何使用
  - qwen iflow
  - 第三方站

<!--more-->

## 工具的作用

由于很多用于编程cli免费额度的有很多，比如qwen coder， gemini cli等
但是编程基本用不完，就浪费掉每天的额度了，这个工具的作用就是将这些额度转为一个api key，方便在其他地方调用,而不只是用来编程（实际原理可能不是这样）

## 如何使用

### qwen cli 和iflow

1. 首先要安装cliproxyAPI

   从这里 `https://github.com/router-for-me/CLIProxyAPI` 下载应用并解压

   得到如图所示的目录

   ![image-20251018171603168](https://cdn.jsdelivr.net/gh/word1230/hugo-img@main/resources/20251019_bnkKOc.webp)

2. 配置

   1. 将`config.example.yaml`文件重命名为 `connfig.yaml`

   2. 打开它

      找到`auth-dir:`这一项， 改为软件的解压目录/auths, 例如：`D:\\Program Files\\CLIProxyAPI_6.2.19_windows_amd64\\auths`

      `api-keys:` 这一项， 设置被代理后生成的api-key。 后面在软件中填写的base-url 和 api-key 填的就是这个

   3. 然后在当前目录打开cmd ，输入命令： `cli-proxy-api --qwen-login` 

   4. 确认登录即可

3. 使用

   1. 此时可以打开根目录的exe文件

   2. 然后就可以使用了

      比如在cherry studio中 就可以

      ![image-20251018172350424](https://cdn.jsdelivr.net/gh/word1230/hugo-img@main/resources/20251019_6ArDLV.webp)

iflow也同理

在配置这一步的第三点中：改为执行 `./cli-proxy-api --iflow-login` 授权即可



### 第三方中转站（claude code，codex中转）

1. 打开配置文件

   找到`openai-compatibility:`项 填写base-url，api-key，models即可

2. 打开exe即可使用


---

> 作者: cheems  
> URL: http://localhost:1313/posts/2api-learning/cli/  

