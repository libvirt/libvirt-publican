
prefix = /usr
datadir = $(prefix)/share/
pkgdatadir = $(datadir)/publican/
contentdir = $(pkgdatadir)/Common_Content

all:
	publican build --langs=all --formats=xml --publish

install:
	mkdir -p -m755 $(DESTDIR)$(contentdir)
	publican install_brand --path=$(DESTDIR)$(contentdir)

rpm:
	publican package --binary

clean:
	publican clean
