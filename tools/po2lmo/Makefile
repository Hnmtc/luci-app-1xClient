#
	# Name:    po2lmo
	# Version: v2.0
	# Author:  Hsy <info@hsy.ink>
	# Date:    2019-03-01
#

INSTALL = install
PREFIX  = /usr/bin

po2lmo: src/po2lmo.o src/template_lmo.o
	$(CC) $(LDFLAGS) -o src/po2lmo src/po2lmo.o src/template_lmo.o

install:
	$(INSTALL) -m 755 src/po2lmo $(PREFIX)

clean:
	$(RM) src/po2lmo src/*.o
