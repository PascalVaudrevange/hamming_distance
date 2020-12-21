module Main where

import HammingDistance (hammingDistance)
import System.Environment (getArgs)

main :: IO ()
main = do 
    (arg1:(arg2:args)) <- getArgs
    print (hammingDistance arg1 arg2)
