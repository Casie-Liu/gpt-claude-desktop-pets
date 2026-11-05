# 安装原生桌宠

适用于支持自定义原生宠物的 **Codex 桌面版**。本包的文件格式和加载方式已按 Windows 版 `26.1029.7803.0` 的本地加载器核对；其他版本的界面名称和支持情况可能不同。本包不是独立桌宠应用，也不是通用 ChatGPT 桌面版安装程序。

## Windows

1. 在仓库页面选择 **Code → Download ZIP**，或者下载 Releases 中的完整 ZIP，并先解压。
2. 打开解压后的文件夹，在空白处右键选择“在终端中打开”。
3. 执行下面的命令。无需管理员权限；执行策略设置只对这一进程有效。

   ```powershell
   powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-windows.ps1
   ```

4. 打开 Codex **设置 → 宠物（Pets / Mini & Pets）→ 刷新（Refresh）**，选择 GPT娘或 Claude娘，并开启悬浮宠物。如果未出现，请完全退出后重开 Codex。

安装脚本默认把两个文件夹复制到 `%USERPROFILE%\.codex\pets`。如果环境变量 `CODEX_HOME` 已设置，使用该目录下面的 `pets`。脚本不修改当前宠物选择、账户配置或系统设置；相同版本重复执行会跳过，不同的同名文件夹会停止安装并提示先重命名。

若使用自定义 Codex 数据目录，可以显式指定：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-windows.ps1 -CodexHome 'D:\CodexData'
```

只想检查将要做什么，可以添加 `-WhatIf`。

## 手动安装

将本仓库 `pets` 文件夹内的 `gpt-niang` 和 `claude-niang` 两个完整文件夹，复制到你实际使用的 Codex 数据目录的 `pets` 下。保留每个文件夹内的 `pet.json`、图集和许可文件。

默认目录如下；设置了 `CODEX_HOME` 时，以它为准。

| 环境 | 默认目录 |
| --- | --- |
| Windows | `%USERPROFILE%\.codex\pets` |
| macOS / Linux | `~/.codex/pets` |

WSL 或自定义启动环境可能使用不同的用户目录，需要选择运行 Codex 时实际使用的数据目录。macOS / Linux 的桌面功能未在本项目中进行实机安装验证。

安装后应得到：

```text
<Codex 数据目录>/pets/
├── gpt-niang/
│   ├── pet.json
│   ├── spritesheet.webp
│   └── LICENSE
└── claude-niang/
    ├── pet.json
    └── spritesheet.png
```

随后在原生宠物设置中刷新并选择角色。支持云宠物的版本可能把本地宠物迁移到你自己的账户中；不需要也不应复制他人的云宠物 ID。

## 常见情况

- **设置中没有宠物入口**：当前客户端或账户可能未提供该原生功能。本包不能单独增加客户端功能。
- **复制后看不到角色**：确认没有多套一层文件夹，且 `pet.json` 与图集在同一目录；检查 `CODEX_HOME`，再刷新或重启。
- **角色较小**：在原生设置中的 Customize / 自定义 → Pet size / 宠物大小调整。
- **放大后出现像素感**：这是每格 `192×208` 的原生动画素材，单纯拉大尺寸不会增加细节。本仓库没有把放大图片标成高清升级。
- **没有喂食、背包或聊天服务设置**：本包只提供角色和动画。窗口、任务、视线等行为由宿主的原生功能驱动。

## 取消本地安装

先在原生设置中选用其他角色，再手动移走你复制的 `gpt-niang`、`claude-niang` 文件夹并刷新。如果客户端已经将角色迁移到云端，还需要使用原生宠物管理入口删除相应云角色。不要删除整个 Codex 数据目录。
