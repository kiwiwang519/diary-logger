# 日记记录技能

自动记录日记到本地 Markdown 文件，支持可扩展的自定义标签。

## 功能
当用户输入以「记」开头的内容时，自动将消息保存到对应的日记目录，每天一个文件。

## 标签系统
```
记<标签名>: <内容>
记<标签名> <内容>
```

示例：
- `记工作: 今天完成了项目计划` → 保存到 `work/YYYY-MM-DD.md`
- `记生活 今天天气很好` → 保存到 `life/YYYY-MM-DD.md`
- `记思考 AI能教会吗？` → 保存到 `think/YYYY-MM-DD.md`

标签名会自动转换为小写，目录会自动创建。

## 目录结构
可通过 `~/.claude/diary-config.sh` 自定义：
```bash
DIARY_BASE_DIR="$HOME/.claude/diaries"
```

默认：
```
~/.claude/diaries/
├── work/
├── life/
└── <任意标签>/
```

## 文件格式
```markdown
# 2026-04-09 日记

## [14:30] #工作
今天完成了项目计划

## [15:00] #生活
今天天气很好
```

## 安装
1. 将本技能目录放置在 `~/.claude/skills/diary-logger/`
2. 在 Claude Code 的 `settings.json` 中配置 hook：

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
