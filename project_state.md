# Stan projektu state-graph

> Single source of truth. Agent nie zakłada stanu z pamięci rozmowy — najpierw czyta ten plik, `plan.md`, `AGENTS.md`, `README.md` i relevant module docs.

## Status

- Etap: Phase 3 — Data Collector / Real Data Integration
- Ostatnia sesja: 2026-06-22
- Lokalizacja kanoniczna: `<local-workspace>/state-graph`
- Remote: `git@github.com:z1gonzo/state-graph.git`
- Branch: `master`, currently local branch is ahead of `origin/master`
- Następny krok: verify backend/frontend builds and design collector skeleton

## What is true now

- Repo cloned to `<local-workspace>/state-graph`.
- Main README is now a short entrypoint.
- Detailed status moved to `docs/status.md`.
- Architecture/roadmap material consolidated into `docs/architecture.md` and `plan.md`.
- `state-graph` remains separate from `ktozkim.pl`.
- Next real work is the data collector / real data integration phase.

## Current documentation layout

- `README.md` — short overview / quick start / doc map
- `AGENTS.md` — AI-agent workflow rules
- `plan.md` — current plan and phased backlog
- `project_state.md` — current source of truth
- `changelog.md` — human-readable history
- `docs/architecture.md` — architecture and integration boundary
- `docs/status.md` — historical reported completion/status
- `docs/decisions.md` — ADR-style decisions
- `database/model.md` — database model details
- `backend/README.md` — backend API details

## Requires verification

- Whether backend build passes on current WSL/Node v22.
- Whether frontend build passes on current WSL/Node v22.
- Whether PostgreSQL schema/seed loads cleanly.
- Whether API endpoints work locally with seeded data.

## Next tasks

- [ ] `cd backend && npm install && npm run build`
- [ ] `cd frontend && npm install && npm run build`
- [ ] Start Postgres using `docker-compose.yml`
- [ ] Load `database/schema.sql`
- [ ] Load `database/seed_generic_structure.sql`
- [ ] Draft `collector/` architecture
- [ ] Define first export/API contract for `ktozkim.pl`

## Decisions

| Date | Decision | Reason |
|---|---|---|
| 2026-06-22 | `state-graph` cloned to `<local-workspace>/state-graph` | Canonical WSL workspace |
| 2026-06-22 | Repo stays separate from `ktozkim.pl` | Separate data/graph/ETL infrastructure from portal |
| 2026-06-22 | README shortened; detailed material moved to `docs/` and `plan.md` | README should be entrypoint, not roadmap/status archive |
