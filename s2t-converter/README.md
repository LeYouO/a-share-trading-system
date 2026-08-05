# 简繁转换器（Simplified ⇄ Traditional Chinese）

一个零后端、单文件的简体 ⇄ 繁体中文转换工具，界面简洁、操作直观。

## 功能
- 方向切换：简体 → 繁体 / 繁体 → 简体
- 繁体变体：台湾繁体（推荐）/ 标准繁体 / 香港繁体
- 实时转换、一键复制、清空、互换、载入示例
- 双向字数统计、移动端自适应

## 技术说明
- 纯静态单页应用，无任何后端，转换在浏览器本地完成。
- 转换引擎：[OpenCC](https://github.com/BYVoid/OpenCC)（opencc-js），通过 jsDelivr CDN 加载，词库已打包进 JS。
- 首次打开需联网以加载 opencc-js；之后浏览器会缓存。

## 部署到 GitHub Pages
1. 在 GitHub 新建一个仓库（如 `s2t-converter`）。
2. 将本目录下的 `index.html`、`.nojekyll`、`README.md` 上传到仓库根目录（main 分支）。
3. 仓库 Settings → Pages → Source 选择 `Deploy from a branch` → 分支 `main`、目录 `/ (root)` → Save。
4. 约 1 分钟后访问 `https://<你的用户名>.github.io/<仓库名>/` 即可。

> 提示：若希望彻底离线（断网也能转换），可把 opencc-js 词库内联进 HTML，联系作者获取离线版。
