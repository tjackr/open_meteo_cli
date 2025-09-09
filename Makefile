CC = gcc
CFLAGS = -lcurl

all_files := main.c cities.c cityurl.c meteoresponse.c

OpenMeteoCLI.o: $(all_files)
	$(CC) $(CFLAGS) $(all_files) -o OpenMeteoCLI.o
