PREFIX	= riscv64-unknown-elf-
CC		= $(PREFIX)gcc
LD		= $(PREFIX)ld
OBJCOPY	= objcopy

COMMON_FLAGS =
CFLAGS = -mcmodel=medany -fno-builtin -nostdinc
CFLAGS += -fno-common -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fno-zero-initialized-in-bss

TARGET = k210.bin
OBJS = entry.o start.o

PORT_K210 = /dev/ttyUSB0

%.o: %.S
	$(CC) -o $@ -c $<

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

default:
	make $(TARGET)

flash:
	make
	kflash -p $(PORT_K210) $(TARGET)

clean:
	rm -f *.bin *.elf *.o

k210.bin: k210.elf
	$(OBJCOPY) --input-target=elf64-little --output-target=binary $< $@

k210.elf: $(OBJS)
	$(LD) -o $@ $^ -T kendryte.ld
