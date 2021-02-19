{-# LANGUAGE ScopedTypeVariables #-}
module Examples.Trivial where

import           Katip
import           Katip.Scribes.Handle (ioLogEnv)

import           Cardano.Logging
import           Examples.TestObjects


-- | Make shure the function append name is only called once
--   for every path element
test1 :: IO ()
test1 = do
    simpleTracer1 <- stdoutObjectKatipTracer
    let simpleTracer1' = filterTraceBySeverity (Just WarningF) simpleTracer1
    let simpleTracerC1 = appendName "Outer1" simpleTracer1'
    let simpleTracerC2 = appendName "Inner1" simpleTracerC1
    let simpleTracerC3 = setSeverity Error
                        $ setPrivacy Confidential
                            $ appendName "Inner2" simpleTracerC1
    traceWith (setSeverity Error simpleTracerC2) logObject1
    traceWith (setSeverity Warning simpleTracerC3) logObject2
    traceWith simpleTracerC2 logObject3
    traceWith (setSeverity Critical (appendName "Inner3" simpleTracerC3)) logObject4

test2 :: IO ()
test2 = do
    simpleTracer <- stdoutObjectKatipTracer
    let simpleTracer1  = withSeverity loSeverity
                            (filterTraceBySeverity (Just WarningF) simpleTracer)
    let simpleTracerC1 = appendName "Outer1" simpleTracer1
    let simpleTracerC2 = appendName "Inner1" simpleTracerC1
    let simpleTracerC3 = setPrivacy Confidential $ appendName "Inner2" simpleTracerC1
    traceWith simpleTracerC2 logObject1
    traceWith (setSeverity Critical simpleTracerC3) logObject2
    traceWith simpleTracerC2 logObject3
    traceWith (appendName "Inner3" simpleTracerC3) logObject4
    traceWith (appendName "cont1" $ appendName "cont2" $ appendName "cont3" simpleTracerC2) logObject1

loSeverity :: LO -> SeverityS
loSeverity LO1 {} = Warning
loSeverity LO2 {} = Error
