imake:
	shc -f imake.sh
	mv imake.sh.x imake
clean:
	rm imake
install:
	mkdir -p $(DESTDIR)/usr/bin
	mkdir -p $(DESTDIR)/usr/share/imake
	mkdir -p $(DESTDIR)/tmp/imake
	mkdir -p $(DESTDIR)/usr/share/imake/out
	install -m 0755 imake $(DESTDIR)/usr/bin
