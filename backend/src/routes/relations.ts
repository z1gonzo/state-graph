import { FastifyInstance } from 'fastify';
import { pool } from '../config/database';

interface Relation {
  id: string;
  from_node: string;
  to_node: string;
  type: string;
  description: string | null;
  start_date: string | null;
  end_date: string | null;
  created_at: string;
}

const relationsRoutes = async (fastify: FastifyInstance) => {
  // Get all relations
  fastify.get<{
    Querystring: {
      type?: string;
      from_node?: string;
      to_node?: string;
      limit?: number;
      offset?: number;
    };
  }>(
    '/relations',
    {
      schema: {
        description: 'Get all relations with optional filtering',
        tags: ['relations'],
        querystring: {
          type: 'object',
          properties: {
            type: {
              type: 'string',
              enum: [
                'hierarchical',
                'supervisory',
                'membership',
                'appointment',
                'independent',
              ],
            },
            from_node: { type: 'string', format: 'uuid' },
            to_node: { type: 'string', format: 'uuid' },
            limit: { type: 'number', minimum: 1, maximum: 1000 },
            offset: { type: 'number', minimum: 0 },
          },
        },
        response: {
          200: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string' },
                from_node: { type: 'string' },
                to_node: { type: 'string' },
                type: { type: 'string' },
                description: { type: ['string', 'null'] },
                start_date: { type: ['string', 'null'] },
                end_date: { type: ['string', 'null'] },
                created_at: { type: 'string' },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      try {
        const {
          type,
          from_node,
          to_node,
          limit = 100,
          offset = 0,
        } = request.query;

        let query = `
        SELECT id, from_node, to_node, type, description, start_date, end_date, created_at
        FROM relations
        WHERE 1=1
      `;
        const params: any[] = [];
        let paramIndex = 1;

        if (type) {
          query += ` AND type = $${paramIndex}`;
          params.push(type);
          paramIndex++;
        }

        if (from_node) {
          query += ` AND from_node = $${paramIndex}`;
          params.push(from_node);
          paramIndex++;
        }

        if (to_node) {
          query += ` AND to_node = $${paramIndex}`;
          params.push(to_node);
          paramIndex++;
        }

        query += ` ORDER BY created_at DESC LIMIT $${paramIndex} OFFSET $${
          paramIndex + 1
        }`;
        params.push(limit, offset);

        const result = await pool.query(query, params);
        return result.rows;
      } catch (error) {
        fastify.log.error(error);
        return reply.status(500).send({ error: 'Internal server error' });
      }
    }
  );

  // Get relations by node ID
  fastify.get<{
    Params: { nodeId: string };
    Querystring: {
      direction?: 'from' | 'to' | 'both';
      type?: string;
      limit?: number;
      offset?: number;
    };
  }>(
    '/relations/node/:nodeId',
    {
      schema: {
        description: 'Get relations for a specific node',
        tags: ['relations'],
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
            direction: {
              type: 'string',
              enum: ['from', 'to', 'both'],
              default: 'both',
            },
            type: {
              type: 'string',
              enum: [
                'hierarchical',
                'supervisory',
                'membership',
                'appointment',
                'independent',
              ],
            },
            limit: { type: 'number', minimum: 1, maximum: 1000 },
            offset: { type: 'number', minimum: 0 },
          },
        },
        response: {
          200: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string' },
                from_node: { type: 'string' },
                to_node: { type: 'string' },
                type: { type: 'string' },
                description: { type: ['string', 'null'] },
                start_date: { type: ['string', 'null'] },
                end_date: { type: ['string', 'null'] },
                created_at: { type: 'string' },
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
          direction = 'both',
          type,
          limit = 100,
          offset = 0,
        } = request.query;

        let query = `
        SELECT id, from_node, to_node, type, description, start_date, end_date, created_at
        FROM relations
        WHERE 1=1
      `;
        const params: any[] = [];
        let paramIndex = 1;

        if (direction === 'from') {
          query += ` AND from_node = $${paramIndex}`;
          params.push(nodeId);
          paramIndex++;
        } else if (direction === 'to') {
          query += ` AND to_node = $${paramIndex}`;
          params.push(nodeId);
          paramIndex++;
        } else {
          query += ` AND (from_node = $${paramIndex} OR to_node = $${paramIndex})`;
          params.push(nodeId);
          paramIndex++;
        }

        if (type) {
          query += ` AND type = $${paramIndex}`;
          params.push(type);
          paramIndex++;
        }

        query += ` ORDER BY created_at DESC LIMIT $${paramIndex} OFFSET $${
          paramIndex + 1
        }`;
        params.push(limit, offset);

        const result = await pool.query(query, params);
        return result.rows;
      } catch (error) {
        fastify.log.error(error);
        return reply.status(500).send({ error: 'Internal server error' });
      }
    }
  );

  // Get relations by type
  fastify.get<{
    Params: { type: string };
    Querystring: {
      limit?: number;
      offset?: number;
    };
  }>(
    '/relations/type/:type',
    {
      schema: {
        description: 'Get relations by relation type',
        tags: ['relations'],
        params: {
          type: 'object',
          properties: {
            type: {
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
          required: ['type'],
        },
        querystring: {
          type: 'object',
          properties: {
            limit: { type: 'number', minimum: 1, maximum: 1000 },
            offset: { type: 'number', minimum: 0 },
          },
        },
        response: {
          200: {
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string' },
                from_node: { type: 'string' },
                to_node: { type: 'string' },
                type: { type: 'string' },
                description: { type: ['string', 'null'] },
                start_date: { type: ['string', 'null'] },
                end_date: { type: ['string', 'null'] },
                created_at: { type: 'string' },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      try {
        const { type } = request.params;
        const { limit = 100, offset = 0 } = request.query;

        const result = await pool.query(
          `SELECT id, from_node, to_node, type, description, start_date, end_date, created_at 
         FROM relations 
         WHERE type = $1 
         ORDER BY created_at DESC 
         LIMIT $2 OFFSET $3`,
          [type, limit, offset]
        );

        return result.rows;
      } catch (error) {
        fastify.log.error(error);
        return reply.status(500).send({ error: 'Internal server error' });
      }
    }
  );
};

export default relationsRoutes;
