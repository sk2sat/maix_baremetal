void start(int core){
	char *p = (char*)0x38000000;
	while(1){
		*p = 'A';
	}
}
