{-# Language CPP #-}

module Main (main) where

#ifdef ghcjs_HOST_OS
import Frontend.Main (main)
#else
import Backend.Main  (main)
#endif
