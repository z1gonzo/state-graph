import { useState, useCallback, useEffect } from 'react';
import { Node } from '../types';

export const useGraphInteractions = (cyRef: React.RefObject<any>) => {
  const [selectedNode, setSelectedNode] = useState<Node | null>(null);
  const [hoveredNode, setHoveredNode] = useState<Node | null>(null);

  const highlightNode = useCallback(
    (nodeId: string | null) => {
      const cy = cyRef.current;
      if (!cy) return;

      // Reset all styles
      cy.elements().removeClass('highlighted');
      cy.elements().removeClass('faded');

      if (nodeId) {
        const node = cy.getElementById(nodeId);
        if (node) {
          // Highlight selected node and its neighbors
          node.addClass('highlighted');

          // Highlight connected edges
          node.connectedEdges().addClass('highlighted');

          // Fade unconnected elements
          const connectedNodes = node.connectedNodes();
          cy.elements()
            .difference(connectedNodes)
            .difference(node)
            .addClass('faded');
        }
      }
    },
    [cyRef]
  );

  const centerOnNode = useCallback(
    (nodeId: string) => {
      const cy = cyRef.current;
      if (!cy) return;

      const node = cy.getElementById(nodeId);
      if (node) {
        cy.animate({
          fit: { eles: node, padding: 50 },
          duration: 1000,
        });
      }
    },
    [cyRef]
  );

  const zoomToFit = useCallback(() => {
    const cy = cyRef.current;
    if (cy) {
      cy.fit();
    }
  }, [cyRef]);

  const resetStyles = useCallback(() => {
    const cy = cyRef.current;
    if (cy) {
      cy.elements().removeClass('highlighted');
      cy.elements().removeClass('faded');
    }
  }, [cyRef]);

  // Set up event listeners
  useEffect(() => {
    const cy = cyRef.current;
    if (!cy) return;

    const handleNodeTap = (evt: any) => {
      const nodeData = evt.target.data();
      setSelectedNode(nodeData);
      highlightNode(nodeData.id);
    };

    const handleNodeMouseOver = (evt: any) => {
      const nodeData = evt.target.data();
      setHoveredNode(nodeData);
    };

    const handleNodeMouseOut = () => {
      setHoveredNode(null);
    };

    const handleBackgroundTap = () => {
      setSelectedNode(null);
      setHoveredNode(null);
      resetStyles();
    };

    cy.on('tap', 'node', handleNodeTap);
    cy.on('mouseover', 'node', handleNodeMouseOver);
    cy.on('mouseout', 'node', handleNodeMouseOut);
    cy.on('tap', handleBackgroundTap);

    return () => {
      cy.off('tap', 'node', handleNodeTap);
      cy.off('mouseover', 'node', handleNodeMouseOver);
      cy.off('mouseout', 'node', handleNodeMouseOut);
      cy.off('tap', handleBackgroundTap);
    };
  }, [cyRef, highlightNode, resetStyles]);

  return {
    selectedNode,
    hoveredNode,
    setSelectedNode,
    setHoveredNode,
    highlightNode,
    centerOnNode,
    zoomToFit,
    resetStyles,
  };
};
