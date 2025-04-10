ENTRY(start)
SECTIONS {
    . = 1M;                     /* Kernel loaded at 1MB */
    .text : ALIGN(4K) {
        *(.multiboot)
        *(.text)
    }
    .data : ALIGN(4K) {
        *(.data)
    }
    .bss : ALIGN(4K) {
        *(.bss)
    }
}