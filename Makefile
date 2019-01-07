# see Documentation/kbuild/modules.txt

obj-m := kmemcached.o
kmemcached-y := mymain.o storage.o interface.o libmp/protocol_handler.o libmp/binary_handler.o libmp/byteorder.o libmp/cache.o libmp/ascii_handler.o libmp/pedantic.o hash.o

all:
	make -C ../linux M=$(PWD) modules

module:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C ../linux M=$(PWD) clean

tags:
	etags *.c *.h libmp/*.c libmp/*.h

todo:
	ack-grep -C '(FIXME|TODO)'
