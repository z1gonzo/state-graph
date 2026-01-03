# Architecture & Roadmap

## 1. Architecture Diagram (Mermaid)

```mermaid
%% Extended architecture diagram for state-graph project
graph TD
    %% Frontend
    subgraph Frontend
        FE[Frontend: React + Cytoscape.js] 
    end

    %% Backend API
    subgraph Backend
        BE[Backend API: Node.js + Fastify + TypeScript]
    end

    %% Database
    subgraph Database
        DB[PostgreSQL: nodes + relations]
    end

    %% Data Collector
    subgraph Collector
        COL[Data Collector: Python OSINT / ETL]
    end

    %% Docker Orchestration
    subgraph Docker
        FE
        BE
        DB
        COL
    end

    %% Data flows
    FE -->|REST / JSON| BE
    BE -->|SQL Read| DB
    COL -->|SQL Write| DB

    %% Future microservices (optional)
    ANALYTICS[Analytics / Reporting Microservice]
    ALERTS[Alerting / Monitoring Microservice]
    BE --> ANALYTICS
    BE --> ALERTS

    %% Styling
    classDef frontend fill:#cce5ff,stroke:#3399ff,stroke-width:2px;
    classDef backend fill:#d4edda,stroke:#28a745,stroke-width:2px;
    classDef database fill:#fff3cd,stroke:#ffc107,stroke-width:2px;
    classDef collector fill:#f0d4f7,stroke:#9b59b6,stroke-width:2px;
    classDef microservice fill:#ffd6d6,stroke:#ff4d4d,stroke-width:2px;

    class FE frontend
    class BE backend
    class DB database
    class COL collector
    class ANALYTICS microservice
    class ALERTS microservice
```


2. Docker & Services

Frontend – React + Cytoscape.js, desktop-first, graph visualization, filters, zoom

Backend API – Node.js + Fastify + TypeScript, /tree and /graph endpoints, SQL queries

PostgreSQL – nodes + relations, indexes, historical data, scalable for large graphs

Data Collector – Python OSINT / ETL, scraping BIP, PDF parsing, data normalization

Docker Compose – container orchestration, environment isolation, scalable deployments

Optional future microservices – analytics, alerts, graph exports


# Project Roadmap - state-graph

## Phase 1: MVP
- [ ] Define data model (nodes + relations)
- [ ] Setup PostgreSQL in Docker
- [ ] Backend API with `/tree` and `/graph` endpoints
- [ ] Frontend with static Cytoscape graph visualization
- [ ] Data Collector: scrape initial city data
- [ ] Initial architecture diagram

## Phase 2: Extensions
- [ ] Add historical data (terms, institutional changes)
- [ ] Support PDF documents / asset declarations
- [ ] Interactive frontend filters (institution type, level, independence)
- [ ] Integration tests and CI/CD in Docker
- [ ] Automated updates from government sources

## Phase 3: Scaling & Analytics
- [ ] Multi-city / multi-voivodeship support
- [ ] Graph export / JSON API
- [ ] OSINT analytics and statistics
- [ ] Alerts for changes in structures or terms
