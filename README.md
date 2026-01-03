# state-graph

State Graph is a data infrastructure project for modeling,
aggregating and visualizing the structure of public institutions
and power relations as a graph.

The project is designed as a foundation for OSINT analysis,
data transparency tools and civic watchdog applications.

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

### Backend API
- Node.js + TypeScript
- Serves structured graph data
- Optimized for visualization and querying

### Data Collector
- Python-based OSINT and ETL service
- Aggregates data from public and government sources
- Parses documents, PDFs and structured records
- Writes normalized data into PostgreSQL

### Frontend
- React + TypeScript
- Cytoscape.js for graph visualization
- Desktop-first interface for complex data analysis

### Database
- PostgreSQL
- Graph modeled using nodes and relations
- Designed for scalability and historical data

---

## Tech stack

- React
- Cytoscape.js
- Node.js (Fastify)
- Python (OSINT / scraping)
- PostgreSQL
- Docker / Docker Compose

---

## Project status

Early development / MVP stage.

The current focus is on:
- defining the data model
- building a complete representation of state structure
- creating a reliable data ingestion pipeline

---

## Disclaimer

This project focuses on data modeling and aggregation only.
Interpretation and presentation of the data is the responsibility
of applications built on top of this system.
