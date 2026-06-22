# Status state-graph

Detailed status material moved out of the main README.

## Historical status summary

Previous notes describe Phase 1 and Phase 2 as complete.

### Foundation/database

- 200+ government institutions across levels:
  - National
  - Voivodeship
  - County
  - Municipal
  - City Council
- PostgreSQL schema with nodes and relations
- Seed script for generic government structure
- Relationship types:
  - hierarchical
  - supervisory
  - membership
  - appointment
  - independent

### Backend API

- Node.js + Fastify + TypeScript
- REST endpoints for nodes, relations and graph operations
- Cytoscape.js-compatible graph endpoint
- Hierarchical tree endpoint
- Swagger API documentation at `/docs`

### Frontend

- React + TypeScript
- Material UI
- Cytoscape.js graph visualization
- Views reported complete:
  - Graph View
  - Tree View
  - Settings
- Filtering and layout options

## Key endpoints reported

- `/api/v1/graph` — graph data for Cytoscape.js
- `/api/v1/tree` — hierarchical tree structure
- `/api/v1/nodes` — node management/filtering
- `/api/v1/relations` — relationship management
- `/docs` — Swagger API documentation

## Current verification status

As of 2026-06-22, the repo was freshly cloned to `<local-workspace>/state-graph`. Next verification steps:

- install backend dependencies
- run backend build/tests
- install frontend dependencies
- run frontend build/tests
- start PostgreSQL and seed data
- verify API endpoints locally

These tasks are tracked in `project_state.md` and `plan.md`.
