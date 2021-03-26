# flutter_app

- flutter_redux 使用示例

# 运行配置

- sdk 版本 1.22.3

```java
Flutter 1.22.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 8874f21e79 (5 months ago) • 2020-10-29 14:14:35 -0700
Engine • revision a1440ca392
Tools • Dart 2.10.3
```

# 稿子

今天给大家介绍一个非常牛逼的框架

他就是 flutter_redux

因为使用它不仅可以成倍的节约内存空间

更能有效的解耦结构和减少代码

真所谓居家旅行必备良药

这么牛逼的框架要怎么使用呢？

我们首先新建一个项目

主要功能就是点击按钮数字 ++

但这时可以看到，点击后所有的 UI 控件都需要被刷新

那么下面我们在配置文件中添加依赖，引入 flutter_redux

redux 的所有功能都是基于 Store 对象进行的

所以我们先在 _HomePageState 中实例化 Store 对象

因为实例化 Store 需要两个变量，分别是 Reducer 和 State

所以我们先新建一个文件 app_state.dart 来实现他们俩

（一分钟）

首先是 State 

这里我们将它命名为 AppState 用来封装需要共享的数据

其次是 Reducer 它是用来处理数据的更新逻辑

比如我们点击按钮增加数字的 Demo

那么它的功能就是做加一操作

细心地同学可能发现，我们这里用 action.runtimeType 做了个分类

这样可以保证每一个对象代表一种操作

比如这里 IncrementAction 对象就代表增加数字

这样所有准备操作就结束啦

我们只要要在 MaterialApp 外包裹一个 StoreProvider

并传入之前实例化的 store 对象

然后我们就可以开心地使用了

就拿点击按钮增加数字为例

我们在点击按钮的地方包裹一个 StoreConnector

并在点击时触发 dispatch 方法

同时在显示数字的地方也包裹上 StoreConnector

并通过 store.state.count 获得当前的次数

这样一来当我们点击按钮的时候数字就自动加一了

一下子省却了 setState 等方法

我的双手解放了！

但要是以为这就是 redux 所有神奇之处就大意了

那么我们下面就来见证下奇迹嗷

可以看到，在使用 redux 之前每次点击都要刷新所有组件

这样一台内存的负担是相当大的

那么使用 redux 之后

竟然只有变化了的地方会被刷新

这对于复杂的程序简直就是福音有木有！

这么好用的框架必须给他点个赞

那么，感谢大家的三连或者关注支持

我是黎明韭菜，我们下期视频再见，拜拜 ┏(＾0＾)┛



