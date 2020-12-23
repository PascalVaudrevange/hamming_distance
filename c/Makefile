CC=c:/Rtools/mingw_64/bin/gcc
CFLAGS=-Wall -pedantic -Wextra -fopenmp
FILES=src/main.o
RM=rm

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

all: hamming.exe

hamming.exe: $(FILES)
	$(CC) -o hamming.exe $(FILES) $(CFLAGS)

clean:
	$(RM) -f S(FILES)

