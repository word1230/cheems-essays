---
title: "Langchain4j学习（一）-- 快速入门"
description: "Langchain4j学习（一）"  
date: 2025-12-11T16:31:16+08:00
type: posts
slug: 7275d72d
categories: 
  - 技术学习
collections: 
  - langchain4j
draft: false   
---

Contents:

-

<!--more-->

官方文档：<https://docs.langchain4j.dev/tutorials/spring-boot-integration>

环境：

- jdk21
- vscode
- springboot 3.58

## 快速开始

使用langchain4j 可以快速实现与AI聊天。

有两种实现的形式： 低级API 和 高级AI服务

### 方式一： 低级API

第一步： 引入依赖

```xml
<dependencies>
    <!-- 核心 LangChain4j -->
    <dependency>
        <groupId>dev.langchain4j</groupId>
        <artifactId>langchain4j</artifactId>
        <version>1.9.1</version>
    </dependency>
    
    <!-- OpenAI 集成（示例） -->
    <dependency>
        <groupId>dev.langchain4j</groupId>
        <artifactId>langchain4j-open-ai</artifactId>
        <version>1.9.1</version>
    </dependency>
</dependencies>

<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>dev.langchain4j</groupId>
            <artifactId>langchain4j-bom</artifactId>
            <version>1.9.1</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```

第二步： 写一个demo

```java
public class QuickStartDemo {

    public static void main(String[] args) {
        ChatModel chatModel = OpenAiChatModel.builder()
                        .baseUrl("http://langchain4j.dev/demo/openai/v1")
                        .apiKey("demo")
                        .modelName("gpt-4o-mini")
                        .build();

        String answer = chatModel.chat("langchain是什么");
        System.out.println(answer);
    }

}
```

- 代码解释

  1. 通过建造器创建一个`ChatModel`, 通过这个对象的chat方法，就开始实现与大模型的聊天

  2. 这个对象有如下的方法：    chat 方法支持使用一个List来传递多种消息类型（比如 SystemMessage,UserMessage）支持ChatRequest，可以自定义请求。

     ![image-20251212094307056](https://cdn.jsdelivr.net/gh/word1230/hugo-img@main/resources/20251212_lTpvBA.webp)

### 方式二： 高级AI服务

第一步： 引入依赖（参考上面，导入过就不用再导入了）

第二步： 写一个demo

```java
interface AiAssistant {
    String chat(String question);
    
}
public class ServiceQuickStartDemo {

    public static void main(String[] args) {
        ChatModel chatModel = OpenAiChatModel.builder()
                                .baseUrl("http://langchain4j.dev/demo/openai/v1")
                                .apiKey("demo")
                                .modelName("gpt-4o-mini")
                                .build();;
        AiAssistant assistant = AiServices.create(AiAssistant.class, chatModel);
        String answer = assistant.chat("langchain是什么");
        System.out.println(answer);
    }

}
```

- 代码解释
  1. 先定义一个 AI服务接口 AiAssistant
  2. 这里依然是先创建一个 ChatModel ， 然后使用AiServices.create 创建了AI服务
  3. 使用我们定义的方法

### 两者的区别

对于第二种方法： 它的好处是更加简单。 我们可以在接口中自定义方法，AiServices.create 创建了AI服务后，就开始调用。底层由框架帮我们做了入参，出参的转换，以及各种消息（比如SystemMessage,UserMessage）的填充。

举个栗子：

```java


class User {
    private Long id;
    private String name;
    private Integer age;

}

interface AiAssistant {
    @SystemMessage("你是一个用户查询助手")
    @UserMessage("查询用户id为{{id}}的用户信息")
    User queryUserById( Long id);
}

public class ServiceQuickStartDemo {

    public static void main(String[] args) {
        ChatModel chatModel = OpenAiChatModel.builder()
                .baseUrl("http://langchain4j.dev/demo/openai/v1")
                .apiKey("demo")
                .modelName("gpt-4o-mini")
                .build();
        ;
        AiAssistant assistant = AiServices.create(AiAssistant.class, chatModel);
        User user = assistant.queryUserById(1L);
        System.out.println(user);
    }

}
```

使用AI服务的 好处：

- 我们可以直接传递一个 Long 类型的参数， 然后让模型返回一个User对象。
- 可以直接通过注解来规定SystemMessage 和 UserMessage

如果我们是使用方式一： 

- 我们的参数只能是 String 或者通过 ChatRequest来拼接。
- 返回只能是一个string 或者通过ChatResponse 来手动解析
- Message 需要我们手动拼装。

> 所以这两种方式的区别：
>
> 1. 方式一: 低级API 是更加灵活，可以按照自己的想法拼接消息，参数，返回值等。相应的要写的代码也会更多
> 2. 方式二： 它是对方式一的封装，使得我们可以更快，更便捷地写一个AI应用。同时它的控制权也会更少

## 核心组件

langchain4j 是一个全面的 Java 框架，用于构建由大型语言模型 (LLM) 驱动的应用程序。能实现多种模型的快速集成，上下文管理等。这离不开它的组件

它的组件包括： 

基础：

- 提供与大模型交互的组件 ChatModels
- 对话消息  Chat Messages
- 聊天历史记录 ChatMemory

向量

- Embeddings 和向量存储

高级

- 检索增强生成 rag
- 工具调用 Tools
- 安全控制 Guardrails
- 观测 Observability

## springboot集成步骤

创建项目就不说了

### 第一步： 添加依赖

可以直接通过starter引入依赖, 命名约定遵循：`langchain4j-{integration-name}-spring-boot-starter`  

版本号需要参考官方文档获取最新。 

openAI格式的：

```xml
<dependency>
    <groupId>dev.langchain4j</groupId>
    <artifactId>langchain4j-open-ai-spring-boot-starter</artifactId>
    <version>1.9.1-beta17</version>
</dependency>
<dependency>
    <groupId>dev.langchain4j</groupId>
    <artifactId>langchain4j-spring-boot-starter</artifactId>
    <version>1.9.1-beta17</version>
</dependency>
```

### 第二步： 配置langchain4j

打开`application.yml`

```yml
# langchain4j
langchain4j:
  open-ai:
    chat-model:
      api-key: demo                   #你的密钥
      model-name: gpt-4o-mini         #模型名称
      base-url: http://langchain4j.dev/demo/openai/v1 
      log-requests: true
      log-responses: true             # 日志
```

- 这里支持 openai 格式的大模型，以及中转。



### 低级APi

配置完成之后就可以得到一个`OpenAiChatModel`实例,可以通过 `ChatModel`引入。

```java
@RequiredArgsConstructor
@RequestMapping("/")
@RestController
public class ChatController {

    private final ChatModel chatModel;

    @GetMapping("/chat")
    public String chat(@RequestParam(value = "message", defaultValue = "hello") String message) {
        return chatModel.chat(message);
    }
}
```

这是低级APi 的调用方式

### 高级AI服务

步骤一：定义一个 AI服务接口

```java
@AiService 
public interface Assistant {
    @SystemMessage("你是我的私人助手")
    String chat(String question);
}

```

步骤二： 定义一个controller ， 直接导入Assistant

```java
@RequestMapping("/")
@RestController
public class AssistantController {

    @Resource
    private Assistant assistant;

    @GetMapping("/chat")
    public String chat(String question) {
        return assistant.chat(question);
    }
}

```

这样就实现了一个简单的聊天接口





