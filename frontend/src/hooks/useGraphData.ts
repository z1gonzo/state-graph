import { useState, useCallback } from 'react';
import axios from 'axios';
import { GraphData, GraphFilters, GraphApiResponse } from '../types';

const API_BASE_URL =
  process.env.REACT_APP_API_URL || 'http://localhost:4000/api/v1';

export const useGraphData = () => {
  const [graphData, setGraphData] = useState<GraphData | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const fetchGraphData = useCallback(async (filters?: GraphFilters) => {
    setLoading(true);
    setError(null);

    try {
      const params: any = {};
      if (filters) {
        if (filters.level) params.level = filters.level;
        if (filters.type) params.type = filters.type;
        if (filters.limit) params.limit = filters.limit;
        if (filters.offset) params.offset = filters.offset;
      }

      const response = await axios.get<GraphApiResponse>(
        `${API_BASE_URL}/graph`,
        { params }
      );

      setGraphData(response.data);
    } catch (err: any) {
      console.error('Error fetching graph data:', err);
      setError(err.message || 'Failed to fetch graph data');
    } finally {
      setLoading(false);
    }
  }, []);

  const fetchNodeById = useCallback(async (nodeId: string) => {
    try {
      const response = await axios.get(`${API_BASE_URL}/nodes/${nodeId}`);
      return response.data;
    } catch (err: any) {
      console.error('Error fetching node:', err);
      throw err;
    }
  }, []);

  const fetchRelationsByNodeId = useCallback(
    async (
      nodeId: string,
      direction?: 'from' | 'to' | 'both',
      type?: string
    ) => {
      try {
        const params: any = {};
        if (direction) params.direction = direction;
        if (type) params.type = type;

        const response = await axios.get(
          `${API_BASE_URL}/relations/node/${nodeId}`,
          { params }
        );
        return response.data;
      } catch (err: any) {
        console.error('Error fetching relations:', err);
        throw err;
      }
    },
    []
  );

  return {
    graphData,
    loading,
    error,
    fetchGraphData,
    fetchNodeById,
    fetchRelationsByNodeId,
  };
};
