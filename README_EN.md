# Diary Logger

A lightweight CLI diary tool with an extensible tag system and fully local storage.

## Features

- **Extensible Tag System** - Use `记<tag>` format to record with any custom tag
- **Fully Local Storage** - Data saved locally, never uploaded to any server
- **Markdown Format** - One `.md` file per day, easy to read and edit
- **Claude Code Integration** - Works seamlessly via hook

## Usage

### Basic Usage

```bash
./diary-logger.sh "记工作: Today I completed the project plan"
./diary-logger.sh "记生活 The weather is nice today"
./diary-logger.sh "记思考 Can AI be taught?"
```

### Tag Format

```
记<tag>: <content>
记<tag> <content>
```

Examples:
- `记工作: Completed project` → saved to `work/YYYY-MM-DD.md`
- `记生活 Nice weather` → saved to `life/YYYY-MM-DD.md`
- `记思考 Can AI be taught?` → saved to `think/YYYY-MM-DD.md`

### Output Format

```markdown
# 2026-04-09 Diary

## [14:30] #工作
Today I completed the project plan

## [15:00] #生活
The weather is nice today
```

## Configuration

Create `~/.claude/diary-config.sh` to customize behavior:

```bash
# Custom diary root directory
DIARY_BASE_DIR="$HOME/.claude/diaries"

# Default tag (optional)
DEFAULT_TAG="work"
```

## Claude Code Integration

Add to your `settings.json`:

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

## Directory Structure

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
