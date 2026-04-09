# 日记记录技能

自动记录工作和生活日记到本地Markdown文件。

## 功能
当用户输入以「记工作」或「记生活」开头的消息时，自动将消息原文保存到对应的日记目录中，每天一个文件。

## 目录结构
- 工作日记：`~/.claude/diaries/work/`
- 生活日记：`~/.claude/diaries/life/`

## 文件命名
文件按日期命名，格式为 `YYYY-MM-DD.md`，例如 `2026-04-02.md`。

## 记录格式
在对应的日期文件中，追加以下格式的内容：
```
## [HH:MM]
用户输入的消息原文
```

## 安装说明
1. 确保 `~/.claude/diaries/` 目录存在
2. 将本技能目录放置在 `~/.claude/skills/` 下
3. 在 Claude Code 的 settings.json 中配置钩子（hook）以调用本技能

## 钩子配置示例
在 `settings.json` 中添加：
```json
{
  "hooks": {
    "user-prompt-submit": [
      {
        "command": "bash",
        "args": ["/Users/wanglexin/.claude/skills/diary-logger/diary-logger.sh", "{{prompt}}"]
      }
    ]
  }
}
```

## 手动测试
可以运行测试脚本：
```bash
cd ~/.claude/skills/diary-logger
./diary-logger.sh "记工作 今天完成了项目计划"
```