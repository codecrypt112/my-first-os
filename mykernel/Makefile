# Toolchain
CC := gcc
ASM := nasm
LD := ld

# Directories
BUILD_DIR := build
SRC_DIR := src
SCRIPTS_DIR := scripts

# Flags
ASMFLAGS := -f elf32
CFLAGS := -m32 -ffreestanding -nostdlib -Wall -Wextra -Iinclude
LDFLAGS := -T $(SCRIPTS_DIR)/linker.ld -m elf_i386

# Targets
KERNEL_BIN := $(BUILD_DIR)/kernel.bin
BOOT_OBJ := $(BUILD_DIR)/boot.o
KERNEL_OBJ := $(BUILD_DIR)/kernel.o

all: $(KERNEL_BIN)

# Build rules
$(BOOT_OBJ): $(SRC_DIR)/boot/boot.asm
	@mkdir -p $(@D)
	$(ASM) $(ASMFLAGS) $< -o $@

$(KERNEL_OBJ): $(SRC_DIR)/kernel/kernel.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(KERNEL_BIN): $(BOOT_OBJ) $(KERNEL_OBJ)
	$(LD) $(LDFLAGS) $^ -o $@

# Run in QEMU
run: $(KERNEL_BIN)
	qemu-system-i386 -kernel $<

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all run clean
