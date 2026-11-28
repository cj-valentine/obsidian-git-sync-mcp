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

## Pull request titles

PRs are squash-merged, so the title becomes the commit on `main`. Use [Conventional Commits](https://www.conventionalcommits.org/):

- `type(scope): summary`: lowercase, imperative, no full stop, 72 characters or fewer.
- `!` after the type or scope marks a breaking change.
- Types: `feat`, `fix`, `docs`, `ci`, `chore`, `refactor`, `perf`, `test`, and `deploy` for dependency and image pin bumps.

## Pull request bodies

- Lead with the change. No "This PR" opener, no Summary heading.
- 3 to 10 bullets: what changed, why, and any spec impact.
- Say what you checked, with numbers (test counts, scenarios run), and what you didn't check or left alone.
- State merge order or dependencies, e.g. "Best merged after #8".
- Put any asks at the end, answerable in a word ("Ask: merge?").
- AI-assisted PRs keep their `Co-Authored-By:` (and any session) trailers in the PR body, because the squash drops branch commit messages.

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
