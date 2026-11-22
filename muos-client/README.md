# 续映 ContinueBox · muOS TVBox 在线版

面向 RG34XX SP 和 muOS Andromeda 2606.0。输入自己的 TVBox 点播订阅地址，选择站点、浏览分类、搜索和选集，由 Wasabi 在线播放。此版无需账号、同步服务或 Emby。

## 安装和使用

1. 把 `ContinueBox-muOS-0.2.0-TVBox-preview.muxapp` 传到 TF1 的 `ARCHIVE`，在 **Applications → Archive Manager** 安装。沿用 Emby 预览版的应用目录和菜单入口，安装后打开 **ContinueBox**。
2. 掌机连接 Wi-Fi，选择 **输入或修改订阅地址**。方向键选字符，A 输入，X 空格，L 删除，R 切换大小写，START 提交。也可以在 TF1 根目录创建 UTF-8 文本文件 `continuebox-tvbox.txt`，第一行填写完整订阅地址。文件可用 muOS Web Dashboard 上传。
3. 选站点、分类和片名，再选分集、线路。站点搜索使用掌机内置的 ASCII 键盘。分类和片名支持中文显示。

Windows 也可以运行 `.\ContinueBox-TVBox-Setup.exe setup` 检查订阅格式并生成地址文件。它只读取选定订阅的配置，以接口类型筛选站点，具体影片能否播放取决于站点的响应与视频格式。

## 兼容范围

- 点播 JSON 订阅和 `urls` 子订阅。支持接口类型 0（XML）、1（JSON）和 4（远程 API）的常见请求格式。
- 可直接播放的 HTTP(S) MP4、HLS 等视频交给 Wasabi。若某一条线路返回网页地址、需要自定义播放请求头或依赖网页解析，界面会提示切换线路。
- 仅含安卓 Spider/JAR、网页解析或网盘插件的订阅无法在此版本直接使用。此版本不做进度同步、弹幕或视频转码。
- 已使用模拟订阅测试站点、分类、分集和播放地址。RG34XX SP 的安装、按键和实际播放仍待实机验证。建议先试低码率 360p 或 480p 的 H.264 + AAC。

## 构建

安装 Go 和 Python 3.11 或更新版本，运行 `python package.py dist`。构建脚本生成 ARM64 安装包、Windows 配置工具和 SHA-256 校验文件。掌机使用系统的 SDL2、SDL2_ttf 和 Wasabi。
