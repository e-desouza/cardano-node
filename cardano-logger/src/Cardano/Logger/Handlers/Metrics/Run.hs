module Cardano.Logger.Handlers.Metrics.Run
  ( runMetricsHandler
  ) where

import           System.Remote.Monitoring

import           Cardano.Logger.Configuration
import           Cardano.Logger.Types (AcceptedItems)

runMetricsHandler
  :: LoggerConfig
  -> AcceptedItems
  -> IO ()
runMetricsHandler config acceptedItems = do
  --itemsFromAllNodes <- HM.toList <$> readIORef acceptedItems
  --forM_ itemsFromAllNodes $ \(nodeId, (_, _, metrics)) ->


  -- type AcceptedItems = IORef (HashMap NodeId (NodeInfoStore, LogObjects, Metrics))

  --server <- forkServerWith store host port
  return ()
