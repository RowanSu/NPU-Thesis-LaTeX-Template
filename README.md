# NPU-Thesis-LaTeX-Template

西北工业大学硕士、博士学位论文LaTeX模板，支持学术学位、专业学位及盲评版本。

本项目面向Overleaf与本地环境进行了完整适配：项目内已包含模板、字体和编译配置，导入后即可编译，无需手动安装额外宏包、配置字体路径或切换编译器。**Overleaf免费版即可完成全文编译。**

## ✨ 主要特性

- 支持硕士与博士学位论文。
- 支持学术学位与专业学位。
- 支持正常版本与盲评版本。
- 支持中英文封面、摘要、目录、图表目录、术语表、符号表、参考文献和附录。
- 同时适配Overleaf与本地TeX Live环境。
- 内置XeLaTeX、参考文献及辅助文件清理配置。
- 随项目提供所需字体，避免不同设备造成排版差异。

## 🚀 快速开始

### ☁️ Overleaf

- 下载本项目的ZIP压缩包。
- 在[Overleaf](https://www.overleaf.com/)中选择**New Project→Upload Project**。
- 上传压缩包并打开项目。
- 点击**Recompile**。

项目已内置XeLaTeX编译配置，无需调整Overleaf的编译器或其他项目选项。普通免费账户即可使用。

### 💻 本地环境

本地使用前仅需安装较新的TeX Live，以及VS Code的LaTeX Workshop扩展。打开项目文件夹后，编辑`nputhesis-sample.tex`，按`Ctrl+Alt+B`即可编译。

仓库内的`.vscode/settings.json`已配置XeLaTeX编译流程与辅助文件自动清理，无需额外修改VS Code设置。

## ⚙️ 论文版本设置

在`nputhesis-sample.tex`顶部修改文档类参数：

```latex
\documentclass[degree=master, academic=false, blindreview=false, adobe=false]{nputhesis}
```

参数说明：

| 参数          | 可选值         | 含义              |
| ------------- | -------------- | ----------------- |
| `degree`      | `master`/`phd` | 硕士/博士         |
| `academic`    | `true`/`false` | 学术学位/专业学位 |
| `blindreview` | `true`/`false` | 盲评版/正常版     |

## 📁 项目结构

```text
├── nputhesis-sample.tex    # 论文主文件
├── nputhesis.cls           # 文档类与版式定义
├── reference.bib           # 参考文献数据库
├── abst/                   # 中英文摘要
├── chapters/               # 正文、附录及后置内容
├── figures/                # 图片资源
└── fonts/                  # 模板字体
```

## 📚 致谢与引用

本项目基于以下开源模板修改和扩展：

> Shen, S., Wang, Z., Zhang, J., & Zhang, W. (2019). _Yet Another LaTeX Template for NPU Thesis_. DOI: [10.5281/zenodo.4159248](https://doi.org/10.5281/zenodo.4159248). Repository: [NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis](https://github.com/NWPUMetaphysicsOffice/Yet-Another-LaTeX-Template-for-NPU-Thesis).

当前版本进一步调整了模板结构、字体加载和编译配置，以提高Overleaf与本地环境之间的一致性。

此外，还有其他LaTeX模板可以使用：

- [LaTeX-Template-For-NPU-Thesis](https://github.com/polossk/LaTeX-Template-For-NPU-Thesis)
- [LaTeX-NewTemplate-For-NPU-undergraduate-Thesis](https://github.com/jialinlvcn/LaTeX-NewTemplate-For-NPU-undergraduate-Thesis)
- [NWPU-Thesis-Template](https://github.com/lihanshu/NWPU-Thesis-Template)
- [nwputhesis](https://github.com/1195343015/nwputhesis)

## 🔤 字体说明

项目内字体仅用于保证论文排版效果及跨平台一致性，相关字体版权归原权利人所有。使用者在公开发布、商业使用或正式印刷前，应自行确认相应字体的授权范围。

## 📮 联系方式

如在使用过程中遇到问题，欢迎提交 Issue 或通过邮件联系：`suws0616@gmail.com`。
