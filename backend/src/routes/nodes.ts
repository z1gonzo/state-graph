import { FastifyInstance } from 'fastify';
import { pool } from '../config/database';

interface Node {
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

const nodesRoutes = async (fastify: FastifyInstance) => {
  // Get all nodes
  fastify.get<{
    Querystring: {
      type?: string;
      level?: string;
      limit?: number;
      offset?: number;
    };
  }>(
    '/nodes',
    {
      schema: {
        description: 'Get all nodes with optional filtering',
        tags: ['nodes'],
        querystring: {
          type: 'object',
          properties: {
            type: { type: 'string', enum: ['institution', 'person'] },
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
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: { type: 'string' },
                type: { type: 'string' },
                name: { type: 'string' },
                description: { type: ['string', 'null'] },
                institution_level: { type: ['string', 'null'] },
                start_date: { type: ['string', 'null'] },
                end_date: { type: ['string', 'null'] },
                created_at: { type: 'string' },
                updated_at: { type: 'string' },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      try {
        const { type, level, limit = 100, offset = 0 } = request.query;

        let query = `
        SELECT id, type, name, description, institution_level, 
               start_date, end_date, created_at, updated_at
        FROM nodes
        WHERE 1=1
      `;
        const params: any[] = [];
        let paramIndex = 1;

        if (type) {
          query += ` AND type = $${paramIndex}`;
          params.push(type);
          paramIndex++;
        }

        if (level) {
          query += ` AND institution_level = $${paramIndex}`;
          params.push(level);
          paramIndex++;
        }

        query += ` ORDER BY name LIMIT $${paramIndex} OFFSET $${
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

  // Get node by ID
  fastify.get<{
    Params: { id: string };
  }>(
    '/nodes/:id',
    {
      schema: {
        description: 'Get a specific node by ID',
        tags: ['nodes'],
        params: {
          type: 'object',
          properties: {
            id: { type: 'string', format: 'uuid' },
          },
          required: ['id'],
        },
        response: {
          200: {
            type: 'object',
            properties: {
              id: { type: 'string' },
              type: { type: 'string' },
              name: { type: 'string' },
              description: { type: ['string', 'null'] },
              institution_level: { type: ['string', 'null'] },
              start_date: { type: ['string', 'null'] },
              end_date: { type: ['string', 'null'] },
              created_at: { type: 'string' },
              updated_at: { type: 'string' },
            },
          },
          404: {
            type: 'object',
            properties: {
              error: { type: 'string' },
            },
          },
        },
      },
    },
    async (request, reply) => {
      try {
        const { id } = request.params;
        const result = await pool.query(
          'SELECT id, type, name, description, institution_level, start_date, end_date, created_at, updated_at FROM nodes WHERE id = $1',
          [id]
        );

        if (result.rows.length === 0) {
          return reply.status(404).send({ error: 'Node not found' });
        }

        return result.rows[0];
      } catch (error) {
        fastify.log.error(error);
        return reply.status(500).send({ error: 'Internal server error' });
      }
    }
  );

  // Get nodes by institution level
  fastify.get<{
    Params: { level: string };
    Querystring: {
      limit?: number;
      offset?: number;
    };
  }>(
    '/nodes/level/:level',
    {
      schema: {
        description: 'Get nodes by institution level',
        tags: ['nodes'],
        params: {
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
          },
          required: ['level'],
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
                type: { type: 'string' },
                name: { type: 'string' },
                description: { type: ['string', 'null'] },
                institution_level: { type: ['string', 'null'] },
                start_date: { type: ['string', 'null'] },
                end_date: { type: ['string', 'null'] },
                created_at: { type: 'string' },
                updated_at: { type: 'string' },
              },
            },
          },
        },
      },
    },
    async (request, reply) => {
      try {
        const { level } = request.params;
        const { limit = 100, offset = 0 } = request.query;

        const result = await pool.query(
          `SELECT id, type, name, description, institution_level, start_date, end_date, created_at, updated_at 
         FROM nodes 
         WHERE institution_level = $1 
         ORDER BY name 
         LIMIT $2 OFFSET $3`,
          [level, limit, offset]
        );

        return result.rows;
      } catch (error) {
        fastify.log.error(error);
        return reply.status(500).send({ error: 'Internal server error' });
      }
    }
  );
};

export default nodesRoutes;
