# 电视安装失败与 ARM 通用包

2026-10-22 为 2.2.5 制作 `ContinueBox-2.2.5-universal.apk`。原 `ContinueBox-2.2.5.apk` 实际只含 `arm64-v8a`，不能安装到仅支持 ARM32 应用的 Android 系统。通用包补齐 `armeabi-v7a` 的 10 个原生库，适用 Android 5.0+ 的 ARM32 / ARM64 设备；这里的 universal 不包含 x86 / x86_64，也不支持非 Android 系统。

通用包采用独立包名 `com.continuebox.tv`，同步更新四个 Provider authority 和 BuildConfig.APPLICATION_ID，避免与 TVBox 原包名混用。版本号、版本代码和签名证书保持 2.2.5 的身份；原 ARM64 库及 17 个 DEX 完全不变，classes16.dex 仅修改 BuildConfig 的应用 ID，Manifest 和资源包名随独立身份重建。

**这是新应用安装，可以与原版共存，不能直接覆盖旧包名应用；原应用的本地配置、历史、收藏不会自动迁移。** 请保留原版并先备份，在新版重新配置订阅和同步服务器；已同步的数据可在连接原自部署服务器并登录后同步。确认迁移完成前不要卸载原版。后续同包名、同签名的 universal 版本才可覆盖升级。

## 海信电视为什么可能装不上

除 APK 架构、Android 最低版本、签名冲突、存储空间与文件损坏等通用原因外，海信聚好看还公开了设备应用安全要求。[《聚好看开发者生态安全政策》第二部分](https://dev.hismarttv.com/doc/16)列出：签名或应用文件与市场检测过的同包名应用不一致、动态加载可执行代码、申请无关权限等安全不达标情况。

原续映沿用 `com.github.tvbox.osc.jun` 包名，并包含插件加载能力，因此厂商同包名/安全检查是排查方向；本通用包改用独立应用 ID，消除与其他 TVBox 分支的同包名冲突，但仍可能受到其他安全策略影响。政策本身不能证明此次反馈已触发某项检查，也不能说明所有海信型号的行为一致。目前未取得受影响设备型号、安装提示或系统日志，无法确认具体根因。请按具体机型提供的设置和安装入口操作；网上“商场模式”等教程不能当成所有型号通用方法。

**本次通用包补齐 ARM32 并改为独立包名，不保证解除厂商所有安装策略。** 原版已经具有 v1/v2/v3 签名，新包继续使用这些签名方案；不能将问题归结为缺少旧版签名。

如仍失败，请反馈电视型号、系统/Android 版本、安装方式及完整提示。设备支持并授权 ADB 时，可提供以下输出：

```sh
adb shell getprop ro.product.cpu.abilist
adb shell getprop ro.product.cpu.abi
adb shell getprop ro.build.version.sdk
adb install -r ContinueBox-2.2.5-universal.apk
```

`INSTALL_FAILED_NO_MATCHING_ABIS` 指向架构不匹配，`INSTALL_FAILED_OLDER_SDK` 指向系统过旧，`INSTALL_FAILED_UPDATE_INCOMPATIBLE` 通常需要核对同包名安装的签名，`INSTALL_FAILED_VERIFICATION_FAILURE` 需要进一步查看验证日志。单独的“安装失败”无法区分这些原因。[Android ABI 与打包机制](https://developer.android.com/ndk/guides/abis)。

## 构建与验证范围

```sh
python tools/build_universal.py --base ContinueBox-2.2.5.apk --apktool /path/to/apktool_3.0.3.jar --work universal-build --output universal-unsigned.apk
zipalign -P 16 -f 4 universal-unsigned.apk universal-aligned.apk
apksigner sign --ks /path/to/existing-release-key --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true --v4-signing-enabled false --out ContinueBox-2.2.5-universal.apk universal-aligned.apk
```

补充材料见 `client-patches/2.2.5/universal/manifest.json`。七个 ARM32 库来自仓库现有 `player` / `quickjs` 目录；Conceal、Cronet、RTMP 来自本地保留的 `TVBox_q215613905_20260914-1520-python.apk`，其对应 ARM64 库与原公开包逐字节一致。该来源只用于这三个库，没有引入 Python 引擎。manifest 记录来源 APK 与各库 SHA256。Release 的 universal 构建补充包包含脚本、全部 ARM32 输入库及这份说明，需与原公开源码配合使用；原完整解码源码包仍对应 ARM64 版本。

已检查两种 ABI 各有同名的 10 个库，新增库为 ELF32 ARM，动态依赖齐全，全部 JNI 导出入口与对应 ARM64 库一致；原 ARM64 库和 17 个 DEX 保持不变。Android 11 x86_64 模拟器（libndk_translation ARM 转译）强制 ARM32 / ARM64 安装均成功，独立包名可与原版共存；ARM64 主页启动成功，88 项界面回归、99 项账号与会话检查通过；包名与四个 Provider、QuickJS 原生计算、IJK 原生创建/释放检查通过。账号用本地隔离测试服务及全新测试数据验证，测试输入改为重试失效的辅助功能节点，应用代码未修改。ARM32 启动在模拟器 libndk_translation 转译层发生 SIGSEGV，不能据此判定 ARM32 真机运行成功或失败。没有连接海信或 ARM 真机，尚未验证受影响设备的安装与播放；ZIP 对齐也不等同于原生库已支持 16 KB 内存页。
