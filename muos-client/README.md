# 续映 ContinueBox · muOS 预览版

面向 Anbernic RG34XX SP 和 muOS 2606.0 Andromeda。客户端以续映 2.2.6 仓库中的同步服务端 0.27.1 为接口基线，复用服务器上已配置的 Emby 媒体库。界面支持继续观看、最新入库、电影、剧集和选集。Wasabi 负责播放，客户端读取播放位置，并通过续映服务端回传给 Emby。

此预览版已跨平台构建。RG34XX SP 的安装、手柄映射、视频解码、跳转和进度回传需要实机验证。当前范围为 Emby，TVBox 订阅、Spider、网盘插件、弹幕和外部字幕尚未适配。

建议首测低码率 H.264 + AAC 的 360p 或 480p 视频。客户端使用服务器返回的直播放地址，无法在掌机上把高码率原片降为低清，也不会向 Emby 请求转码。遇到 1080p、4K 或高码率 HEVC 内容时，可先准备适合掌机播放的版本。

## 安装

1. 在续映服务器上为账号配置一个可以访问的 Emby 库。
2. 在 Windows PowerShell 里运行 `.\ContinueBox-Setup.exe setup`，输入你的续映服务器地址和账号。密码输入时不显示。工具检查账号是否绑定 Emby，然后生成 `continuebox.json`。这个文件含登录令牌，只保存在电脑和自己的 TF 卡上。
3. 把 `continuebox.json` 放到 TF1 根目录，将 `ContinueBox-muOS-0.1.0-preview.muxapp` 放到 TF1 的 `ARCHIVE`。
4. 掌机连上 Wi-Fi，进入 **Applications → Archive Manager** 安装，再从 **Applications** 打开 ContinueBox。
5. 左右切换栏目，上下选择，A 播放或进入选集，B 返回，L/R 翻页。

播放事件通过续映服务器原有的播放事件接口上报。服务器会依照账号已绑定的服务处理这些事件，包括 Emby、Trakt 和 NeoDB。

## 构建

需要 Go 及 Python 3.11 或更新版本。运行 `python package.py dist` 生成 ARM64 安装包、Windows 配置工具和 SHA-256 校验文件。Noto Sans SC 字体随安装包分发，遵循 SIL Open Font License。手持端通过 SDL2 和 SDL2_ttf 使用系统动态库。
