{-# LANGUAGE PostfixOperators #-}

module Haskellplusplus
  ( PlusPlus(..)
  , int
  , float
  ) where

import Prelude hiding (print)
import Prelude as P
import Data.IORef

int :: Int -> IO (IORef Int)
int x = newIORef x

float :: Float -> IO (IORef Float)
float x = newIORef x

class PlusPlus a  where
   (++) :: IORef a -> IO ()
   (+=) :: IORef a -> a -> IO ()
   (-=) :: IORef a -> a -> IO ()
   print :: IORef a -> IO ()

instance PlusPlus Int where
   (++) r = do x <- readIORef r;    writeIORef r $ x + 1
   (+=) r v = do x <- readIORef r;  writeIORef r $ x + v
   (-=) r v = do x <- readIORef r;  writeIORef r $ x - v
   print r = do x <- readIORef r;    P.print $ P.show x

instance PlusPlus Float where
   (++) r = do x <- readIORef r;    writeIORef r $ x + 1.0
   (+=) r v = do x <- readIORef r;  writeIORef r $ x + v
   (-=) r v = do x <- readIORef r;  writeIORef r $ x - v
   print r = do x <- readIORef r;    P.print $ P.show x
