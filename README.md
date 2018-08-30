# EventStatistics
提供一个事件统计工具类

## 需要的参数：

###Appsflyer Dev Key  zivVyNciM64EtFmx******</br>
###Facebook ID        154279495******</br>

###fabic 

####APIKey 4fd9a8f2de516d96e92be44d9a0a3bb71b******</br>

####runscript
.//项目名/Fabric.framework/run 4fd9a8f2de516d96e92be44d9a0a3bb71bf4e91d c65591a6a960ed6ce4b7d6ad37845fb5939f7e4c520d29191f61b2954e31315a</br>


## 集成步骤：
1.导入四个库 AppsFlyerLib、Bolts、Crashlytics、Fabric、FBSDKCoreKit</br>
2.在 plist 文件中添加</br>
```XML
<key>Fabric</key>
<dict>
<key>APIKey</key>
<string>替换成自己的APIKey</string>
</dict></br>
<key>CFBundleDevelopmentRegion</key>
```

3.在 Build Phases 中新建 Run Script 项，并加入 Fabric 脚本</br>
4.AppDelegate 中分别调用 configuration、openURL、applicationBecomeActive方法</br>

