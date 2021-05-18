module Cardano.Tracer.Handlers.Metrics.Run
  ( runMetricsHandler
  ) where

import           System.Remote.Monitoring

import           Cardano.Tracer.Configuration
import           Cardano.Tracer.Types (AcceptedItems)

runMetricsHandler
  :: TracerConfig
  -> AcceptedItems
  -> IO ()
runMetricsHandler config acceptedItems = do
  --itemsFromAllNodes <- HM.toList <$> readIORef acceptedItems
  --forM_ itemsFromAllNodes $ \(nodeId, (_, _, metrics)) ->


  -- type AcceptedItems = IORef (HashMap NodeId (NodeInfoStore, LogObjects, Metrics))

  --server <- forkServerWith store host port
  return ()
