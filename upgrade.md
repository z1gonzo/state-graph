# Node.js 22.21.1 Upgrade Plan

## Overview

This document tracks the migration from Node.js 18+ to Node.js 22.21.1 for the state-graph project to improve performance, security, and modern JavaScript feature support.

## Current State

- **Node.js Version**: >=18.0.0 (specified in package.json engines)
- **Frontend Dependencies**: React 18.2.0, Material-UI 5.14.18, TypeScript 4.9.5
- **Backend Dependencies**: Fastify 4.24.3, TypeScript 5.3.3
- **Issues**: Fastify-swagger version conflicts, outdated dependency versions

## Target State

- **Node.js Version**: >=22.0.0 (recommended 22.21.1)
- **Optimized Dependencies**: Latest compatible versions for Node.js 22
- **Enhanced Performance**: 15-20% performance improvement expected
- **Better Security**: Latest security patches and improvements

## Migration Steps

### Phase 1: Documentation and Version Locking

- [ ] Create .nvmrc file with Node.js 22.21.1
- [ ] Update TODO.md to reflect Node.js 22 requirement
- [ ] Update README.md with Node.js 22.21.1 recommendation

### Phase 2: Package Configuration Updates

- [ ] Update backend/package.json engines field to "node": ">=22.0.0"
- [ ] Update frontend/package.json engines field to "node": ">=22.0.0"
- [ ] Re-evaluate Fastify plugin versions for Node.js 22 compatibility
- [ ] Consider upgrading TypeScript versions for both frontend and backend

### Phase 3: Dependency Optimization

- [ ] Check for newer Fastify-swagger versions compatible with Node.js 22
- [ ] Review Material-UI and React dependencies for Node.js 22 compatibility
- [ ] Update any other dependencies that can benefit from Node.js 22 features
- [ ] Test dependency compatibility

### Phase 4: Testing and Validation

- [ ] Test backend API functionality with Node.js 22
- [ ] Test frontend build and development server with Node.js 22
- [ ] Verify graph visualization functionality
- [ ] Test database connections and operations
- [ ] Validate all build processes work properly

### Phase 5: Development Environment Setup

- [ ] Update any CI/CD configurations for Node.js 22
- [ ] Document Node.js 22 requirement clearly in setup instructions
- [ ] Add Node.js version check in build scripts if needed

## Benefits

- **Performance**: 15-20% better performance than Node.js 20
- **Security**: Latest security patches and improvements
- **Features**: Enhanced async/await, better error handling, modern JavaScript support
- **Stability**: Well-tested in production environments
- **Future-proofing**: Positions project for future dependency updates

## Rollback Plan

If issues arise during migration:

1. Revert package.json engines field to "node": ">=18.0.0"
2. Revert any dependency version changes
3. Remove .nvmrc file
4. Test functionality with Node.js 18

## Notes

- All current dependencies (React 18, Fastify 4, Material-UI 5) are compatible with Node.js 22
- TypeScript 5.x works excellently with Node.js 22
- Modern tooling and build systems are optimized for Node.js 22
