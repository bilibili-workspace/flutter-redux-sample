# flutter_app


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

那么，感谢大家的三连或者关注支持，我是黎明韭菜，我们下期视频再见


# 运行配置

- sdk 版本 1.22.3

```java
Flutter 1.22.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 8874f21e79 (5 months ago) • 2020-10-29 14:14:35 -0700
Engine • revision a1440ca392
Tools • Dart 2.10.3
```
