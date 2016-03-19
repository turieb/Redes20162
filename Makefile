CC = gcc
CFLAGS = -c

all : build

build : main.o client server
	$(CC) $(G) lib/main.o -o bin/ftp # TODO add tags for all necesary libs to make the main
	chmod 774 bin/ftp

main.o :
	$(CC) $(CFLAGS) $(G) src/main.c -o lib/main.o
# TODO insert makefile tasks

client : http_client.o
	$(CC) $(G) lib/http_client.o -o bin/client

http_client.o :
	$(CC) $(CFLAGS) $(G) src/http_client.c -o lib/http_client.o

clean :
	rm -f bin/*

cleanall :
	rm -f bin/* lib/*

exec :
	bin/ftp

http_server.o :
	$(CC) $(CFLAGS) $(G) src/http_server.c -o lib/http_server.o

server : http_server.o
	$(CC) $(G) lib/http_server.o -o bin/server

