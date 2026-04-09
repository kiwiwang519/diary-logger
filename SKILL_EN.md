# Diary Logger Skill

Automatically records diary entries to local Markdown files with an extensible tag system.

## Features
When user input starts with `diary`, the message is automatically saved to the corresponding diary directory, one file per day.

## Tag System
```
diary <tag>: <content>
diary <tag> <content>
```

Examples:
- `diary work: Completed project plan` → saved to `work/YYYY-MM-DD.md`
- `diary life Nice weather today` → saved to `life/YYYY-MM-DD.md`
- `diary think Can AI be taught?` → saved to `think/YYYY-MM-DD.md`

Tag names are automatically converted to lowercase, and directories are created automatically.

## Configuration

Create `~/.claude/diary-config.sh` to customize behavior:

```bash
# Custom diary root directory
DIARY_BASE_DIR="$HOME/.claude/diaries"

# Custom trigger prefix (default: diary)
TRIGGER_PREFIX="diary"
```

## Directory Structure
```
~/.claude/diaries/
├── work/
├── life/
└── <any-custom-tag>/
```

## File Format
```markdown
# 2026-04-09 Diary

## [14:30] #work
Completed the project plan

## [15:00] #life
Nice weather today
```

## Installation
Add hook to Claude Code's `settings.json`:

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
./diary-logger.sh "diary work: This is a test entry"
```
