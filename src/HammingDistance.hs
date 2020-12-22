module HammingDistance (
    hammingDistance
    , hammingDistanceString
    , findNearestNeighbour
    , findNearestNeighbourString
) where

import Codec.Binary.UTF8.String (encode, decode)
import Data.Bits (xor, popCount)
import Data.List.Extra (minimumOn)
import GHC.Word (Word8)


numberOfDifferingBits :: Word8 -> Word8 -> Int
numberOfDifferingBits x y = popCount (xor x y)

hammingDistance :: [Word8] -> [Word8] -> Int
hammingDistance x y 
    | length x == length y = sum(zipWith numberOfDifferingBits x y)
    | otherwise                = error "Strings are not of equal length"


hammingDistanceString :: String -> String -> Int
hammingDistanceString x y =
    hammingDistance (encode x) (encode y)


findNearestNeighbour :: [[Word8]] -> [Word8] -> String
findNearestNeighbour hashes hash =
    decode (minimumOn (hammingDistance hash) hashes)

findNearestNeighbourString :: [String] -> String -> String
findNearestNeighbourString hashes hash =
    findNearestNeighbour (map encode hashes) (encode hash) 