# state-graph

`state-graph` is the data and graph infrastructure project for modeling public institutions, officials, and formal relationships as a graph.

It is designed to support OSINT analysis, civic transparency tools, and applications such as `ktozkim.pl`.


## What belongs in this repo

- Generic graph model of institutions and relationships
- PostgreSQL schema and seed data
- Backend API for graph/tree/node/relation data
- Graph visualization UI
- Future Python ETL / data collector
- Data provenance and normalization rules

## What does **not** belong here

- User-facing portal auth/report workflows
- ktozkim-specific UI/business logic
- Unbounded scraping without rate limits/cache/source tracking

Those responsibilities belong in `ktozkim` or a future dedicated ingestion/deployment service.

## Current focus

Foundation and frontend are reported complete. The next planned phase is real data collection and integration:

- Python ETL/data collector
- first real city/government data sources
- data normalization pipeline
- export/API contract for `ktozkim.pl`

See [`project_state.md`](project_state.md) and [`plan.md`](plan.md).

## Tech stack

- Backend: Node.js + Fastify + TypeScript
- Frontend: React + Vite + TypeScript + Cytoscape.js
- Database: PostgreSQL
- Future collector: Python
- Local infra: Docker Compose

## Repository structure

```text
.
├── AGENTS.md
├── README.md
├── plan.md
├── project_state.md
├── changelog.md
├── docs/
│   ├── architecture.md
│   ├── decisions.md
│   └── status.md
├── backend/
├── frontend/
└── database/
```

## Quick start

### Database

```bash
psql -U postgres -c "CREATE DATABASE state_structure;"
psql -U postgres -d state_structure -f database/schema.sql
psql -U postgres -d state_structure -f database/seed_generic_structure.sql
```

### Backend

```bash
cd backend
npm install
npm run build
npm start
```

Historical backend URLs:

- Server: `http://localhost:4000`
- API docs: `http://localhost:4000/docs`
- Graph data: `http://localhost:4000/api/v1/graph`
- Tree data: `http://localhost:4000/api/v1/tree`

### Frontend

```bash
cd frontend
npm install
npm run dev
```

## Documentation map

- Current state: [`project_state.md`](project_state.md)
- Plan and backlog: [`plan.md`](plan.md)
- Architecture: [`docs/architecture.md`](docs/architecture.md)
- Historical status: [`docs/status.md`](docs/status.md)
- Technical decisions: [`docs/decisions.md`](docs/decisions.md)
- Database model: [`database/model.md`](database/model.md)
- Backend API details: [`backend/README.md`](backend/README.md)

## Disclaimer

This project focuses on data modeling and aggregation. Interpretation and public presentation of the data is the responsibility of applications built on top of this system, such as `ktozkim.pl`.
