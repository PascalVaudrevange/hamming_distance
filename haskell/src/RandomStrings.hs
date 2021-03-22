module RandomStrings (
    randomStrings
) 
where
import Data.Text.Conversions  (fromText, toText)
import System.Random (mkStdGen)
import Text.Printf (printf)
import Text.StringRandom (stringRandom)

randomStrings :: Int -> Int -> [String]
randomStrings hashLength 0 = []

randomStrings hashLength nHashes = 
    (fromText (stringRandom gen (toText (printf "[0-9a-e]{%d}" hashLength :: String)))) : randomStrings hashLength (nHashes-1)
    where
        gen = mkStdGen nHashes