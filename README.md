# 日记技能

一个轻量级的 CLI 日记工具，支持可扩展的标签系统，完全本地存储。

## 功能特性

- **可扩展标签系统** - 使用 `记<标签>` 格式记录，支持任意自定义标签
- **完全本地存储** - 数据保存在本地文件，不上传任何服务器
- **Markdown 格式** - 每日一个 `.md` 文件，方便阅读和编辑
- **Claude Code 集成** - 可通过 hook 与 Claude Code 无缝配合

## 使用方法

### 基础用法

```bash
./diary-logger.sh "记工作: 今天完成了项目计划"
./diary-logger.sh "记生活 今天天气很好"
./diary-logger.sh "记思考 AI能教会吗？"
```

### 标签格式

```
记<标签名>: <内容>
记<标签名> <内容>
```

示例：
- `记工作: 今天完成了项目` → 保存到 `work/YYYY-MM-DD.md`
- `记生活 今天天气很好` → 保存到 `life/YYYY-MM-DD.md`
- `记思考 AI能教会吗？` → 保存到 `think/YYYY-MM-DD.md`

### 输出格式

```markdown
# 2026-04-09 日记

## [14:30] #工作
今天完成了项目计划

## [15:00] #生活
今天天气很好
```

## 配置

创建配置文件 `~/.claude/diary-config.sh` 来自定义行为：

```bash
# 自定义日记存储根目录
DIARY_BASE_DIR="$HOME/.claude/diaries"

# 默认标签（可选）
DEFAULT_TAG="work"
```

## 安装到 Claude Code

在 `settings.json` 中添加 hook：

```json
{
  "hooks": {
    "user-prompt-submit": [
      {
        "command": "bash",
        "args": ["/path/to/diary-logger.sh", "{{prompt}}"]
      }
    ]
  }
}
```

## 手动测试

```bash
./diary-logger.sh "记工作: 这是一条测试日记"
```

## 目录结构

```
~/.claude/diaries/
├── work/
│   ├── 2026-04-09.md
│   └── 2026-04-10.md
├── life/
│   └── 2026-04-09.md
└── think/
    └── 2026-04-09.md
```

## License

MIT
