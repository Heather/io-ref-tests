{-# LANGUAGE PostfixOperators #-}

import Data.IORef
import Control.Monad

import Prelude hiding ((++), print)
import Haskellplusplus

test1 :: (PlusPlus a, Show a) => IORef a -> IO ()
test1 a = do (a ++); (a ++); print a

main = do 
    test1 =<< int 1
    test1 =<< float 1.0
    
    x <- int 1
    x += 4
    x -= 2
    
    print x
