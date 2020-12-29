unsigned short byte_in(unsigned short port){
	unsigned short result = 0;
	__asm__("in %%dx, %%al" : "=a" (port) : "d" (result));
	return result;
}