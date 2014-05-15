include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/nls.mk
include $(INCLUDE_DIR)/package.mk
CC = gcc
CFLAGS = -Wall -g -O2
INC_DIR= $(TARGET_DIR)/usr/include
LINK_DIR= $(TARGET_DIR)/usr/lib
LIBS = $(STAGING_DIR)/usr/lib/libpcap.a $(BUILD_DIR)/libiconv/libiconv.a

OBJ  = main.o md5.o zdclient.o 
.PHONY: all

all: zdclient

zdclient: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LIBS) -I$(INC_DIR) -L$(LINK_DIR)

main.o : main.c
	$(CC) $(CFLAGS) -c $< -I$(INC_DIR)

md5.o	: md5.c md5.h
	$(CC) $(CFLAGS) -c $< -I$(INC_DIR)

zdclient.o : zdclient.c
	$(CC) $(CFLAGS) -c $< -I$(INC_DIR)
	
clean :
	rm -v $(OBJ) zdclient
