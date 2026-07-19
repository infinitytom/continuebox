# 续映 ContinueBox

> **自用项目声明**：本项目为个人自用的 TVBoxOS 改造，按自己的使用习惯开发，功能可能多余或不够完善，不保证适配所有环境；仅同步播放记录元数据，不提供任何影视数据源。若对你有帮助，欢迎点个 Star 支持。

## 跨数据源观影进度

续映 0.2 的客户端会为影片生成不包含账号信息的内容指纹，并结合年份与分集编号匹配不同数据源中的同一内容。切换数据源后打开同名影片时，客户端会优先保留较新的本源记录；如果本源没有更新记录，则应用其他数据源最近同步的集数与播放位置。

- 片名会先做 Unicode、大小写、空格和标点归一化。
- 两边年份都明确且不一致时不会合并，避免同名翻拍误匹配。
- 分集优先识别“第 12 集”“EP12”“12”等编号，否则保守地使用集序号。
- Cookie、Token、播放地址均不参与内容指纹。
- 旧记录可由新版客户端从已有 `data_json` 补算指纹。

同步服务升级后会自动为现有 SQLite 数据库增加 `content_key`、`content_year` 和 `episode_key` 字段，不会删除原有账号或记录。飞牛 NAS 中进入 `sync-server` 目录重新执行 `sh install.sh` 即可更新。

## 低延迟播放时间同步

- 播放开始时优先拉取服务器上的最新位置。
- 播放中由播放器直接上报当前毫秒位置，局域网心跳约为 1.5 秒。
- 暂停、切集、播放完成、切换线路和退出时立即提交。
- 上传确认后立即反向拉取，减少两台电视交替观看时的竞态。
- 相同位置会在客户端合并，不会因为高频心跳重复写入。
- “我的 → 播放同步”可以查看最近成功时间、局域网往返耗时、待上传数量与自动重试状态，也可以手动同步。

![续映图标](assets/continuebox-icon.png)

续映是一个支持多设备播放记录同步的 Android TV 播放器，基于 TVBoxOS 改造。它将播放历史和进度同步到你自己的飞牛 NAS，多台电视使用同一账号即可接着观看。

> 本项目只同步播放记录元数据，不提供、代理或存储任何影视数据源。请仅使用拥有合法权限的内容。

## 主要功能

