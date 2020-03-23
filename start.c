#define UARTHS_ADDR	0x38000000

// Kendryte K210 UARTHS is compatible with SiFive UART
#define TXF_ADDR	(UARTHS_ADDR + 0x00)
#define RXF_ADDR	(UARTHS_ADDR + 0x04)

#define BUSY_LOOP(num)	for(volatile unsigned busy_loop_counter=0;busy_loop_counter<num;busy_loop_counter++){}

void core0_main();
void core1_main();
void puts(char *str);
void putc(char ch);
void busy_loop(volatile unsigned num);

void start(int core_number){
	if(core_number == 0)
		core0_main();
	else
		core1_main();
}

void core0_main(){
	puts("core 0\r\n");
	while(1){
		puts("core 0\r\n");
		BUSY_LOOP(100000);
	}
}

void core1_main(){
	BUSY_LOOP(50000);
	puts("core 1\r\n");
	while(1){
		puts("core 1\r\n");
		BUSY_LOOP(100000);
	}
}

void puts(char *str){
	while(*str != '\0'){
		putc(*str);
		str++;
	}
}

void putc(char ch){
	volatile char *p = (char*)TXF_ADDR;
	while(*p < 0);
	*p = ch & 0xff;
}
