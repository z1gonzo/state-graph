# Architecture & Roadmap

## 1. Architecture Diagram (Mermaid)

```mermaid
%% Rozszerzony diagram architektury projektu state-graph
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

    %% Przepływy danych
    FE -->|REST / JSON| BE
    BE -->|SQL Read| DB
    COL -->|SQL Write| DB

    %% Future microservices (opcjonalnie)
    ANALYTICS[Analytics / Reports Microservice] 
    ALERTS[Alerting / Monitoring Microservice]
    BE --> ANALYTICS
    BE --> ALERTS

    %% Style kolorów
    classDef frontend fill:#cce5ff,stroke:#3399ff,stroke-width:2px;
    classDef backend fill:#d4edda,stroke:#28a745,stroke-width:2px;
    classDef database fill:#fff3cd,stroke:#ffc107,stroke-width:2px;
    classDef collector fill:#f0d4f7,stroke:#9b59b6,stroke-width:2px;
    classDef microservice fill:#ffd6d6,stroke:#ff4d4d,stroke-width:2px;

    class FE frontend;
    class BE backend;
    class DB database;
    class COL collector;
    class ANALYTICS,microservice;
    class ALERTS,microservice;
