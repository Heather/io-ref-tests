{-# LANGUAGE PostfixOperators #-}

import Data.IORef
import Control.Monad

import Prelude hiding ((++))
import Haskellplusplus

test :: (PlusPlus a, Show a) => IORef a -> IO ()
test a = do
    (a ++)
    (a ++)
    io <- readIORef a
    print $ show io

int :: Int -> IO (IORef Int)
int x = newIORef x

float :: Float -> IO (IORef Float)
float x = newIORef x

main = do 
    test =<< int 1
    test =<< float 1.0
