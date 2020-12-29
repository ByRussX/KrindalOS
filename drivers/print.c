#include "lib.h"

int print(char * message) {
	char * video_memory = (char *) 0xb8000; // Video memory
	int counter = 0; // While counter
	
	while (* (message + counter) != 0) // `While` loop running until a `message` char is a zero byte (`0`)
	{
			* (video_memory + (counter * 2)) = * (message + counter); // Putting the char of the `counter` location into the `video_memory` position
			* (video_memory + (counter * 2 + 1)) = 0x0f; // Putting the hex code `0x0F` (white over black) for the character colors
			
			counter++; // Increase `counter`
	}
	return 0;
}