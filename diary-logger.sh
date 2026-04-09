#!/bin/bash
# 日记记录脚本
# 支持可扩展的标签系统
# 用法: ./diary-logger.sh "用户消息"
#
# 标签格式: 记<标签名>: <内容> 或 记<标签名> <内容>
# 示例:
#   记工作: 今天完成了项目
#   记生活 今天天气很好
#   记思考 AI能教会吗？
#
# 配置文件: ~/.claude/diary-config.sh (可选)
#   DIARY_BASE_DIR="$HOME/.claude/diaries"
#   DEFAULT_TAG="work"

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="$HOME/.claude/diary-config.sh"

# 加载配置（如果存在）
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
fi

# 默认配置
DIARY_BASE_DIR="${DIARY_BASE_DIR:-$HOME/.claude/diaries}"

# 用户输入的消息
MESSAGE="$1"

if [ -z "$MESSAGE" ]; then
    exit 0
fi

# 检查消息是否以「记」开头
if [[ "$MESSAGE" != "记"* ]]; then
    exit 0
fi

# 解析标签
# 支持格式: 记<标签名>: 内容 或 记<标签名> 内容
if [[ "$MESSAGE" =~ ^记([^:：\ ]+)[：:]?\ *(.*)$ ]]; then
    TAG="${BASH_REMATCH[1]}"
    CONTENT="${BASH_REMATCH[2]}"
else
    # 兼容旧格式: 记工作 或 记生活
    TAG="${MESSAGE:1}"
    CONTENT=""
fi

# 转换为小写作为目录名
TAG_DIR_NAME=$(echo "$TAG" | tr '[:upper:]' '[:lower:]')
TAG_DIR="$DIARY_BASE_DIR/$TAG_DIR_NAME"

# 如果没有内容，说明只有标签，取剩余部分
if [ -z "$CONTENT" ]; then
    CONTENT="${MESSAGE:$((${#TAG}+1))}"
    CONTENT="${CONTENT#:}"
    CONTENT="${CONTENT# }"
fi

# 确保目录存在
mkdir -p "$TAG_DIR"

# 获取当前日期和时间
CURRENT_DATE=$(date +"%Y-%m-%d")
CURRENT_TIME=$(date +"%H:%M")

# 日记文件路径
DIARY_FILE="$TAG_DIR/$CURRENT_DATE.md"

# 创建或追加到日记文件
{
    if [ ! -f "$DIARY_FILE" ] || [ ! -s "$DIARY_FILE" ]; then
        echo "# $CURRENT_DATE 日记"
        echo ""
    fi

    echo "## [$CURRENT_TIME] #$TAG"
    echo "$CONTENT"
    echo ""
} >> "$DIARY_FILE"

echo "日记已记录: $TAG_DIR_NAME/$CURRENT_DATE.md" >&2
