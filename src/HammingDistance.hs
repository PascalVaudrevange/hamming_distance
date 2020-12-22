module HammingDistance (
    hammingDistance,
    findNearestNeighbour
) where

import Data.Bits (xor, popCount)
import Codec.Binary.UTF8.String (encode)
import GHC.Word (Word8)
import Data.List.Extra (minimumOn)

numberOfDifferingBits :: Word8 -> Word8 -> Int
numberOfDifferingBits x y = popCount (xor x y)

hammingDistance :: String -> String -> Int
hammingDistance x y 
    | length x == length y = sum(zipWith numberOfDifferingBits (encode x) (encode y))
    | otherwise                = error "Strings are not of equal length"


findNearestNeighbour :: [String] -> String -> String
findNearestNeighbour hashes hash =
    minimumOn (hammingDistance hash) hashes