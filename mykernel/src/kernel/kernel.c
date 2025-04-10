volatile unsigned char *vga_buffer = (unsigned char*)0xB8000; // VGA text buffer

void kmain() {
    // Write "Hello World" to screen
    const char *str = "Hello World!";
    for (int i = 0; str[i] != '\0'; i++) {
        vga_buffer[i*2] = str[i];     // Character
        vga_buffer[i*2+1] = 0x0F;     // White-on-black style
    }

    while(1); // Infinite loop
}