# Diary Logger Skill

Automatically records diary entries to local Markdown files with an extensible tag system.

## Features
When user input starts with 「记」, the message is automatically saved to the corresponding diary directory, one file per day.

## Tag System
```
记<tag>: <content>
记<tag> <content>
```

Examples:
- `记工作: Completed project` → saved to `work/YYYY-MM-DD.md`
- `记生活 Nice weather today` → saved to `life/YYYY-MM-DD.md`
- `记思考 Can AI be taught?` → saved to `think/YYYY-MM-DD.md`

Tag names are automatically converted to lowercase, and directories are created automatically.

## Directory Structure
Customizable via `~/.claude/diary-config.sh`:
```bash
DIARY_BASE_DIR="$HOME/.claude/diaries"
```

Default:
```
~/.claude/diaries/
├── work/
├── life/
└── <any-custom-tag>/
```

## File Format
```markdown
# 2026-04-09 Diary

## [14:30] #工作
Completed the project plan

## [15:00] #生活
Nice weather today
```

## Installation
1. Place this skill directory at `~/.claude/skills/diary-logger/`
2. Add hook to Claude Code's `settings.json`:

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

## Manual Testing
```bash
./diary-logger.sh "记工作: This is a test entry"
```
