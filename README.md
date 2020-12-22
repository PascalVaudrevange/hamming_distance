# hamming-distance
selects the closest hash by hamming distance

## Execution
```(shell)
stack run
```

## Profiling
```(shell)
stack --profile run --rts-options -P
```
On my machine, it does not look terribly efficient:
```
	Tue Dec 22 10:33 2020 Time and Allocation Profiling Report  (Final)

	   hamming-distance-exe.EXE +RTS -N -P -RTS

	total time  =        1.09 secs   (4035 ticks @ 1000 us, 8 processors)
	total alloc = 10,980,801,616 bytes  (excludes profiling overheads)

COST CENTRE           MODULE                         SRC                                                 %time %alloc  ticks     bytes

hammingDistance       HammingDistance                src\HammingDistance.hs:(15,1)-(17,72)                42.4   26.9   1711 2956000016
encodeChar            Codec.Binary.UTF8.String       Codec\Binary\UTF8\String.hs:(50,1)-(67,25)           21.6   30.3    872 3328000000
encode                Codec.Binary.UTF8.String       Codec\Binary\UTF8\String.hs:72:1-29                  17.9   25.6    723 2816000048
numberOfDifferingBits HammingDistance                src\HammingDistance.hs:12:1-46                        4.1    2.3    165 256000000
encodeChar.go         Codec.Binary.UTF8.String       Codec\Binary\UTF8\String.hs:(52,3)-(67,25)            3.6   11.7    146 1280000000
>>=.\                 Data.Attoparsec.Internal.Types Data\Attoparsec\Internal\Types.hs:(148,9)-(149,44)    1.6    0.3     64  33252576
randomIvalInteger     System.Random                  System\Random.hs:(468,1)-(489,76)                     1.1    0.5     46  49735216
```