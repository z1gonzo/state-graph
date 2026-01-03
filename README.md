# state-graph

State Graph is a data infrastructure project for modeling,
aggregating and visualizing the structure of public institutions
and power relations as a graph.

The project is designed as a foundation for OSINT analysis,
data transparency tools and civic watchdog applications.

---

## 🚀 Current Status: Phase 1 & 2 Complete!

**✅ Complete Foundation & Frontend Delivered** (January 2026)

### 🏗️ What's Been Built

**Complete Generic Government Structure**

- 200+ government institutions across all levels (National, Voivodeship, County, Municipal, City Council)
- Full PostgreSQL database schema with nodes and relations
- Comprehensive seeding script with hierarchical relationships
- All relationship types: hierarchical, supervisory, membership, appointment, independent

**Production-Ready Backend API**

- Node.js + Fastify + TypeScript backend
- 10 complete REST endpoints for nodes, relations, and graph operations
- Cytoscape.js integration for frontend visualization
- Hierarchical tree structure endpoint
- Comprehensive error handling and logging
- Swagger API documentation at `/docs`

**Complete React Frontend**

- React + TypeScript with Material-UI design system
- Cytoscape.js integration for interactive graph visualization
- 3 complete views: Graph View, Tree View, and Settings
- Advanced filtering and layout options
- Professional UI/UX with responsive design

**Key Features Delivered:**

- `/api/v1/graph` - Full graph data for Cytoscape.js visualization
- `/api/v1/tree` - Hierarchical tree structure
- `/api/v1/nodes` - Complete node management with filtering
- `/api/v1/relations` - Relationship management
- Interactive graph visualization with filtering and multiple layouts
- Professional frontend with settings management and system information
- Health check and comprehensive API documentation

---

## Core idea

Public institutions and officials are modeled as graph nodes.
Formal relationships such as hierarchy, supervision, appointments
and independence are modeled as graph edges.

This approach allows:

- visual exploration of state structures
- detection of hidden dependencies
- historical analysis of institutional changes
- reuse of data across multiple frontend applications

---

## Architecture

The system is composed of independent services:

### Backend API ✅ COMPLETE

- Node.js + TypeScript
- Serves structured graph data
- Optimized for visualization and querying
- **Status**: Ready for frontend integration

### Data Collector 🚧 NEXT PHASE

- Python-based OSINT and ETL service
- Aggregates data from public and government sources
- Parses documents, PDFs and structured records
- Writes normalized data into PostgreSQL

### Frontend 🚧 NEXT PHASE

- React + TypeScript
- Cytoscape.js for graph visualization
- Desktop-first interface for complex data analysis

### Database ✅ COMPLETE

- PostgreSQL
- Graph modeled using nodes and relations
- Designed for scalability and historical data
- **Status**: Generic structure seeded, ready for real data

---

## Tech stack

- React
- Cytoscape.js
- Node.js (Fastify) ✅
- Python (OSINT / scraping)
- PostgreSQL ✅
- Docker / Docker Compose

---

## Project status

**Phase 1 Complete** - Foundation & Database MVP

**Current focus:**

- ✅ Generic government structure with 200+ institutions
- ✅ Complete backend API with 10 endpoints
- ✅ Database schema and seeding
- 🚧 Frontend development (Phase 2)
- 🚧 Data collector for real city data (Phase 2)

**Ready for:**

- Frontend React + Cytoscape.js development
- Integration with real city government data
- Data collector implementation for local sources

---

## Quick Start

### Database Setup

```bash
# Create database
psql -U postgres -c "CREATE DATABASE state_structure;"

# Run schema
psql -U postgres -d state_structure -f database/schema.sql

# Seed with generic structure
psql -U postgres -d state_structure -f database/seed_generic_structure.sql
```

### Backend Setup

```bash
cd backend
npm install
npm run build
npm start
```

### API Access

- Server: http://localhost:4000
- API Docs: http://localhost:4000/docs
- Graph Data: http://localhost:4000/api/v1/graph
- Tree Data: http://localhost:4000/api/v1/tree

---

## Disclaimer

This project focuses on data modeling and aggregation only.
Interpretation and presentation of the data is the responsibility
of applications built on top of this system.