- 多台 Android TV / 电视盒子同步播放历史、分集和进度
- 播放过程中定期上传，退出播放时立即补传
- 网络失败后保留待上传状态，下次启动自动重试
- 进入详情与历史页面时自动拉取，完成后立即刷新
- 一个客户端保存多个同步服务器账号并快速切换
- Docker 一键部署，任意能跑 Docker 的主机均可（飞牛 / 群晖 / 威联通 / unRAID / 树莓派 / 云服务器），推荐通过 Tailscale 外网访问
- 服务端默认每个账号保留最近 30 条记录，可自行调整
- Trakt 电视设备码登录与播放状态自动上报
- NeoDB 扫码授权并同步影片“在看 / 看过”书架状态
- 同一飞牛账号自动同步网盘账号、接口地址和应用配置；Trakt/NeoDB 绑定也随飞牛账号生效
- 接入[弹弹play开放弹幕网络](https://www.dandanplay.com/)进行节目匹配和弹幕读取
- 支持向本应用在弹弹play托管的私有弹幕库发送弹幕；飞牛仅代理签名并做短期读取缓存
- 独立“评论 / 评价”列表，明确区分 TMDB 用户影评、Trakt 社区评论和 NeoDB 当前账号短评，不混入动态弹幕
- 可在详情页发布 NeoDB 当前账号短评/评分或 Trakt 社区评论；发布后立即刷新，且始终与动态弹幕分区
- 小雅 Emby 播放记录双向同步：官方 Playback Check-ins、可续播位置拉取、来源标记与回环抑制
- 小雅 Emby 支持用户账号直连：媒体库、详情和播放默认从电视直达 Emby，飞牛代理作为 `.strm` 与网络异常兜底

## Emby 直连

在“我的 → 小雅 Emby”选择直连，填写 Emby 地址、普通用户名和密码即可。密码只发送给该 Emby
服务器，成功换取用户 AccessToken 后立即丢弃；AccessToken 由应用加密保存在本机，不会编译进 APK，
也不会进入飞牛账号配置快照。管理员创建的 API 密钥仍可留在飞牛，用于代理兜底和跨设备进度同步。

直连不可用时，如果当前续映账号已经在飞牛配置 Emby，媒体库请求会自动回落到飞牛代理。任何 Emby
故障都不会阻塞 TVBox 播放记录、弹弹play、Trakt 或 NeoDB。

## 快速部署同步服务

服务端是标准 Docker 应用（`python:3.12-slim` + FastAPI + SQLite），**不依赖飞牛**：
群晖、威联通、unRAID、树莓派、云服务器、Windows/macOS Docker Desktop 都可以运行，
ARM 与 x86 均支持。下文以飞牛为例，其他系统步骤相同。

将 `sync-server` 目录复制到 NAS 或服务器，进入目录后执行：

```sh
sh install.sh
```

Windows 主机改用 `install.ps1`。脚本会自动识别 Compose V2（`docker compose`）
与 V1（`docker-compose`），生成随机密钥并启动服务。若部署在海外或需要走代理，
可在 `.env` 中把 `PIP_INDEX_URL` 改为 `https://pypi.org/simple`（默认是清华镜像）。

启动后在浏览器访问：

```text
http://NAS地址:8080/health
```

看到 `{"ok":true}` 即部署成功。建议先安装 Tailscale，再用 NAS 的 `100.x.x.x:8080` 地址连接；不要直接把 8080 端口暴露到公网。

## 配置 TMDB、弹弹play、Trakt 与 NeoDB

首次执行 `install.sh` 后，编辑 `sync-server/.env`：

```text
TMDB_READ_TOKEN=你的TMDB_API_Read_Access_Token
DANDAN_APP_ID=你的弹弹play应用AppId
DANDAN_APP_SECRET=两个有效AppSecret中的一个
DANDAN_CACHE_SECONDS=21600
TRAKT_CLIENT_ID=你的Trakt应用Client_ID
TRAKT_CLIENT_SECRET=你的Trakt应用Client_Secret
NEODB_API_BASE=https://neodb.social
NEODB_CLIENT_ID=你的NeoDB应用Client_ID
NEODB_CLIENT_SECRET=你的NeoDB应用Client_Secret
NEODB_REDIRECT_URI=urn:ietf:wg:oauth:2.0:oob
NEODB_VISIBILITY=2
# 可选：出站代理，仅用于 TMDB/Trakt/弹弹play/NeoDB 等外部接口，不影响局域网 Emby
# 例如 OUTBOUND_PROXY=http://192.168.1.2:7890 或 socks5h://192.168.1.2:7891
OUTBOUND_PROXY=
# 评论聚合结果缓存秒数（默认 900）
REVIEWS_CACHE_SECONDS=900
```

国内网络直连 `api.themoviedb.org`、`api.trakt.tv` 经常超时。若飞牛上有代理（如 Clash/mihomo），强烈建议配置 `OUTBOUND_PROXY`，评论、影评、演员资料的成功率会显著提升；演员/海报等 TMDB 图片也会由飞牛中转（`/api/v1/meta/image/...`），电视端无需翻墙。三个评论来源现在并行抓取并缓存，单个来源被墙不会拖垮整个评论接口。

也可以在飞牛终端运行 `sh set-integrations.sh`，按提示逐项输入。密钥输入时不会显示，脚本只会写入飞牛本地 `.env`；留空可保留已有值。

TMDB 用于中文元数据、外部 ID 匹配以及独立评论区中的 TMDB 用户影评。推荐在飞牛运行 `sh set-tmdb-token.sh` 安全输入 Read Access Token；输入不会显示，Token 不进入 APK。TMDB 未配置或暂时不可用时，只降级相应元数据和评论来源，不影响播放、弹幕或历史同步。

如果 NeoDB 尚未创建应用，可先运行 `sh register-neodb-app.sh`。脚本会在 `.env` 指定的 NeoDB 实例上创建“ContinueBox 续映”应用，并直接将凭证写回飞牛本地 `.env`，不会显示 Client Secret。

弹弹play需要在[开放弹幕网络开发者中心](https://dev.dandanplay.com/)注册账号、验证邮箱并完善资料，再在“应用管理”创建应用并提交审核。审核成功后会得到 AppId 和两个可轮换的 AppSecret；飞牛只需配置其中一个当前有效的 AppSecret，另一个请妥善保管。这里使用官方推荐的签名验证，AppSecret 只保存在飞牛的 `.env` 或容器变量中，不会进入 APK，也不要通过聊天、截图或日志发送。请保持飞牛系统时间自动同步，否则可能因时间偏差导致签名失败。API 地址使用默认的 `https://api.dandanplay.net`，无需也不应在 `.env` 中设置 `DANDAN_API_BASE`。

默认缓存时间为 21600 秒（6 小时），符合官方建议的 2–6 小时范围。匹配、搜索和获取弹幕属于公开接口；续映发送使用的是应用弹幕接口 `POST /api/v2/comment/{episodeId}/app`，并非普通用户 JWT 的受限发送接口。

应用弹幕由弹弹play按 AppId 托管在续映自己的私有应用弹幕库中，不会进入弹弹play官方公共弹幕池，也不会与其他应用的私有弹幕库互通。自 2026-06-25 起官方实行应用分层与额度管理：只有“社区合作”和“商业授权”层级拥有完整发送额度，其他层级仅有测试额度。因此应先验证匹配和读取；只有开发者中心显示当前应用层级支持时，再测试发送。

Trakt需要按[官方说明](https://docs.trakt.tv/docs/create-an-app)创建 API 应用并取得 Client ID 与 Client Secret。续映使用官方为电视、媒体中心等设备提供的 Device Code Flow，不需要把飞牛端口公开到公网。应用创建页中的 Redirect URI 可填写 `urn:ietf:wg:oauth:2.0:oob`。

NeoDB 是联邦式服务，默认连接 `https://neodb.social`。如果你的账号属于其他 NeoDB 实例，需要把 `NEODB_API_BASE` 改为该实例地址，并在同一实例创建应用。按照[NeoDB 官方 API 说明](https://neodb.net/api/)，应用 Redirect URI 使用 `urn:ietf:wg:oauth:2.0:oob`，取得 Client ID 与 Client Secret 后填入飞牛。电视端会显示二维码；手机授权后，将页面显示的授权码输入电视即可。`NEODB_VISIBILITY=2` 表示续映新建的书架状态默认采用最保守的私密可见性，并且不会自动发布到联邦时间线。

NeoDB 不提供 Trakt 式逐秒 scrobble：续映会在开始播放时把电影或剧集标为“在看”，电影播放到 90% 后标为“看过”；剧集不会因为单集结束就自动把整部剧标为“看过”。更新前会读取已有书架记录并保留评分、短评、标签和可见性；已经标为“看过”的条目不会被降回“在看”。

保存后重新执行：

```sh
sh install.sh
```

访问 `/health`，确认 `tmdb_configured`、`dandan_configured`、`trakt_configured` 与 `neodb_configured` 均为 `true`。续映登录飞牛账号后，先测试节目匹配和弹幕读取；只有应用层级和额度允许时，再使用控制栏的“发弹幕”测试私有应用弹幕库。自 0.11.0 起，用户发送的弹幕会同时写入飞牛本地弹幕库：即使应用弹幕额度不足导致上游发送失败，自己和同服务器的家人重新拉取弹幕时也能立即看到（返回字段 `sent_upstream` 表示是否成功写入弹弹play）。用户页分别点击 Trakt、NeoDB 状态卡完成账号绑定。

弹幕匹配在 0.11.0 也做了增强：会自动清洗片名中的【标签】、画质后缀等修饰词，先按“片名+集数”搜索，搜不到再退回“仅片名”搜索并按集数就近匹配；仍然匹配错误时，可在播放页长按“弹幕”手动输入 EpisodeId 纠正。

服务端同时提供 `GET /api/v1/danmaku/comments.ass`，将合并后的弹幕转换为 ASS 字幕，供后续 Emby 字幕提供插件或伴侣网页使用。接口仍要求飞牛账号令牌，不能匿名暴露到公网。

播放器会自动匹配并加载弹弹play动态弹幕，控制栏显示“匹配中 / 条数 / 暂无评论 / 未匹配”。短按“弹幕”可使用原搜索入口，长按可输入弹弹play EpisodeId 手动纠正关联；发送成功后会清除飞牛短期读取缓存并立即重新拉取。视频源自带弹幕时仍会继续尝试弹弹play，外部匹配失败则保留原来源。

详情页的“评论”是独立浏览列表，不是随时间轴滚动的弹幕。服务端会分别尝试 TMDB 用户影评、Trakt 社区评论和 NeoDB 当前绑定账号自己的短评/评分，并在每条内容前标明来源。NeoDB 当前 API 没有提供按影视条目批量浏览全部公开影评的等价接口，因此续映只读取当前授权账号有权访问的短评，不绕过可见性或 OAuth 权限。

## 配置小雅 Emby 双向进度

Android 1.7.0 起，续映首页提供重新设计的“小雅 Emby”媒体库，按继续观看、最近更新、电影库和剧集库分区展示。最近更新会把同一剧集的多个新分集折叠为剧集卡，继续观看则保留准确的季集和进度。Emby 内容沿用续映详情页、选集、播放器、动态弹幕和独立评论区；TVBox 站点仍保持原入口和原历史键，两类资源不会混写。播放前会调用 Emby 官方 PlaybackInfo 选择 MediaSource 和 PlaySession，并由飞牛代理 `.strm` 到外部 CDN 的跳转；跳出 Emby 主机时不会携带 API Key。海报和视频使用飞牛签发的短时访问地址，APK 不接触 Emby Token。视频网关支持 Range 与 HEAD 请求，任一 Emby 目录、海报、视频、弹幕或评论请求失败时只降级对应功能，不阻塞 TVBox 播放与 `TvboxSyncClient`。

先升级并启动同步服务，再在飞牛 `sync-server` 目录运行：

```sh
sh set-emby.sh
```

先在 Emby 管理界面的“高级 → 安全 → API 密钥”中新建一个名为 `ContinueBox` 的专用密钥。脚本只要求输入 Emby 地址和这个 API 密钥，随后会自动读取用户列表；你直接选择播放记录归属的用户，不需要查找 UserId，也不需要输入 Emby 密码或 PIN。API 密钥输入不显示，只会使用 `TOKEN_SECRET` 派生密钥加密保存到 `data/tvbox-sync.db`，不会写入 APK、账号配置快照或聊天记录。每个续映账号可绑定自己的 Emby 用户；停用时可在 Emby 管理界面单独撤销该密钥。

续映优先使用 Emby 源自身 ItemId；其他 TVBox 源依次按 TMDB / IMDb ID、片名+年份+季集号匹配。开始、约每 10 秒进度、暂停和停止分别通过 Emby 官方 `/Sessions/Playing`、`/Sessions/Playing/Progress`、`/Sessions/Playing/Stopped` 上报，毫秒会换算为 ticks（1 ms = 10,000 ticks）。开始播放前会读取 Emby `UserData.PlaybackPositionTicks/Played` 作为续播候选；本地与 Emby 状态带来源、版本和时间戳，刚从一端导入的状态在 30 秒内不会立即写回，避免无限互写。

实现依据：[Emby Playback Check-ins](https://dev.emby.media/doc/restapi/Playback-Check-ins.html)、[Browsing the Library](https://dev.emby.media/doc/restapi/Browsing-the-Library.html) 和 [Playstate API](https://dev.emby.media/reference/RestAPI/PlaystateService.html)。Emby 调用与 Trakt、NeoDB、弹幕、TvboxSyncClient 完全隔离；匹配失败、401、超时或服务离线都不会阻止视频播放和主同步。

0.11.0 的 Emby 展示修复：从“继续观看/最近更新”点进单集时，详情页会自动跳到所属剧集并展示完整选集列表（此前只显示一集，历史记录也因此串位）；单集卡片改用剧名和剧集竖版封面（单集通常没有竖版海报，之前显示空白）；直连模式下“最近更新”同样按剧集折叠；“电影库/剧集库”自动分页加载全部条目（此前最多 120 个，导致数量与刮削结果不符）。

0.12.0（客户端 1.10.0）更新：小雅 Emby 加入全局搜索——服务端新增 `/api/v1/emby/search`，直连模式直接查询 Emby，全局搜索会自动带上“小雅 Emby”源，电影和剧集都能搜到。评论弹窗会显示三个来源各自的抓取状态和失败原因（飞牛端未配置密钥/未绑定账号/上游不可用），弹幕获取失败时也会以 Toast 提示原因，不再静默显示“暂无”。续播稳定性：起播后 15 秒宽限期内，明显低于历史进度的播放位置视为“尚未跳转完成”，不再上报也不落盘，修复了偶发的“每次都从头开始”；同时小雅 Emby 进度改为只上传、不回拉覆盖本地，续播进度一律以飞牛同步服务器为准。

## 客户端使用

1. 安装 APK，在“我的”页面打开“播放记录同步”。
2. 输入 NAS 地址（如 `100.x.x.x:8080`）、用户名和至少 8 位密码。
3. 首台设备选择注册，其他设备使用同一账号登录。
4. 跨数据源匹配优先使用片名、年份和分集指纹；如遇同名翻拍或错误集数，应进行人工确认。

从 1.4.0 开始，首次登录的设备会把现有网盘账号、接口地址和应用配置保存到当前飞牛账号；其他设备登录同一账号后会自动取回并重新载入。之后本机配置有变化时会在一分钟内同步。设备编号、播放上报队列、重试状态等临时数据不会跨设备复制。Trakt 与 NeoDB 的 OAuth 令牌以及 Emby Token 始终只保存在飞牛服务端，客户端只读取绑定状态。

首次注册完成后，建议在 `sync-server/.env` 将 `ALLOW_REGISTER` 改为 `false`，再运行 `docker compose up -d`。

## 本地构建

需要 JDK 17 与 Android SDK。Windows 示例：

```powershell
./gradlew.bat :app:assembleJava64Debug
```

APK 输出到 `app/build/outputs/apk/`。服务端测试：

```sh
cd sync-server
python -m pip install -r requirements-dev.txt
python -m pytest -q
```

## 数据与隐私

数据库位于 `sync-server/data/tvbox-sync.db`，备份整个 `data` 目录即可。账号密码使用 scrypt 加盐哈希保存，登录令牌使用服务端密钥签名，Trakt 与 NeoDB OAuth 令牌、Emby Token、网盘账号及配置快照均使用 `TOKEN_SECRET` 派生密钥加密后保存。同步内容可能包含网盘登录资料、接口地址、片名、分集、进度及客户端保存的历史详情；飞牛仅短期缓存从上游读取的弹幕和评论响应，不建立本地弹幕池，也不持久化用户发送的弹幕。请保护 NAS、`.env` 和备份文件；更换 `TOKEN_SECRET` 会使已有加密资料无法解密。

## 鸣谢与许可

客户端基于 [TVBoxOS](https://github.com/q215613905/TVBoxOS) 开发，沿用原项目许可证，详见 [LICENSE](LICENSE)。第三方组件与数据源各自遵循其许可证及使用条款。

## 支持项目

如果续映对你有帮助，可以请作者喝杯咖啡：

![支付宝赞赏码](assets/alipay-donate.jpg)

## 已知问题

- 收藏和独立数据库内容仍不会随账号同步；网盘账号、接口地址和 Hawk 应用配置已经支持同步。
- 直接被系统强制终止时，最后一次上传会在下次启动自动补传，不能保证当次立即送达。
- 多设备同时修改同一影片进度时，以更新时间较新的记录为准。
- 同步依赖相同的数据源标识与影片、分集 ID；不同源或源内容变动后可能无法匹配历史。
- 当前 APK 为调试签名版本，适合自行部署和测试；正式长期分发前应更换为独立发布签名。

## 后续计划

- [ ] 增加可见的同步状态、错误提示和手动重试入口。
- [ ] 支持同步收藏、搜索记录与更完整的播放偏好。
- [ ] 支持冲突提示与可选的“以本机/以服务器为准”处理。
- [ ] 增加 HTTPS、反向代理和数据库备份恢复指引。
- [ ] 发布正式签名安装包，并完善版本更新与迁移流程。
## 友情链接
- [linux.do](https://linux.do) 中文geek社区
