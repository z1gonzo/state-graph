import React, { useState } from 'react';
import {
  Box,
  Typography,
  Paper,
  TextField,
  Button,
  Switch,
  FormControlLabel,
  Card,
  CardContent,
  Alert,
} from '@mui/material';

const Settings: React.FC = () => {
  const [apiUrl, setApiUrl] = useState('http://localhost:4000/api/v1');
  const [autoRefresh, setAutoRefresh] = useState(false);
  const [refreshInterval, setRefreshInterval] = useState(30);
  const [theme, setTheme] = useState('light');
  const [showTooltips, setShowTooltips] = useState(true);
  const [nodeSize, setNodeSize] = useState(40);
  const [edgeWidth, setEdgeWidth] = useState(2);

  const handleSaveSettings = () => {
    // Save settings to localStorage or send to backend
    localStorage.setItem(
      'stateGraphSettings',
      JSON.stringify({
        apiUrl,
        autoRefresh,
        refreshInterval,
        theme,
        showTooltips,
        nodeSize,
        edgeWidth,
      })
    );

    // Update environment variable for API calls
    process.env.REACT_APP_API_URL = apiUrl;
  };

  const handleResetSettings = () => {
    setApiUrl('http://localhost:4000/api/v1');
    setAutoRefresh(false);
    setRefreshInterval(30);
    setTheme('light');
    setShowTooltips(true);
    setNodeSize(40);
    setEdgeWidth(2);

    localStorage.removeItem('stateGraphSettings');
  };

  return (
    <Box>
      <Typography variant="h4" gutterBottom>
        Application Settings
      </Typography>

      <Box
        sx={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 2, mb: 3 }}
      >
        <Card>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              API Configuration
            </Typography>
            <TextField
              fullWidth
              label="API URL"
              value={apiUrl}
              onChange={(e) => setApiUrl(e.target.value)}
              helperText="Backend API endpoint URL"
              sx={{ mb: 2 }}
            />
            <FormControlLabel
              control={
                <Switch
                  checked={autoRefresh}
                  onChange={(e) => setAutoRefresh(e.target.checked)}
                />
              }
              label="Enable Auto Refresh"
            />
            <TextField
              fullWidth
              label="Refresh Interval (seconds)"
              type="number"
              value={refreshInterval}
              onChange={(e) => setRefreshInterval(parseInt(e.target.value))}
              disabled={!autoRefresh}
              sx={{ mt: 1 }}
            />
          </CardContent>
        </Card>

        <Card>
          <CardContent>
            <Typography variant="h6" gutterBottom>
              Visual Settings
            </Typography>
            <TextField
              fullWidth
              label="Node Size"
              type="number"
              value={nodeSize}
              onChange={(e) => setNodeSize(parseInt(e.target.value))}
              sx={{ mb: 2 }}
            />
            <TextField
              fullWidth
              label="Edge Width"
              type="number"
              value={edgeWidth}
              onChange={(e) => setEdgeWidth(parseInt(e.target.value))}
              sx={{ mb: 2 }}
            />
            <FormControlLabel
              control={
                <Switch
                  checked={showTooltips}
                  onChange={(e) => setShowTooltips(e.target.checked)}
                />
              }
              label="Show Tooltips"
            />
          </CardContent>
        </Card>
      </Box>

      <Card>
        <CardContent>
          <Typography variant="h6" gutterBottom>
            System Information
          </Typography>
          <Box sx={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 2 }}>
            <Paper sx={{ p: 2 }}>
              <Typography variant="subtitle2" color="textSecondary">
                Backend Status
              </Typography>
              <Typography variant="body1">Connected</Typography>
            </Paper>
            <Paper sx={{ p: 2 }}>
              <Typography variant="subtitle2" color="textSecondary">
                Frontend Version
              </Typography>
              <Typography variant="body1">1.0.0</Typography>
            </Paper>
            <Paper sx={{ p: 2 }}>
              <Typography variant="subtitle2" color="textSecondary">
                Database
              </Typography>
              <Typography variant="body1">PostgreSQL</Typography>
            </Paper>
            <Paper sx={{ p: 2 }}>
              <Typography variant="subtitle2" color="textSecondary">
                Visualization Engine
              </Typography>
              <Typography variant="body1">Cytoscape.js</Typography>
            </Paper>
          </Box>
        </CardContent>
      </Card>

      <Box sx={{ mt: 3, display: 'flex', gap: 2 }}>
        <Button variant="contained" onClick={handleSaveSettings}>
          Save Settings
        </Button>
        <Button variant="outlined" onClick={handleResetSettings}>
          Reset to Defaults
        </Button>
      </Box>

      <Alert severity="info" sx={{ mt: 2 }}>
        Settings are automatically saved to your browser. Changes will take
        effect after refreshing the page.
      </Alert>
    </Box>
  );
};

export default Settings;
