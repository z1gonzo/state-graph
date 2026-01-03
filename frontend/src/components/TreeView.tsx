import React, { useState, useEffect } from 'react';
import {
  Box,
  Typography,
  Paper,
  Button,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  Card,
  CardContent,
} from '@mui/material';
import { InstitutionLevel } from '../types';
import { useGraphData } from '../hooks/useGraphData';

const TreeView: React.FC = () => {
  const [selectedLevel, setSelectedLevel] = useState<InstitutionLevel | 'all'>(
    'all'
  );
  const [treeData, setTreeData] = useState<any[]>([]);

  const { fetchGraphData } = useGraphData();

  useEffect(() => {
    // Fetch tree data from backend
    const fetchTreeData = async () => {
      try {
        // This would call the /tree endpoint
        // For now, we'll use the graph data and convert it to tree structure
        await fetchGraphData();
      } catch (error) {
        console.error('Error fetching tree data:', error);
      }
    };

    fetchTreeData();
  }, [fetchGraphData]);

  const renderTree = (nodes: any[], depth: number = 0) => {
    return nodes.map((node) => (
      <Box key={node.id} sx={{ ml: depth * 2, mb: 1 }}>
        <Paper
          elevation={2}
          sx={{ p: 1, backgroundColor: getLevelColor(node.institution_level) }}
        >
          <Typography variant="subtitle2">{node.name}</Typography>
          <Typography variant="caption" color="textSecondary">
            {node.institution_level || 'Unknown Level'}
          </Typography>
        </Paper>
        {node.children && node.children.length > 0 && (
          <Box sx={{ borderLeft: '2px solid #ddd', pl: 2 }}>
            {renderTree(node.children, depth + 1)}
          </Box>
        )}
      </Box>
    ));
  };

  const getLevelColor = (level: InstitutionLevel | null) => {
    switch (level) {
      case 'organ_centralny':
        return '#ffebee';
      case 'ministerstwo':
        return '#fff3e0';
      case 'wojewodztwo':
        return '#f3e5f5';
      case 'powiat':
        return '#e3f2fd';
      case 'gmina':
        return '#e8f5e8';
      case 'rada_miasta':
        return '#efebe9';
      default:
        return '#f5f5f5';
    }
  };

  return (
    <Box>
      <Typography variant="h4" gutterBottom>
        Government Structure Tree View
      </Typography>

      <Box sx={{ mb: 2 }}>
        <FormControl fullWidth>
          <InputLabel>Filter by Level</InputLabel>
          <Select
            value={selectedLevel}
            label="Filter by Level"
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
      </Box>

      <Box sx={{ display: 'flex', gap: 2, mb: 2 }}>
        <Button variant="outlined">Expand All</Button>
        <Button variant="outlined">Collapse All</Button>
        <Button variant="outlined">Export Tree</Button>
      </Box>

      <Card>
        <CardContent>
          <Typography variant="h6" gutterBottom>
            Hierarchical Structure
          </Typography>
          {treeData.length > 0 ? (
            <Box sx={{ maxHeight: '600px', overflow: 'auto' }}>
              {renderTree(treeData)}
            </Box>
          ) : (
            <Typography color="textSecondary">
              Loading tree structure...
            </Typography>
          )}
        </CardContent>
      </Card>
    </Box>
  );
};

export default TreeView;
