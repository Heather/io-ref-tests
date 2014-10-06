{-# LANGUAGE PostfixOperators #-}

module Haskellplusplus
  ( PlusPlus(..) ) where

import Data.IORef

class  PlusPlus a  where
   (++) :: IORef a -> IO ()

instance PlusPlus Int where
   (++) r = do x <- readIORef r
               writeIORef r $ x + 1

instance PlusPlus Float where
   (++) r = do x <- readIORef r
               writeIORef r $ x + 1.0
