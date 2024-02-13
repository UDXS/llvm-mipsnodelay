# This requires the patched Clang. Either build it on your host system or mount this directory into the Docker image from this repo's root directory.

CC = clang
CFLAG = -target mips -mno-abicalls -fno-stack-protector -fno-builtin -O3

LD = ld.lld

OBJCOPY = llvm-objcopy
OBJCOPYFLAG = -j .text -j .data

OBJDUMP = llvm-objdump
OBJDUMPFLAG = -j .text -D -z -D -z

DEPS = custom_inst.h

SRCS    := $(wildcard ./*.c)
HEX    := $(patsubst %.c, %.hex, $(SRCS))
DIS    := $(patsubst %.c, %.dis, $(SRCS))

.PHONY : all clean

all: $(HEX) $(DIS)

%.o : %.c

# .SECONDARY :
.INTERMEDIATE : start.o

start.o: start.s
	$(CC) -c $(CFLAG) start.s

%.s: %.c $(DEPS)
	$(CC) -S $(CFLAG) $<

%.o: %.s
	$(CC) -c $(CFLAG) $^

%.out: %.o start.o mips.ld
	$(LD) -o $@ -T mips.ld $< start.o
	$(OBJCOPY) $(OBJCOPYFLAG) $@ $@

%.hex: %.out
	readelf -x .text -x .data $^ | awk '$$1 ~ 0x {print $$2 RS $$3 RS $$4 RS $$5}' > $@

%.dis: %.out
	$(OBJDUMP) $(OBJDUMPFLAG) $^ > $@

clean:
	bash -i -c "rm -f *.o *.out *.dis *.gch *.hex"