#!/usr/bin/env bash
set -euo pipefail

# ============================================================================
# New Project Scaffolding
# ============================================================================
# Creates a new project repo pre-wired with a GOVERNANCE.md that links back to
# your PM governance repository (this repo). Run it from the parent directory
# where you want the new project folder created:
#
#   bash /path/to/pm-template/scripts/init-project.sh
# ============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/templates"
TODAY="$(date +%Y-%m-%d)"

BOLD='\033[1m'; CYAN='\033[0;36m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

echo ""
echo -e "${CYAN}${BOLD}== New Project Scaffolding — governance powered by your PM repo ==${NC}"
echo ""

# --- Collect inputs ---

read -rp "$(echo -e "${BOLD}PM governance repo URL${NC} (e.g. https://github.com/your-org/your-pm): ")" PM_REPO_URL
PM_REPO_URL="${PM_REPO_URL:-<YOUR-PM-REPO-URL>}"

read -rp "$(echo -e "${BOLD}Project name${NC}: ")" PROJECT_NAME
[[ -z "$PROJECT_NAME" ]] && { echo "Error: Project name is required." >&2; exit 1; }

DEFAULT_SLUG="$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g; s/--*/-/g; s/^-//; s/-$//')"
read -rp "$(echo -e "${BOLD}Project slug${NC} [$DEFAULT_SLUG]: ")" PROJECT_SLUG
PROJECT_SLUG="${PROJECT_SLUG:-$DEFAULT_SLUG}"

read -rp "$(echo -e "${BOLD}Team / department${NC}: ")" TEAM
TEAM="${TEAM:-Cross-team}"

read -rp "$(echo -e "${BOLD}Project lead${NC} (first name): ")" LEAD
LEAD="${LEAD:-TBD}"

read -rp "$(echo -e "${BOLD}One-line description${NC}: ")" PROJECT_DESCRIPTION
[[ -z "$PROJECT_DESCRIPTION" ]] && { echo "Error: Description is required." >&2; exit 1; }

# --- Confirm ---

echo ""
echo -e "${YELLOW}${BOLD}Review:${NC}"
echo -e "  PM repo:     $PM_REPO_URL"
echo -e "  Project:     ${BOLD}$PROJECT_NAME${NC}"
echo -e "  Slug:        $PROJECT_SLUG"
echo -e "  Team:        $TEAM"
echo -e "  Lead:        $LEAD"
echo -e "  Description: $PROJECT_DESCRIPTION"
echo -e "  Location:    $(pwd)/$PROJECT_SLUG"
echo ""
read -rp "Proceed? (y/n): " CONFIRM
[[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]] && { echo "Cancelled."; exit 0; }

# --- Create project directory ---

PROJECT_DIR="$(pwd)/$PROJECT_SLUG"
[[ -d "$PROJECT_DIR" ]] && { echo "Error: $PROJECT_DIR already exists." >&2; exit 1; }
mkdir -p "$PROJECT_DIR"

render() {
  sed \
    -e "s|{{PM_REPO_URL}}|$PM_REPO_URL|g" \
    -e "s|{{PROJECT_NAME}}|$PROJECT_NAME|g" \
    -e "s|{{PROJECT_SLUG}}|$PROJECT_SLUG|g" \
    -e "s|{{TEAM}}|$TEAM|g" \
    -e "s|{{LEAD}}|$LEAD|g" \
    -e "s|{{PROJECT_DESCRIPTION}}|$PROJECT_DESCRIPTION|g" \
    -e "s|{{DATE}}|$TODAY|g" \
    "$1" > "$2"
}

echo ""
echo -e "${CYAN}Scaffolding...${NC}"

render "$TEMPLATE_DIR/project-README.md"     "$PROJECT_DIR/README.md";     echo "  Created README.md"
render "$TEMPLATE_DIR/project-CLAUDE.md"      "$PROJECT_DIR/CLAUDE.md";      echo "  Created CLAUDE.md"
render "$TEMPLATE_DIR/project-GOVERNANCE.md"  "$PROJECT_DIR/GOVERNANCE.md";  echo "  Created GOVERNANCE.md"

mkdir -p "$PROJECT_DIR/.claude/rules"
render "$TEMPLATE_DIR/governance-compliance-rule.md" "$PROJECT_DIR/.claude/rules/governance-compliance.md"
echo "  Created .claude/rules/governance-compliance.md"

cp "$TEMPLATE_DIR/gitignore.template" "$PROJECT_DIR/.gitignore"; echo "  Created .gitignore"

mkdir -p "$PROJECT_DIR/skills"; touch "$PROJECT_DIR/skills/.gitkeep"; echo "  Created skills/ (project-specific skills)"

# --- Git init ---

( cd "$PROJECT_DIR"
  git init --quiet
  git add -A
  git commit --quiet -m "Initial commit: scaffolded from PM governance template

Project: $PROJECT_NAME
Team: $TEAM
Lead: $LEAD

Governance source: $PM_REPO_URL"
)

echo ""
echo -e "${GREEN}${BOLD}Done!${NC} Project scaffolded at: $PROJECT_DIR"
echo ""
echo -e "${BOLD}Next steps:${NC}"
echo "  1. Fill in GOVERNANCE.md — list the ADRs/policies this project must honor."
echo "  2. Customize CLAUDE.md for the project."
echo "  3. Create the repo on your host, e.g.:"
echo "       cd $PROJECT_SLUG && gh repo create $PROJECT_SLUG --private --source=. --push"
echo ""
