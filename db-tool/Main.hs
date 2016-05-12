{-# LANGUAGE TemplateHaskell #-}

module Main where

import Data.Acid
import Data.Acid.Remote
import Data.FileEmbed
import Database
import Network

main :: IO ()
main = do
    st <- openRemoteState (sharedSecretPerform $(embedFile "important-secret"))
        "(unused)"
        (UnixSocket "/var/run/jude-db.sock")
    db <- query st Dump
    print db
