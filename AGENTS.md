# AGENTS.md

Operational notes for this repo. Project thesis, tech stack, and deployment
live in `openspec/config.yaml` (context block) and `README.md` — don't duplicate
them here.

## Commands
- Test: `uv run --extra dev python -m pytest`  (bare `pytest` / `uv run pytest` fail — needs the dev extra + `python -m`)
- The two images build via `.github/workflows/build-containers.yml` on push to
  `main`/`v*` tags → `ghcr.io/jjsmackay/obsidian-mcp` and `…/obsidian-sync`.

## Change workflow
Branching, commits, PR titles and bodies: see `CONTRIBUTING.md`. Agent-specific notes:
- Propose with `/opsx:propose`, not ad-hoc edits. Cycle: `/opsx:propose` → commit → `/opsx:apply` → `/opsx:archive` → commit.
  `/opsx:propose` STOPS at "ready for apply" (generates artifacts, doesn't apply/archive) — continue explicitly.
- Open the PR with `gh pr create`; merge with `gh pr merge --squash` (the only method the repo allows). Never commit directly to `main`. The PR body becomes the squash commit message: keep it short and put extra context in a follow-up PR comment.
- `openspec archive` stamps the archive dir with the host clock (often a day off) — rename the dir to the real date to match siblings.
- Validator quirk: only a requirement's **first line** is checked for SHALL/MUST; no backticks in requirement headers.
- `.claude/` is gitignored; regenerate slash commands with `openspec init --tools claude`.

## Gotchas
- `VAULT_GIT_ENABLED=true` makes the mcp container **fail-closed at startup** if
  the vault isn't a git working tree or the remote is missing (`config.py:validate_gitsync`).
- `obsidian-web-mcp` is consumed as base image + Python dependency; contribute
  changes **upstream**, don't fork.
