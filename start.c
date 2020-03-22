#define UART_ADDR	0x38000000

void core0_main();
void core1_main();

void start(int core_number){
	if(core_number == 0)
		core0_main();
	else
		core1_main();
}

void core0_main(){
	volatile char *p = (char*)UART_ADDR;
	while(1){
		*p = '0';
	}
}

void core1_main(){
	volatile char *p = (char*)UART_ADDR;
	while(1){
		*p = '1';
	}
}
