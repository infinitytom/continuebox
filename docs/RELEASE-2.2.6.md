# 2.2.6 universal：更新检测与网盘入口说明

包名 `com.continuebox.tv`，版本代码 20206，ARM32 / ARM64，Android 5.0+。沿用 2.2.5 universal 的签名，可覆盖升级；其他包名版本仍单独安装。

## 行为

- 启动返回主页时后台检查 GitHub 本仓库最新正式版；正常情况每天最多一次，失败后至少一小时再尝试。可在“设置 → 关于”关闭自动检查，或手动检查。
- 只接收高于已安装版本、非 draft / prerelease 且具有精确匹配 universal APK 的发布。比较数字版本，拒绝无安装包、错误地址、外部仓库及空文件资产；解析失败静默跳过。
- 只读取公开发布元数据，不发送续映账号、网盘凭据、订阅或观看记录。通过 HTTPS 访问 GitHub，受 GitHub 可达性及公共 API 额度影响。
- 新版提示由用户选择下载，交给浏览器和系统安装器处理，不后台下载或静默安装。电视没有浏览器时可用手机打开发布页，下载后推送到电视。
- 网盘说明改为：首页按遥控器“确定” → 网盘配置 → 对应平台 → 按实际提示扫码或填写凭据。本机配置网页用于接口配置，不是网盘登录窗口。

## 复现

下载 v2.2.5 的 `ContinueBox-2.2.5-universal.apk`，在仓库运行：

```sh
python tools/rebuild_2_2_6.py --base ContinueBox-2.2.5-universal.apk --apktool /path/to/apktool_3.0.3.jar --work rebuild-226
```

脚本验证基包和 `client-patches/2.2.6/manifest.json` 中所有覆盖文件摘要。输出未签名 APK，之后使用 Android SDK zipalign 与自己的签名文件签名。只有持有原签名身份才能覆盖官方 universal 包，仓库与源码补充材料不包含私钥。

`UpdateChecker.java` 可用 JDK 17 的 javac 编译（classpath 为 SDK 35 android.jar，Java 8 目标），SDK d8 `--min-api 21` 转 DEX，再用 Apktool 解为 `smali_classes19`。CloudPortal 的源码与覆盖 Smali 同步调整；已有引擎继续使用 Apktool / Smali 构建。

## 验证范围

Android 11 带 ARM 转译的模拟器上验证完整 ARM64 包：25 项更新解析、版本比较、开关保存、关于入口和网盘说明检查；88 项界面回归；包名和四个 Provider、QuickJS 原生计算、IJK 原生创建/释放检查。不是海信 / TCL 真机认证，也不代表所有网盘或第三方资源可用。

两种架构均保留各 10 个原生库，原生库未改；原 2.2.5 universal 的 ARM32 模拟器转译启动限制仍未解决，不将它写成 ARM32 运行验证通过。服务端维持 0.27.1，不改变线上配置和承载承诺。

新手 PDF 包含 TCL 多屏互动推送（只对提供相应入口的机型适用），饭太硬、网盘配置、可选同步服务和常见问题。服务器说明仅保留“小规模日常同步，不适合大量用户同时接入”，不再给出未经压测的人数建议。
