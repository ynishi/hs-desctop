{-# LANGUAGE NamedFieldPuns    #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Control.Concurrent
import qualified Control.Foldl      as F
import qualified Data.Text          as T
import           Turtle             as Tu

run cmd args = fold (proc cmd args empty) F.list

txt = T.concat . map lineToText

data Xdo = Xdo
  { key :: T.Text
  }

runXdo x@Xdo {key} = do
  runXdoIn x
  Tu.sleep 1
  runXdoIn (Xdo "Return")

runXdoIn Xdo {key} = run "xdotool" ["key", key]

restartShell = Xdo "Alt+F2+r"

main = runXdo restartShell
