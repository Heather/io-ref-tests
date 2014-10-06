@echo off
cabal install
runhaskell test/test.hs
pause