# Live-Activities-Demo-NBA-Score
Live Activities and Dynamic Island Demo for NBA score

Xcode16.1 beta 
### 创建Live Activities Target
Apple 在新的beta版中代码框架和补全给的更加完善，会自动帮咱们进行bundle的绑定和灵动岛相关代码的
新建Target选择Live Activities:
![截屏2022-08-18 21 26 13](https://github.com/jerryliurui/Live-Activities-Demo-NBA-Score/blob/main/%E6%88%AA%E5%B1%8F2022-10-17%2010.36.43.png)

### isLuminanceReduced 的应用
息屏时颜色处理
我们可以自定义一个边界的修饰器来给View添加息屏效果
```
struct LuminanceReducedColor: ViewModifier {
    var foregroundColor: Color
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    func body(content: Content) -> some View {
        if isLuminanceReduced {
            content.foregroundColor(.white)
        } else {
            content.foregroundColor(foregroundColor)
        }
    }
}

extension View {
    func luminanceReducedColor(color: Color) -> some View {
        modifier(LuminanceReducedColor(foregroundColor: color))
    }
}
```

### Animation
Apple 对于这一块的动画限制比较多
![截屏2022-08-18 21 26 13](https://github.com/jerryliurui/Live-Activities-Demo-NBA-Score/blob/main/%E6%88%AA%E5%B1%8F2022-10-11%2018.48.54.png)
动画测试代码:自定义一个动画
```
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .bottom).combined(with: .opacity).combined(with: .scale(scale: 1.2)),
            removal: .scale.combined(with: .opacity)
        )
    }
}
```

### 关于Push更新
如果是个人开发者测试来使用 可以参考这位大佬的 https://github.com/rakutentech/macos-push-tester Push工具
修改相关的代码 build mac app 
PusherStore.swift 中 push func中添加
```
if data.pushtype == "liveactivity"{
  topic = "\(appBundleID).push-type.liveactivity"
}
```
StoryBoard中添加pushtype : liveactivity

运行后按照要求填写payload、证书、bundleId等信息
PS payload格式一定要按照你定义的contentstate字段
PS payload中timestamp 每次发送push都要变动，否则会出现无法更新的情况
Token使用控制台打印的token字符串

### 效果截图
![截屏2022-08-18 21 26 13](https://github.com/jerryliurui/Live-Activities-Demo-NBA-Score/blob/main/iPhone%20Space%20Gold%20Left.png)

![截屏2022-08-18 21 26 13](https://github.com/jerryliurui/Live-Activities-Demo-NBA-Score/blob/main/IMG_0066.PNG)

![截屏2022-08-18 21 26 13](https://github.com/jerryliurui/Live-Activities-Demo-NBA-Score/blob/main/iPhone%20Space%20Gold%20Right.png)
