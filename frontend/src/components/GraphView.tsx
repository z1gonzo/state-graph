import React, { useState, useEffect, useRef, useCallback } from 'react';
import {
  Box,
  Paper,
  Typography,
  Button,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  Chip,
  Grid,
  Card,
  CardContent,
} from '@mui/material';
import cytoscape from 'cytoscape';
import { InstitutionLevel, RelationType, LayoutType } from '../types';
import { useGraphData } from '../hooks/useGraphData';
import { useGraphLayout } from '../hooks/useGraphLayout';
import { useGraphInteractions } from '../hooks/useGraphInteractions';

const GraphView: React.FC = () => {
  const [selectedLevel, setSelectedLevel] = useState<InstitutionLevel | 'all'>(
    'all'
  );
  const [selectedRelationType, setSelectedRelationType] = useState<
    RelationType | 'all'
  >('all');
  const [isLoaded, setIsLoaded] = useState(false);

  const containerRef = useRef<HTMLDivElement>(null);
  const cyRef = useRef<any>(null);

  const { graphData, loading, error, fetchGraphData } = useGraphData();
  const { layout, setLayout, applyLayout } = useGraphLayout(cyRef);
  const { selectedNode, setSelectedNode, hoveredNode, setHoveredNode } =
    useGraphInteractions(cyRef);

  // Initialize graph when data is loaded
  useEffect(() => {
    if (graphData && containerRef.current && !cyRef.current) {
      const cy = cytoscape({
        container: containerRef.current,
        elements: graphData,
        style: [
          {
            selector: 'node',
            style: {
              'background-color': '#1976d2',
              label: 'data(name)',
              'text-valign': 'center',
              'text-halign': 'center',
              color: '#fff',
              'font-size': 12,
              'text-wrap': 'wrap',
              'text-max-width': '150px',
              width: 40,
              height: 40,
              'border-width': 2,
              'border-color': '#fff',
              'z-index': 10,
            },
          },
          {
            selector: 'node[type="person"]',
            style: {
              'background-color': '#4caf50',
              shape: 'ellipse',
            },
          },
          {
            selector: 'node[institution_level="organ_centralny"]',
            style: {
              'background-color': '#d32f2f',
              width: 60,
              height: 60,
            },
          },
          {
            selector: 'node[institution_level="ministerstwo"]',
            style: {
              'background-color': '#ff9800',
              width: 55,
              height: 55,
            },
          },
          {
            selector: 'node[institution_level="wojewodztwo"]',
            style: {
              'background-color': '#9c27b0',
              width: 50,
              height: 50,
            },
          },
          {
            selector: 'node[institution_level="powiat"]',
            style: {
              'background-color': '#3f51b5',
              width: 45,
              height: 45,
            },
          },
          {
            selector: 'node[institution_level="gmina"]',
            style: {
              'background-color': '#009688',
              width: 40,
              height: 40,
            },
          },
          {
            selector: 'node[institution_level="rada_miasta"]',
            style: {
              'background-color': '#795548',
              width: 35,
              height: 35,
            },
          },
          {
            selector: 'edge',
            style: {
              width: 2,
              'line-color': '#999',
              'target-arrow-color': '#999',
              'target-arrow-shape': 'triangle',
              'curve-style': 'bezier',
              'z-index': 1,
            },
          },
          {
            selector: 'edge[type="hierarchical"]',
            style: {
              'line-color': '#1976d2',
              'target-arrow-color': '#1976d2',
            },
          },
          {
            selector: 'edge[type="supervisory"]',
            style: {
              'line-color': '#f44336',
              'target-arrow-color': '#f44336',
            },
          },
          {
            selector: 'edge[type="membership"]',
            style: {
              'line-color': '#4caf50',
              'target-arrow-color': '#4caf50',
            },
          },
          {
            selector: 'edge[type="appointment"]',
            style: {
              'line-color': '#ff9800',
              'target-arrow-color': '#ff9800',
            },
          },
          {
            selector: 'edge[type="independent"]',
            style: {
              'line-color': '#9c27b0',
              'target-arrow-color': '#9c27b0',
            },
          },
          {
            selector: ':selected',
            style: {
              'background-color': '#ffd54f',
              'border-color': '#333',
              'border-width': 3,
              color: '#333',
            },
          },
          {
            selector: 'node:hover',
            style: {
              'background-color': '#fff',
              color: '#333',
              'text-outline-width': 2,
              'text-outline-color': '#fff',
            },
          },
        ],
        layout: {
          name: 'cose',
          animate: true,
          animationDuration: 1000,
        },
      });

      cyRef.current = cy;

      // Add event listeners
      cy.on('tap', 'node', (evt: any) => {
        setSelectedNode(evt.target.data());
      });

      cy.on('mouseover', 'node', (evt: any) => {
        setHoveredNode(evt.target.data());
      });

      cy.on('mouseout', 'node', () => {
        setHoveredNode(null);
      });

      setIsLoaded(true);
    }
  }, [graphData]);

  // Update graph when filters change
  useEffect(() => {
    if (cyRef.current && graphData) {
      const cy = cyRef.current;

      // Filter nodes based on selected level
      const nodes = cy.nodes();
      nodes.forEach((node: any) => {
        const shouldShow =
          selectedLevel === 'all' ||
          node.data('institution_level') === selectedLevel;
        node.style('display', shouldShow ? 'element' : 'none');
      });

      // Filter edges based on selected relation type
      const edges = cy.edges();
      edges.forEach((edge: any) => {
        const shouldShow =
          selectedRelationType === 'all' ||
          edge.data('type') === selectedRelationType;
        edge.style('display', shouldShow ? 'element' : 'none');
      });
    }
  }, [selectedLevel, selectedRelationType, graphData]);

  const handleLayoutChange = (newLayout: LayoutType) => {
    setLayout(newLayout);
    if (cyRef.current) {
      applyLayout(newLayout);
    }
  };

  const handleResetView = () => {
    if (cyRef.current) {
      cyRef.current.fit();
    }
  };

  const handleRefreshData = () => {
    fetchGraphData();
  };

  return (
    <Box>
      <Typography variant="h4" gutterBottom>
        Government Structure Visualization
      </Typography>

      <Grid container spacing={2} sx={{ mb: 2 }}>
        <Grid size={{ xs: 12, md: 3 }} component="div">
          <FormControl fullWidth>
            <InputLabel>Institution Level</InputLabel>
            <Select
              value={selectedLevel}
              label="Institution Level"
              onChange={(e) =>
                setSelectedLevel(e.target.value as InstitutionLevel | 'all')
              }
            >
              <MenuItem value="all">All Levels</MenuItem>
              <MenuItem value="organ_centralny">Central Government</MenuItem>
              <MenuItem value="ministerstwo">Ministry</MenuItem>
              <MenuItem value="wojewodztwo">Voivodeship</MenuItem>
              <MenuItem value="powiat">County</MenuItem>
              <MenuItem value="gmina">Municipality</MenuItem>
              <MenuItem value="rada_miasta">City Council</MenuItem>
            </Select>
          </FormControl>
        </Grid>

        <Grid size={{ xs: 12, md: 3 }} component="div">
          <FormControl fullWidth>
            <InputLabel>Relation Type</InputLabel>
            <Select
              value={selectedRelationType}
              label="Relation Type"
              onChange={(e) =>
                setSelectedRelationType(e.target.value as RelationType | 'all')
              }
            >
              <MenuItem value="all">All Relations</MenuItem>
              <MenuItem value="hierarchical">Hierarchical</MenuItem>
              <MenuItem value="supervisory">Supervisory</MenuItem>
              <MenuItem value="membership">Membership</MenuItem>
              <MenuItem value="appointment">Appointment</MenuItem>
              <MenuItem value="independent">Independent</MenuItem>
            </Select>
          </FormControl>
        </Grid>

        <Grid size={{ xs: 12, md: 3 }} component="div">
          <FormControl fullWidth>
            <InputLabel>Layout</InputLabel>
            <Select
              value={layout}
              label="Layout"
              onChange={(e) => handleLayoutChange(e.target.value)}
            >
              <MenuItem value="cose">Force-Directed (CoSE)</MenuItem>
              <MenuItem value="dagre">Hierarchical (Dagre)</MenuItem>
              <MenuItem value="grid">Grid</MenuItem>
              <MenuItem value="circle">Circle</MenuItem>
            </Select>
          </FormControl>
        </Grid>

        <Grid size={{ xs: 12, md: 3 }} component="div">
          <Box sx={{ display: 'flex', gap: 1 }}>
            <Button variant="outlined" onClick={handleResetView}>
              Reset View
            </Button>
            <Button variant="outlined" onClick={handleRefreshData}>
              Refresh Data
            </Button>
          </Box>
        </Grid>
      </Grid>

      <Grid container spacing={2} sx={{ mb: 2 }}>
        <Grid size={{ xs: 12, md: 8 }} component="div">
          <Paper sx={{ height: '600px', position: 'relative' }}>
            <div ref={containerRef} style={{ width: '100%', height: '100%' }} />
            {loading && (
              <Box
                sx={{
                  position: 'absolute',
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  backgroundColor: 'rgba(255, 255, 255, 0.8)',
                  zIndex: 100,
                }}
              >
                <Typography>Loading graph data...</Typography>
              </Box>
            )}
            {error && (
              <Box
                sx={{
                  position: 'absolute',
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  backgroundColor: 'rgba(255, 255, 255, 0.8)',
                  zIndex: 100,
                }}
              >
                <Typography color="error">
                  Error loading data: {error}
                </Typography>
              </Box>
            )}
          </Paper>
        </Grid>

        <Grid size={{ xs: 12, md: 4 }} component="div">
          <Card>
            <CardContent>
              <Typography variant="h6" gutterBottom>
                Node Information
              </Typography>
              {selectedNode ? (
                <Box>
                  <Typography>
                    <strong>Name:</strong> {selectedNode.name}
                  </Typography>
                  <Typography>
                    <strong>Type:</strong> {selectedNode.type}
                  </Typography>
                  {selectedNode.institution_level && (
                    <Typography>
                      <strong>Level:</strong> {selectedNode.institution_level}
                    </Typography>
                  )}
                  {selectedNode.description && (
                    <Typography>
                      <strong>Description:</strong> {selectedNode.description}
                    </Typography>
                  )}
                </Box>
              ) : (
                <Typography color="textSecondary">
                  Click on a node to see its details
                </Typography>
              )}

              <Box sx={{ mt: 3 }}>
                <Typography variant="h6" gutterBottom>
                  Legend
                </Typography>
                <Box sx={{ display: 'flex', flexDirection: 'column', gap: 1 }}>
                  <Chip label="Central Government" color="error" size="small" />
                  <Chip label="Ministry" color="warning" size="small" />
                  <Chip label="Voivodeship" color="secondary" size="small" />
                  <Chip label="County" color="primary" size="small" />
                  <Chip label="Municipality" color="success" size="small" />
                  <Chip label="City Council" color="default" size="small" />
                  <Chip
                    label="Person"
                    color="success"
                    variant="outlined"
                    size="small"
                  />
                </Box>
              </Box>
            </CardContent>
          </Card>
        </Grid>
      </Grid>
    </Box>
  );
};

export default GraphView;
