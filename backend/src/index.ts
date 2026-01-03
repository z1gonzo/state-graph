import fastify from 'fastify';
// @ts-ignore
import cors from 'fastify-cors';
// @ts-ignore
import swagger from 'fastify-swagger';
import { pool } from './config/database';

const server = fastify({
  logger: true,
});

// Register CORS
server.register(cors, {
  origin: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  credentials: true,
});

// Register Swagger
server.register(swagger, {
  routePrefix: '/docs',
  swagger: {
    info: {
      title: 'State Graph API',
      description: 'API for government structure visualization',
      version: '1.0.0',
    },
    host: 'localhost:4000',
    schemes: ['http'],
    consumes: ['application/json'],
    produces: ['application/json'],
    tags: [
      { name: 'nodes', description: 'Node operations' },
      { name: 'relations', description: 'Relation operations' },
      { name: 'graph', description: 'Graph operations' },
    ],
  },
  exposeRoute: true,
});

// Health check endpoint
server.get('/health', async (request, reply) => {
  try {
    const result = await pool.query('SELECT NOW() as current_time');
    return {
      status: 'ok',
      timestamp: new Date().toISOString(),
      database: 'connected',
      current_time: result.rows[0].current_time,
    };
  } catch (error) {
    server.log.error(error);
    return {
      status: 'error',
      timestamp: new Date().toISOString(),
      database: 'disconnected',
    };
  }
});

// Import routes
import './routes/nodes';
import './routes/relations';
import './routes/graph';

// Start server
const start = async () => {
  try {
    await server.listen(4000, '0.0.0.0');
    server.log.info(`Server listening on http://localhost:4000`);
    server.log.info(`Swagger docs available at http://localhost:4000/docs`);
  } catch (err) {
    server.log.error(err);
    process.exit(1);
  }
};

start();
