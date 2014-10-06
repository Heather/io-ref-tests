{-# LANGUAGE PostfixOperators #-}

import Data.IORef
import Control.Monad

import Prelude hiding ((++))
import Haskellplusplus

test :: PlusPlus a => IORef a -> IO ()
test a = do
    (a ++)
    (a ++)
    io <- readIORef a
    print $ show io

main = do 
    int <- newIORef 1
    test int
