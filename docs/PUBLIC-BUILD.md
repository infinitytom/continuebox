# 2.2.5 公开版构建

2026-10-22 补发 ARM32 + ARM64 universal 包，构建脚本、库来源和验证范围见[通用包与电视安装说明](TV-INSTALL.md)。下述原始重建流程及完整解码源码包仍生成原 ARM64 版本；universal 包在原包基础上补充经过摘要验证的 ARM32 库。

本版本基于 2.2.4 小幅调整：删除私人域名的特殊端口映射；未填写端口的局域网 HTTP 地址统一使用 8080；Emby 提示改为通用示例；账号入口明确连接自部署服务器。没有内置作者的服务器或账号。

## 源码对应关系

根目录 `app/`、`player/`、`quickjs/`、`pyramid/` 是历史 Java 工程，保留供参考，**直接运行根目录 Gradle 不会生成 2.2.5**。当前引擎尚未全部恢复成可编译 Java 源码，公开版使用 Apktool 重建流程，不把历史工程的版本号改成新版冒充完整迁移。

- `native-ui/`：本次使用的 Kotlin/Java 原生组件源码。
- `client-patches/2.2.5/overlay/`：相对构建基包的全部资源、Smali 和版本差异，包含编译后的原生组件入口。
- `manifest.json`：基包 SHA256、每个差异文件 SHA256、删除列表与工具版本。
- Release 的 `ContinueBox-2.2.5-decoded-source.zip`：本次完整 Apktool 工程及原生组件源码。可直接解压、重建，不依赖历史 Java 工程。
- `sync-server/`：完整 0.27.1 服务端及测试。

## 重建 APK

需要 Python 3.12、JDK 17、Apktool 3.0.3、Android SDK Build Tools 35.0.0。构建工具从其官方发行渠道获取。不要使用自动更新上游 TVBox 的旧工作流发布本版本。

从本次 Release 下载 `ContinueBox-build-base.apk`，然后运行：

```sh
python tools/rebuild_public.py --base ContinueBox-build-base.apk --apktool /path/to/apktool_3.0.3.jar
```

脚本验证基包与差异摘要，输出未签名 APK。也可解压完整源码包后直接执行 `java -jar apktool_3.0.3.jar b apk-recovered -o unsigned.apk`。Windows 上请使用相对工程路径，避开 Apktool 内置 aapt2 对含中文绝对路径的兼容问题。

然后使用 SDK 中的 `zipalign -P 16 -f 4` 对齐，再使用 `apksigner sign --ks 你自己的签名文件` 签名。私钥与签名口令不进入仓库。自行签名的 APK 无法覆盖不同签名的旧安装；请先备份数据。

## 修改原生组件

`native-ui/gradlew :cards:assembleRelease` 使用 JDK 17 和 Android SDK 35。源码的反射调用依赖本版引擎接口。将 AAR 中的 classes.jar 用 SDK d8 转为 DEX，以 Apktool 解出 Smali 后覆盖工程中的 `smali_classes12/` 对应类，再重建 APK。`tools/deps` 中两个 compileOnly JAR 只供编译，运行时使用引擎自带版本。

发布包沿用本地 2.2.4 已有调试签名身份；它不是新的正式发布签名。可验证包的 SHA256 和签名证书，再决定是否覆盖安装。

## 服务端验证

```sh
cd sync-server
python -m pip install -r requirements-dev.txt
python -m pytest -q
```

升级前备份 `.env` 和完整数据库，保留原 `TOKEN_SECRET`。新注册需配置 SMTP，旧账号继续使用原账号密码。详情见 [更新说明](../sync-server/README-UPDATE.md)。
