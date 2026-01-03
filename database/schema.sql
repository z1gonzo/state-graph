-- ==========================================================
-- State-Graph Database Schema
-- Author: state-graph project
-- Description: Nodes and relations model for institutions
-- ==========================================================

-- 1. ENUMs
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

-- 2. Nodes table
CREATE TABLE IF NOT EXISTS nodes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  type node_type NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  institution_level institution_level,
  start_date DATE,
  end_date DATE,
  created_at TIMESTAMP DEFAULT now(),
  updated_at TIMESTAMP DEFAULT now()
);

-- 3. Relations table
CREATE TABLE IF NOT EXISTS relations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  from_node UUID NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  to_node   UUID NOT NULL REFERENCES nodes(id) ON DELETE CASCADE,
  type relation_type NOT NULL,
  description TEXT,
  start_date DATE,
  end_date DATE,
  created_at TIMESTAMP DEFAULT now()
);

-- 4. Indexes
CREATE INDEX IF NOT EXISTS idx_nodes_type ON nodes(type);
CREATE INDEX IF NOT EXISTS idx_nodes_level ON nodes(institution_level);
CREATE INDEX IF NOT EXISTS idx_relations_from ON relations(from_node);
CREATE INDEX IF NOT EXISTS idx_relations_to ON relations(to_node);
CREATE INDEX IF NOT EXISTS idx_relations_type ON relations(type);

-- 5. Example data

-- Nodes
INSERT INTO nodes (type, name, institution_level)
VALUES
('institution', 'Rada Miasta X', 'rada_miasta'),
('institution', 'Urząd Miasta X', 'gmina'),
('institution', 'Starostwo Powiatowe Y', 'powiat');

-- Relations
INSERT INTO relations (from_node, to_node, type)
SELECT n1.id, n2.id, 'hierarchical'
FROM nodes n1, nodes n2
WHERE n1.name = 'Rada Miasta X' AND n2.name = 'Urząd Miasta X';
