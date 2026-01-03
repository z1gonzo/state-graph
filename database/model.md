# Database Model - state-graph

This document describes the **data model** for the state-graph project, including nodes (institutions and people), relationships, enums, indexes, and example data.

---

## 1. Model Assumptions

- **Nodes**: represent institutions or individuals  
- **Relations**: represent edges (hierarchical, supervisory, membership, appointment, independent)  
- **Multiple levels**: a single structure can have many hierarchical levels  
- Historical data is supported with start_date / end_date

---

## 2. ENUMs

```sql
CREATE TYPE node_type AS ENUM (
  'institution',
  'person'
);

CREATE TYPE institution_level AS ENUM (
  'rada_miasta',
  'gmina',
  'powiat',
  'wojewodztwo',
  'ministerstwo',
  'organ_centralny'
);

CREATE TYPE relation_type AS ENUM (
  'hierarchical',      -- subordination
  'supervisory',       -- supervision
  'membership',        -- membership in institution
  'appointment',       -- appointment / nomination
  'independent'        -- formal independence
);
```

## 3. Nodes Table
```sql
CREATE TABLE nodes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  type node_type NOT NULL,

  name TEXT NOT NULL,
  description TEXT,

  institution_level institution_level, -- only for institutions
  start_date DATE,
  end_date DATE,

  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT now()
);
```

- institution_level can be NULL for persons
- start_date / end_date allow historical tracking

## 4. Relations Table
```sql
CREATE TABLE relations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

  from_node UUID NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  to_node   UUID NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,

  type relation_type NOT NULL,
  description TEXT,

  start_date DATE,
  end_date DATE,

  created_at TIMESTAMP DEFAULT now()
);
```

Examples of relations:

- rada miasta → gmina (hierarchical)
- minister → ministerstwo (appointment)
- NIK → rząd (independent)

## 5. Indexes
```sql
CREATE INDEX idx_nodes_type ON nodes(type);
CREATE INDEX idx_nodes_level ON nodes(institution_level);

CREATE INDEX idx_relations_from ON relations(from_node);
CREATE INDEX idx_relations_to ON relations(to_node);
CREATE INDEX idx_relations_type ON relations(type);
```
Indexes allow fast queries for building trees, fetching subordinates, and generating Cytoscape graphs.

## 6. Example Data
```sql
-- Institutions
INSERT INTO nodes (type, name, institution_level)
VALUES
('institution', 'Rada Miasta X', 'rada_miasta'),
('institution', 'Urząd Miasta X', 'gmina'),
('institution', 'Starostwo Powiatowe Y', 'powiat');

-- Relations
INSERT INTO relations (from_node, to_node, type)
SELECT
  n1.id,
  n2.id,
  'hierarchical'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Miasta X'
  AND n2.name = 'Urząd Miasta X';
  ```

## 7. Notes

This model can scale to multiple cities, counties, voivodeships, and ministries

Nodes and relations form a graph that can be visualized with Cytoscape

Historical data and different relation types allow complex analysis of state structures

Future extensions can include asset declarations, document links, and audit logs