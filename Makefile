TOOLS_PATH = /opt/riscv/bin/
#/opt/kendryte-toolchain/bin/
PREFIX	= $(TOOLS_PATH)riscv64-unknown-linux-gnu-
#riscv64-unknown-elf-
CC		= $(PREFIX)gcc
LD		= $(PREFIX)ld
OBJCOPY	= objcopy

COMMON_FLAGS =
CFLAGS = -mcmodel=medany -fno-builtin -nostdinc
CFLAGS += -fno-common -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fno-zero-initialized-in-bss

TARGET = k210.bin
OBJS = entry.o start.o

%.o: %.S
	$(CC) -o $@ -c $<

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

default:
	make $(TARGET)

flash:
	make
	kflash -p /dev/ttyUSB0 $(TARGET)

clean:
	rm -f *.bin *.elf *.o

k210.bin: k210.elf
	$(OBJCOPY) --input-target=elf64-little --output-target=binary $< $@

k210.elf: $(OBJS)
	$(LD) -o $@ $^ -T kendryte.ld
