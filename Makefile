NETWORK_VOLUME=/Volumes/kjo.ca

all: index.html style.css

index.html: index.haml
	haml $< $@

style.css: style.sass
	sass $< $@

install: all
	@if [ ! -d $(NETWORK_VOLUME)/public_html ]; then echo 'No network mount!'; exit 1; fi
	cp index.html $(NETWORK_VOLUME)/public_html/
	cp style.css $(NETWORK_VOLUME)/public_html/

