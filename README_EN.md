# Diary Logger

A lightweight CLI diary tool with an extensible tag system and fully local storage.

## Features

- **Extensible Tag System** - Use `diary <tag>` format to record with any custom tag
- **Fully Local Storage** - Data saved locally, never uploaded to any server
- **Markdown Format** - One `.md` file per day, easy to read and edit
- **Claude Code Integration** - Works seamlessly via hook

## Usage

### Basic Usage

```bash
./diary-logger.sh "diary work: Today I completed the project plan"
./diary-logger.sh "diary life The weather is nice today"
./diary-logger.sh "diary think Can AI be taught?"
```

### Tag Format

```
diary <tag>: <content>
diary <tag> <content>
```

Examples:
- `diary work: Completed project` → saved to `work/YYYY-MM-DD.md`
- `diary life Nice weather` → saved to `life/YYYY-MM-DD.md`
- `diary think Can AI be taught?` → saved to `think/YYYY-MM-DD.md`

### Output Format

```markdown
# 2026-04-09 Diary

## [14:30] #work
Today I completed the project plan

## [15:00] #life
The weather is nice today
```

## Configuration

Create `~/.claude/diary-config.sh` to customize behavior:

```bash
# Custom diary root directory
DIARY_BASE_DIR="$HOME/.claude/diaries"

# Custom trigger prefix (default: diary)
TRIGGER_PREFIX="diary"
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
./diary-logger.sh "diary work: This is a test entry"
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
