# 日记记录技能

自动记录日记到本地 Markdown 文件，支持可扩展的自定义标签。

## 功能
当用户输入以 `diary` 开头的内容时，自动将消息保存到对应的日记目录，每天一个文件。

## 标签系统
```
diary <标签名>: <内容>
diary <标签名> <内容>
```

示例：
- `diary work: 今天完成了项目计划` → 保存到 `work/YYYY-MM-DD.md`
- `diary life 今天天气很好` → 保存到 `life/YYYY-MM-DD.md`
- `diary think AI能教会吗？` → 保存到 `think/YYYY-MM-DD.md`

标签名会自动转换为小写，目录会自动创建。

## 配置

创建 `~/.claude/diary-config.sh` 来自定义行为：

```bash
# 自定义日记存储根目录
DIARY_BASE_DIR="$HOME/.claude/diaries"

# 自定义触发词（可选，默认 diary）
TRIGGER_PREFIX="diary"
```

## 目录结构
```
~/.claude/diaries/
├── work/
├── life/
└── <任意标签>/
```

## 文件格式
```markdown
# 2026-04-09 日记

## [14:30] #work
今天完成了项目计划

## [15:00] #life
今天天气很好
```

## 安装
在 Claude Code 的 `settings.json` 中添加 hook：

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
./diary-logger.sh "diary work: 这是一条测试日记"
```
