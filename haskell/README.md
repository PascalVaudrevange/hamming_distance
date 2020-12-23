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

	Tue Dec 22 14:20 2020 Time and Allocation Profiling Report  (Final)

	   hamming-distance-exe.EXE +RTS -N -P -RTS

	total time  =        0.93 secs   (3460 ticks @ 1000 us, 8 processors)
	total alloc = 3,583,391,888 bytes  (excludes profiling overheads)

COST CENTRE           MODULE                         SRC                                                 %time %alloc  ticks     bytes

hammingDistance       HammingDistance                src\HammingDistance.hs:(18,1)-(20,72)                73.8   82.2   2553 2944000000
numberOfDifferingBits HammingDistance                src\HammingDistance.hs:15:1-46                        7.4    7.1    256 256000000
>>=.\                 Data.Attoparsec.Internal.Types Data\Attoparsec\Internal\Types.hs:(148,9)-(149,44)    2.4    0.9     84  33252576
randomIvalInteger     System.Random                  System\Random.hs:(468,1)-(489,76)                     1.6    1.4     54  49735216
fmap.\.succ'          Data.Attoparsec.Internal.Types Data\Attoparsec\Internal\Types.hs:173:11-58           1.5    0.7     52  26234536
stdNext               System.Random                  System\Random.hs:(518,1)-(528,64)                     1.3    0.8     44  29498400
>>=.\.succ'           Data.Attoparsec.Internal.Types Data\Attoparsec\Internal\Types.hs:148:13-76           1.2    0.2     43   8527408
minimumOn.g           Data.List.Extra                src\Data\List\Extra.hs:(434,9)-(437,26)               1.2    0.4     41  15996800
str                   Text.StringRandom              src\Text\StringRandom.hs:(116,1)-(130,33)             0.8    1.5     29  52876800
```