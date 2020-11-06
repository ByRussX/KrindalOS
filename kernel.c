void start(void) {
	char * video_memory = (char *) 0xb8000;
	char message[] = "Hola Mundo!";
	
	for (int i = 0; message[i / 2] != 0; i++)
	{
		if (i % 2 == 0)
		{
			* (video_memory + i) = message[i / 2];
		}
		else{
			* (video_memory + i) = 15;
		}
	}
}