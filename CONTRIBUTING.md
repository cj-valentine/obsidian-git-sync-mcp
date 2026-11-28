# Contributing

Issues and pull requests are welcome. This file records how changes already land here.

## Change workflow

Changes are spec-driven via [OpenSpec](https://github.com/Fission-AI/OpenSpec). Proposals, designs and specs live under `openspec/`.

- One branch per change, named after the change slug.
- Two commits on it:
  1. `docs(openspec): propose <slug>`: the proposal, design, tasks and spec deltas.
  2. The implementation (`feat(...)`, `fix(...)`, `docs(...)`, ...), folding in `openspec archive`: specs synced into `openspec/specs/` and the change moved to `openspec/changes/archive/`.
- If `openspec archive` stamps the archive directory with the wrong date, rename it to the real one.
- The `openspec/` tree belongs in the PR.
- Changes with no behaviour or spec impact (pure docs, CI) may skip the proposal.

## Merging

Squash-merge only; the repo allows nothing else. `main` gets one commit per PR, built from the PR title and body. Branch commits are discarded on merge, so commit as often as you like on your branch and don't tidy its history.

## Pull request titles

The title becomes the commit subject on `main`. Use [Conventional Commits](https://www.conventionalcommits.org/):

- `type(scope): summary`: lowercase, imperative, no full stop, 72 characters or fewer.
- `!` after the type or scope marks a breaking change.
- Types: `feat`, `fix`, `docs`, `ci`, `chore`, `refactor`, `perf`, `test`, and `deploy` for dependency and image pin bumps.

## Pull request bodies

The body becomes the commit message on `main`, so keep it to what a future reader of `git log` needs.

- Lead with the change. No "This PR" opener, no Summary heading.
- 3 to 10 bullets: what changed, why, and any spec impact.
- Say what you checked, with numbers (test counts, scenarios run), and what you didn't check or left alone.
- State merge order or dependencies, e.g. "Best merged after #8".
- Questions for the reviewer and extra context (detailed verification, design working, review back-and-forth) go in a follow-up PR comment, not the body. No "Ask: merge?" line: opening the PR is the ask.
- AI-assisted PRs keep their `Co-Authored-By:` trailer in the PR body, because the squash drops branch commit messages. No session URLs (`Claude-Session:` or similar).

## Tests

```bash
uv run --extra dev python -m pytest   # bare `pytest` or `uv run pytest` fails
openspec validate --all
```

## Secrets and private detail

Never commit secrets. Placeholders in `.env.example` are fine.

The repo is public. Keep private vault paths, note names, internal tracker IDs and organisation or client names out of code, specs, commits and PRs.

## Upstream

`obsidian-web-mcp` is consumed as a base image and a Python dependency. Contribute changes to it upstream; don't fork or patch it here.
