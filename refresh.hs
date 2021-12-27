#!/usr/bin/env stack
-- stack script --resolver lts-18.19

{-# LANGUAGE OverloadedStrings #-}

import qualified Control.Foldl as F
import qualified Data.Text as T
import Turtle as Tu
import Control.Concurrent


run cmd args = fold (proc cmd args empty) F.list
txt = T.concat . map lineToText

main = do
    run "xdotool" ["key", "Alt+F2+r"]
    Tu.sleep 1
    run "xdotool" ["key", "Return"]
