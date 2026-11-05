# GPT娘 & Claude娘 · 原生桌宠素材

两只可以陪伴工作的同人桌宠：白发紫瞳的 GPT 龙娘，以及橙发、抱着书本的 Claude 娘。这里整理了原生宠物动画图集、预览、安装说明，以及 Claude 娘的设计参考和生成提示词，方便朋友下载使用或继续制作。

适用于支持自定义原生宠物的 **Codex 桌面版**；安装后在原生宠物设置中选择角色。

| GPT娘 | Claude娘 |
| --- | --- |
| ![GPT娘待机动画](previews/gpt-niang/idle.webp) | ![Claude娘待机动画](previews/claude-niang/states/idle.gif) |

## 下载与使用

1. 点击仓库右上方的 **Code → Download ZIP**，下载后先解压。
2. 按照[安装指南](docs/install.md)安装并在应用内选择宠物。Windows 用户可使用指南中的安装脚本。
3. 想先看动作，可以打开[Claude娘完整状态预览](previews/claude-niang/all-states.gif)或[视频预览](previews/claude-niang/all-states.mp4)。

仓库地址：[Casie-Liu/gpt-claude-desktop-pets](https://github.com/Casie-Liu/gpt-claude-desktop-pets)。

## 包含什么

| 目录 | 内容 |
| --- | --- |
| `pets/gpt-niang/` | GPT娘的配置、原生动画图集和上游 MIT 许可证 |
| `pets/claude-niang/` | Claude娘的配置和原生动画图集 |
| `previews/` | 两只角色的静态、动画预览；Claude娘另有逐状态预览 |
| `design/claude-niang/` | Claude娘的角色参考、原始动画条、布局参考和生成提示词 |
| `docs/` | 安装指南与设计说明 |
| `scripts/` | 安装辅助脚本 |

两只角色使用 v2 扩展图集。Claude娘包含九组状态动作和十六个转头方向，共 73 帧。任务状态、拖动和窗口交互由支持该格式的宿主应用提供，具体表现取决于应用版本。

本资源包只提供原生桌宠外观与动画，不包含独立的喂食、养成或小游戏界面，也不会连接聊天服务或切换宿主使用的 AI 模型。最终图集保持原生尺寸；放大显示的清晰度仍受单帧尺寸和宿主渲染方式影响。

## 继续设计

参见[设计与素材说明](docs/design.md)。原始动画条和提示词可用于理解制作过程；实际安装请使用 `pets/` 内的最终图集。

## 来源与署名

GPT娘素材来自 [weit0529/gpt-pet](https://github.com/weit0529/gpt-pet)，保留上游 MIT 许可证。Claude娘动画使用内置图像工具生成，角色设计参考中文社区的 ZipZipPipe 同人形象。

完整来源和各部分许可说明见 [ATTRIBUTION.md](ATTRIBUTION.md)。本项目为个人整理的同人素材分享，未获得 OpenAI 或 Anthropic 的官方背书。
