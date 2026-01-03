import { useState, useCallback, useEffect } from 'react';
import { LayoutType } from '../types';

export const useGraphLayout = (cyRef: React.RefObject<any>) => {
  const [layout, setLayout] = useState<LayoutType>('cose');

  const applyLayout = useCallback(
    (layoutType: LayoutType) => {
      const cy = cyRef.current;
      if (!cy) return;

      let layoutOptions: any = {
        name: layoutType,
        animate: true,
        animationDuration: 1000,
      };

      // Layout-specific options
      switch (layoutType) {
        case 'cose':
          layoutOptions = {
            ...layoutOptions,
            fit: true,
            padding: 30,
            randomize: false,
            componentSpacing: 100,
            nodeRepulsion: 400000,
            nodeOverlap: 10,
            idealEdgeLength: 100,
            edgeElasticity: 100,
            nestingFactor: 5,
            gravity: 50,
            numIter: 1000,
            initialTemp: 200,
            coolingFactor: 0.95,
            minTemp: 1.0,
          };
          break;

        case 'dagre':
          layoutOptions = {
            ...layoutOptions,
            fit: true,
            padding: 30,
            rankDir: 'TB', // Top to Bottom
            rankSep: 50,
            nodeSep: 50,
            edgeSep: 10,
            animateFilter: (node: any, i: number) => true,
            ready: () => {},
            stop: () => {},
          };
          break;

        case 'grid':
          layoutOptions = {
            ...layoutOptions,
            fit: true,
            padding: 30,
            avoidOverlap: true,
            avoidOverlapPadding: 10,
            condense: false,
            rows: undefined,
            cols: undefined,
          };
          break;

        case 'circle':
          layoutOptions = {
            ...layoutOptions,
            fit: true,
            padding: 30,
            avoidOverlap: true,
            avoidOverlapPadding: 10,
            radius: undefined,
            startAngle: (3 / 2) * Math.PI,
            sweep: undefined,
            clockwise: true,
            sort: undefined,
            animateFilter: (node: any, i: number) => true,
          };
          break;
      }

      const layoutInstance = cy.layout(layoutOptions);
      layoutInstance.run();
    },
    [cyRef]
  );

  // Apply layout when it changes
  useEffect(() => {
    if (cyRef.current) {
      applyLayout(layout);
    }
  }, [layout, applyLayout, cyRef]);

  return {
    layout,
    setLayout,
    applyLayout,
  };
};
