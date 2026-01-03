// Node types
export type NodeType = 'institution' | 'person';

export type InstitutionLevel =
  | 'organ_centralny'
  | 'ministerstwo'
  | 'wojewodztwo'
  | 'powiat'
  | 'gmina'
  | 'rada_miasta';

export interface Node {
  id: string;
  type: NodeType;
  name: string;
  description: string | null;
  institution_level: InstitutionLevel | null;
  start_date: string | null;
  end_date: string | null;
  created_at: string;
  updated_at: string;
}

// Relation types
export type RelationType =
  | 'hierarchical'
  | 'supervisory'
  | 'membership'
  | 'appointment'
  | 'independent';

export interface Relation {
  id: string;
  from_node: string;
  to_node: string;
  type: RelationType;
  description: string | null;
  start_date: string | null;
  end_date: string | null;
  created_at: string;
}

// Graph data structure for Cytoscape.js
export interface GraphElement {
  data: {
    id: string;
    [key: string]: any;
  };
}

export interface CytoscapeNodeData {
  id: string;
  name: string;
  type: NodeType;
  institution_level?: InstitutionLevel;
  description?: string;
}

export interface CytoscapeEdgeData {
  id: string;
  source: string;
  target: string;
  type: RelationType;
  description?: string;
}

export interface CytoscapeNode {
  data: CytoscapeNodeData;
}

export interface CytoscapeEdge {
  data: CytoscapeEdgeData;
}

export interface GraphData {
  nodes: CytoscapeNode[];
  edges: CytoscapeEdge[];
}

// API Response types
export interface ApiResponse<T> {
  data: T;
  status: number;
  statusText: string;
}

export interface GraphApiResponse {
  nodes: GraphElement[];
  edges: GraphElement[];
}

export interface TreeApiResponse extends Node {
  children: TreeApiResponse[];
  relations: Relation[];
}

// Filter types
export interface GraphFilters {
  level?: InstitutionLevel;
  type?: RelationType;
  limit?: number;
  offset?: number;
}

export interface TreeFilters {
  root_level?: InstitutionLevel;
  max_depth?: number;
}

// Layout types
export type LayoutType = 'cose' | 'dagre' | 'grid' | 'circle';

// Interaction types
export interface NodeInteraction {
  selectedNode: Node | null;
  hoveredNode: Node | null;
  setSelectedNode: (node: Node | null) => void;
  setHoveredNode: (node: Node | null) => void;
}

export interface GraphLayout {
  layout: LayoutType;
  setLayout: (layout: LayoutType) => void;
  applyLayout: (layout: LayoutType) => void;
}

export interface GraphDataHook {
  graphData: GraphData | null;
  loading: boolean;
  error: string | null;
  fetchGraphData: (filters?: GraphFilters) => Promise<void>;
}

// Component props types
export interface GraphViewProps {
  onNodeSelect?: (node: Node) => void;
  onNodeHover?: (node: Node | null) => void;
}

export interface TreeViewProps {
  onNodeSelect?: (node: TreeApiResponse) => void;
}

export interface SettingsProps {
  apiUrl: string;
  setApiUrl: (url: string) => void;
}
