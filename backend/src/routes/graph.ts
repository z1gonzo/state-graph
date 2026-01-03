import { FastifyInstance } from 'fastify';
import { pool } from '../config/database';

interface GraphNode {
  id: string;
  type: string;
  name: string;
  description: string | null;
  institution_level: string | null;
  start_date: string | null;
  end_date: string | null;
  created_at: string;
  updated_at: string;
}

interface GraphRelation {
  id: string;
  from_node: string;
  to_node: string;
  type: string;
  description: string | null;
  start_date: string | null;
  end_date: string | null;
  created_at: string;
}

interface TreeNode {
  id: string;
  type: string;
  name: string;
  description: string | null;
  institution_level: string | null;
  children: TreeNode[];
  relations: GraphRelation[];
}

const graphRoutes = async (fastify: FastifyInstance) => {
  // Get full graph data for Cytoscape.js
  fastify.get<{
    Querystring: {
      level?: string;
      limit?: number;
      offset?: number;
    };
  }>(
    '/graph',
    {
      schema: {
        description: 'Get graph data in Cytoscape.js format',
        tags: ['graph'],
        querystring: {
          type: 'object',
          properties: {
            level: {
              type: 'string',
              enum: [
                'organ_centralny',
                'ministerstwo',
                'wojewodztwo',
                'powiat',
                'gmina',
                'rada_miasta',
              ],
            },
            limit: { type: 'number', minimum: 1, maximum: 1000 },
            offset: { type: 'number', minimum: 0 },
          },
        },
        response: {
          200: {
            type: 'object',
            properties: {
              nodes: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    data: {
                      type: 'object',
                      properties: {
                        id: { type: 'string' },
                        type: { type: 'string' },
                        name: { type: 'string' },
                        description: { type: ['string', 'null'] },
                        institution_level: { type: ['string', 'null'] },
                      },
                    },
                  },
                },
              },
              edges: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    data: {
                      type: 'object',
                      properties: {
                        id: { type: 'string' },
                        source: { type: 'string' },
                        target: { type: 'string' },
                        type: { type: 'string' },
                        description: { type: ['string', 'null'] },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      try {
        const { level, limit = 100, offset = 0 } = request.query;

        // Get nodes
        let nodesQuery = `
        SELECT id, type, name, description, institution_level, start_date, end_date, created_at, updated_at
        FROM nodes
        WHERE 1=1
      `;
        const nodesParams: any[] = [];
        let paramIndex = 1;

        if (level) {
          nodesQuery += ` AND institution_level = $${paramIndex}`;
          nodesParams.push(level);
          paramIndex++;
        }

        nodesQuery += ` ORDER BY name LIMIT $${paramIndex} OFFSET $${
          paramIndex + 1
        }`;
        nodesParams.push(limit, offset);

        const nodesResult = await pool.query(nodesQuery, nodesParams);

        // Get relations
        let relationsQuery = `
        SELECT id, from_node, to_node, type, description, start_date, end_date, created_at
        FROM relations
        WHERE 1=1
      `;
        const relationsParams: any[] = [];
        paramIndex = 1;

        if (level) {
          relationsQuery += `
          AND (from_node IN (SELECT id FROM nodes WHERE institution_level = $${paramIndex})
               OR to_node IN (SELECT id FROM nodes WHERE institution_level = $${paramIndex}))`;
          relationsParams.push(level, level);
          paramIndex += 2;
        }

        relationsQuery += ` ORDER BY created_at DESC`;
        const relationsResult = await pool.query(
          relationsQuery,
          relationsParams
        );

        // Format for Cytoscape.js
        const cytoscapeData = {
          nodes: nodesResult.rows.map((node: GraphNode) => ({
            data: {
              id: node.id,
              type: node.type,
              name: node.name,
              description: node.description,
              institution_level: node.institution_level,
            },
          })),
          edges: relationsResult.rows.map((relation: GraphRelation) => ({
            data: {
              id: relation.id,
              source: relation.from_node,
              target: relation.to_node,
              type: relation.type,
              description: relation.description,
            },
          })),
        };

        return cytoscapeData;
      } catch (error) {
        fastify.log.error(error);
        return reply.status(500).send({ error: 'Internal server error' });
      }
    }
  );

  // Get hierarchical tree structure
  fastify.get<{
    Querystring: {
      root_level?: string;
      max_depth?: number;
    };
  }>(
    '/tree',
    {
      schema: {
        description: 'Get hierarchical tree structure',
        tags: ['graph'],
        querystring: {
          type: 'object',
          properties: {
            root_level: {
              type: 'string',
              enum: [
                'organ_centralny',
                'ministerstwo',
                'wojewodztwo',
                'powiat',
                'gmina',
                'rada_miasta',
              ],
            },
            max_depth: { type: 'number', minimum: 1, maximum: 10 },
          },
        },
        response: {
          200: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string' },
                type: { type: 'string' },
                name: { type: 'string' },
                description: { type: ['string', 'null'] },
                institution_level: { type: ['string', 'null'] },
                children: {
                  type: 'array',
                  items: { type: 'object' },
                },
                relations: {
                  type: 'array',
                  items: {
                    type: 'object',
                    properties: {
                      id: { type: 'string' },
                      type: { type: 'string' },
                      description: { type: ['string', 'null'] },
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      try {
        const { root_level, max_depth = 5 } = request.query;

        // Get all nodes
        let nodesQuery = `
        SELECT id, type, name, description, institution_level, start_date, end_date, created_at, updated_at
        FROM nodes
        WHERE 1=1
      `;
        const nodesParams: any[] = [];
        let paramIndex = 1;

        if (root_level) {
          nodesQuery += ` AND institution_level = $${paramIndex}`;
          nodesParams.push(root_level);
          paramIndex++;
        }

        nodesQuery += ` ORDER BY name`;
        const nodesResult = await pool.query(nodesQuery, nodesParams);

        // Get hierarchical relations
        let relationsQuery = `
        SELECT r.id, r.from_node, r.to_node, r.type, r.description, r.start_date, r.end_date, r.created_at,
               n1.name as from_name, n1.type as from_type, n1.institution_level as from_level,
               n2.name as to_name, n2.type as to_type, n2.institution_level as to_level
        FROM relations r
        JOIN nodes n1 ON r.from_node = n1.id
        JOIN nodes n2 ON r.to_node = n2.id
        WHERE r.type = 'hierarchical'
        ORDER BY r.created_at DESC
      `;
        const relationsResult = await pool.query(relationsQuery, []);

        // Build tree structure
        const nodesMap = new Map<string, TreeNode>();
        const rootNodes: TreeNode[] = [];

        // Initialize all nodes
        nodesResult.rows.forEach((node: GraphNode) => {
          nodesMap.set(node.id, {
            id: node.id,
            type: node.type,
            name: node.name,
            description: node.description,
            institution_level: node.institution_level,
            children: [],
            relations: [],
          });
        });

        // Build parent-child relationships
        relationsResult.rows.forEach((relation: any) => {
          const fromNode = nodesMap.get(relation.from_node);
          const toNode = nodesMap.get(relation.to_node);

          if (fromNode && toNode) {
            fromNode.children.push(toNode);
          }
        });

        // Add non-hierarchical relations to nodes
        const nonHierarchicalRelations = relationsResult.rows.filter(
          (r) => r.type !== 'hierarchical'
        );
        nonHierarchicalRelations.forEach((relation: any) => {
          const fromNode = nodesMap.get(relation.from_node);
          const toNode = nodesMap.get(relation.to_node);

          if (fromNode) {
            fromNode.relations.push({
              id: relation.id,
              from_node: relation.from_node,
              to_node: relation.to_node,
              type: relation.type,
              description: relation.description,
              start_date: relation.start_date,
              end_date: relation.end_date,
              created_at: relation.created_at,
            });
          }

          if (toNode) {
            toNode.relations.push({
              id: relation.id,
              from_node: relation.from_node,
              to_node: relation.to_node,
              type: relation.type,
              description: relation.description,
              start_date: relation.start_date,
              end_date: relation.end_date,
              created_at: relation.created_at,
            });
          }
        });

        // Find root nodes (nodes that are not children of any other node)
        const childIds = new Set<string>();
        relationsResult.rows.forEach((relation: any) => {
          childIds.add(relation.to_node);
        });

        nodesMap.forEach((node, id) => {
          if (!childIds.has(id)) {
            rootNodes.push(node);
          }
        });

        // Limit depth if specified
        const limitDepth = (
          nodes: TreeNode[],
          currentDepth: number = 0
        ): TreeNode[] => {
          if (currentDepth >= max_depth) {
            return nodes.map((node) => ({
              ...node,
              children: [], // Remove children at max depth
            }));
          }

          return nodes.map((node) => ({
            ...node,
            children: limitDepth(node.children, currentDepth + 1),
          }));
        };

        const treeData = limitDepth(rootNodes);

        return treeData;
      } catch (error) {
        fastify.log.error(error);
        return reply.status(500).send({ error: 'Internal server error' });
      }
    }
  );

  // Get subgraph for a specific node
  fastify.get<{
    Params: { nodeId: string };
    Querystring: {
      depth?: number;
      include_types?: string[];
    };
  }>(
    '/graph/node/:nodeId',
    {
      schema: {
        description: 'Get subgraph for a specific node',
        tags: ['graph'],
        params: {
          type: 'object',
          properties: {
            nodeId: { type: 'string', format: 'uuid' },
          },
          required: ['nodeId'],
        },
        querystring: {
          type: 'object',
          properties: {
            depth: { type: 'number', minimum: 1, maximum: 5, default: 2 },
            include_types: {
              type: 'array',
              items: {
                type: 'string',
                enum: [
                  'hierarchical',
                  'supervisory',
                  'membership',
                  'appointment',
                  'independent',
                ],
              },
            },
          },
        },
        response: {
          200: {
            type: 'object',
            properties: {
              nodes: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    data: {
                      type: 'object',
                      properties: {
                        id: { type: 'string' },
                        type: { type: 'string' },
                        name: { type: 'string' },
                        description: { type: ['string', 'null'] },
                        institution_level: { type: ['string', 'null'] },
                      },
                    },
                  },
                },
              },
              edges: {
                type: 'array',
                items: {
                  type: 'object',
                  properties: {
                    data: {
                      type: 'object',
                      properties: {
                        id: { type: 'string' },
                        source: { type: 'string' },
                        target: { type: 'string' },
                        type: { type: 'string' },
                        description: { type: ['string', 'null'] },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      try {
        const { nodeId } = request.params;
        const {
          depth = 2,
          include_types = [
            'hierarchical',
            'supervisory',
            'membership',
            'appointment',
            'independent',
          ],
        } = request.query;

        // Get subgraph using recursive CTE
        const subgraphQuery = `
        WITH RECURSIVE subgraph AS (
          -- Base case: start with the requested node
          SELECT id, type, name, description, institution_level, start_date, end_date, created_at, updated_at, 0 as depth
          FROM nodes
          WHERE id = $1
          
          UNION ALL
          
          -- Recursive case: find connected nodes
          SELECT n.id, n.type, n.name, n.description, n.institution_level, n.start_date, n.end_date, n.created_at, n.updated_at, sg.depth + 1
          FROM nodes n
          JOIN relations r ON (n.id = r.from_node OR n.id = r.to_node)
          JOIN subgraph sg ON (r.from_node = sg.id OR r.to_node = sg.id)
          WHERE sg.depth < $2
            AND r.type = ANY($3::text[])
        )
        SELECT DISTINCT * FROM subgraph
      `;

        const subgraphResult = await pool.query(subgraphQuery, [
          nodeId,
          depth,
          include_types,
        ]);

        // Get relations for the subgraph
        const relationsQuery = `
        SELECT r.id, r.from_node, r.to_node, r.type, r.description, r.start_date, r.end_date, r.created_at
        FROM relations r
        WHERE (r.from_node = $1 OR r.to_node = $1)
          AND r.type = ANY($3::text[])
          AND (r.from_node IN (SELECT id FROM (${subgraphQuery}) AS sg)
               OR r.to_node IN (SELECT id FROM (${subgraphQuery}) AS sg))
      `;

        const relationsResult = await pool.query(relationsQuery, [
          nodeId,
          depth,
          include_types,
        ]);

        // Format for Cytoscape.js
        const cytoscapeData = {
          nodes: subgraphResult.rows.map((node: GraphNode) => ({
            data: {
              id: node.id,
              type: node.type,
              name: node.name,
              description: node.description,
              institution_level: node.institution_level,
            },
          })),
          edges: relationsResult.rows.map((relation: GraphRelation) => ({
            data: {
              id: relation.id,
              source: relation.from_node,
              target: relation.to_node,
              type: relation.type,
              description: relation.description,
            },
          })),
        };

        return cytoscapeData;
      } catch (error) {
        fastify.log.error(error);
        return reply.status(500).send({ error: 'Internal server error' });
      }
    }
  );
};

export default graphRoutes;
