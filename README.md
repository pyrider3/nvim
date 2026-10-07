# NEON Neovim

基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的个人 Neovim 配置，使用 TokyoNight Night 和自定义霓虹配色。

## 界面与功能

- 透明背景、青色浮窗边框、随编辑模式变色的光标。
- 自定义 Lualine 状态栏、文件名与代码符号面包屑。
- NEON 首页、最近文件与项目入口；安装 `lavat` 后显示动态效果。
- 代码上下文、彩虹括号、行内诊断和 Markdown 渲染。
- Markdown 默认关闭拼写检查，避免中文正文出现拼写波浪线。
- `<leader>uz` 切换专注模式；`<leader>um` 切换代码缩略图。

## 安装

先备份已有的 `~/.config/nvim`，再克隆：

```sh
git clone https://github.com/pyrider3/nvim.git ~/.config/nvim
nvim
```

私有仓库需要先登录 GitHub，或使用已授权的 SSH 密钥克隆。
运行环境要求见 [LazyVim 安装文档](https://www.lazyvim.org/installation)。建议使用支持真彩色的终端和 Nerd Font；`lavat` 为可选工具。

终端壁纸、透明度和字体由终端配置控制，不包含在此仓库中。

## 配置位置

- `lua/plugins/neon.lua`：主题、高亮和首页标题。
- `lua/plugins/cockpit.lua`：状态栏、导航、诊断和阅读界面。
- `lua/config/options.lua`：编辑器选项。
- `lua/config/autocmds.lua`：Markdown 拼写设置与视觉反馈。
- `lazy-lock.json`：插件版本锁。
- `backups/`：之前的配色备份。

基于 LazyVim starter，保留原 Apache-2.0 许可证。
