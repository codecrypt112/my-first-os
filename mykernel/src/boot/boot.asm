bits 32
section .multiboot
    dd 0x1BADB002               ; Magic number
    dd 0x00                     ; Flags
    dd -(0x1BADB002 + 0x00)     ; Checksum

section .text
global start
extern kmain                    ; Defined in kernel.c

start:
    cli                         ; Disable interrupts
    call kmain                  ; Call kernel main
    hlt                         ; Halt CPU