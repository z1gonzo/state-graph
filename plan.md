# Plan projektu state-graph

> Hermes planuje i aktualizuje ten plik. Historyczny plan z `TODO.md` został skondensowany tutaj jako bieżący operacyjny plan.

## Cel projektu

State Graph models, aggregates and visualizes public institutions and power relations as a graph. It should become the data/graph foundation for OSINT/civic watchdog apps such as `ktozkim.pl`.

## Current focus

Phase 3 — real data collection and integration.

- [ ] Verify backend build after fresh clone
- [ ] Verify frontend build after fresh clone
- [ ] Start PostgreSQL and seed generic structure
- [ ] Design Python collector structure
- [ ] Pick first city/government data source
- [ ] Define export/API contract for `ktozkim.pl`

## Phase 1 — Foundation and database

Status: reported complete.

- [x] Initialize PostgreSQL schema
- [x] Create generic government structure nodes
- [x] Add relationship model
- [x] Add seed script
- [x] Add database documentation

## Phase 2 — Backend and frontend foundation

Status: reported complete.

- [x] Fastify + TypeScript backend
- [x] Database connection layer
- [x] `/tree` endpoint
- [x] `/graph` endpoint
- [x] Nodes and relations endpoints
- [x] React + Vite frontend
- [x] Cytoscape graph visualization
- [x] Tree/settings views
- [x] Filtering/layout options

## Phase 3 — Data collector / real data

Status: next.

- [ ] Create `collector/` Python project
- [ ] Add source registry for public/government data sources
- [ ] Implement BIP scraper prototype
- [ ] Implement PDF parsing prototype
- [ ] Add normalization pipeline
- [ ] Add import script to PostgreSQL
- [ ] Track provenance/source URLs for imported facts

## Phase 4 — Integration with ktozkim.pl

- [ ] Select first portal use case
- [ ] Define API/snapshot contract
- [ ] Add sample exported dataset
- [ ] Add integration test or smoke test
- [ ] Document contract in both repos

## Phase 5 — Quality and scaling

- [ ] Backend unit/integration tests
- [ ] Frontend smoke tests
- [ ] CI workflow
- [ ] Historical data model
- [ ] Export formats: JSON/CSV
- [ ] Multi-city support
- [ ] Analytics/alerts only after data quality is stable

## Not now

- Do not merge this repo with `ktozkim`.
- Do not scrape aggressively without rate limits/cache.
- Do not treat unverified scraped data as verified facts.
- Do not build advanced analytics before collector/provenance works.
