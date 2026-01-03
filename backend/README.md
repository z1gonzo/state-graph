# State Graph Backend API

A Node.js backend API built with Fastify and TypeScript for serving government structure data to the state-graph frontend.

## Features

- **RESTful API**: Complete API for nodes, relations, and graph operations
- **Cytoscape.js Integration**: Graph data formatted for Cytoscape.js visualization
- **Hierarchical Tree Structure**: Tree endpoint for hierarchical data representation
- **Database Integration**: PostgreSQL with connection pooling
- **TypeScript**: Full TypeScript support with type definitions
- **Swagger Documentation**: Auto-generated API documentation
- **Error Handling**: Comprehensive error handling and logging

## API Endpoints

### Health Check

- `GET /health` - Health check endpoint

### Nodes

- `GET /nodes` - Get all nodes with optional filtering
- `GET /nodes/:id` - Get a specific node by ID
- `GET /nodes/level/:level` - Get nodes by institution level

### Relations

- `GET /relations` - Get all relations with optional filtering
- `GET /relations/node/:nodeId` - Get relations for a specific node
- `GET /relations/type/:type` - Get relations by relation type

### Graph Operations

- `GET /graph` - Get graph data in Cytoscape.js format
- `GET /tree` - Get hierarchical tree structure
- `GET /graph/node/:nodeId` - Get subgraph for a specific node

## Database Schema

The API works with the following database schema:

- **nodes**: Government institutions and people
- **relations**: Relationships between nodes (hierarchical, supervisory, membership, appointment, independent)

## Installation

1. Install dependencies:

```bash
cd backend
npm install
```

2. Set up environment variables:

```bash
cp .env.example .env
# Edit .env with your database configuration
```

3. Build the project:

```bash
npm run build
```

4. Start the server:

```bash
npm start
```

## Development

For development with auto-restart:

```bash
npm run dev
```

## Database Setup

1. Ensure PostgreSQL is running
2. Create the database:

```sql
CREATE DATABASE state_structure;
```

3. Run the schema:

```bash
psql -U postgres -d state_structure -f ../database/schema.sql
```

4. Seed with generic structure:

```bash
psql -U postgres -d state_structure -f ../database/seed_generic_structure.sql
```

## API Documentation

Swagger documentation is available at:

- `http://localhost:4000/docs`

## Environment Variables

- `DB_HOST`: Database host (default: localhost)
- `DB_PORT`: Database port (default: 5432)
- `DB_NAME`: Database name (default: state_structure)
- `DB_USER`: Database user (default: postgres)
- `DB_PASSWORD`: Database password (default: postgres)
- `DB_SSL`: Enable SSL (default: false)
- `PORT`: Server port (default: 4000)
- `NODE_ENV`: Environment (default: development)

## Project Structure

```
backend/
├── src/
│   ├── config/
│   │   └── database.ts     # Database connection
│   ├── routes/
│   │   ├── nodes.ts        # Node endpoints
│   │   ├── relations.ts    # Relation endpoints
│   │   └── graph.ts        # Graph endpoints
│   └── index.ts            # Main server file
├── dist/                   # Compiled output
├── package.json
├── tsconfig.json
└── README.md
```

## Technologies Used

- **Fastify**: Web framework
- **TypeScript**: Type-safe JavaScript
- **PostgreSQL**: Database
- **pg**: PostgreSQL client
- **dotenv**: Environment variables
- **fastify-cors**: CORS support
- **fastify-swagger**: API documentation

## License

MIT License
