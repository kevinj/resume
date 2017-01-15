all: index.html style.css

clean:
	rm index.html style.css kjo.zip

zip: kjo.zip

kjo.zip: index.html style.css
	zip kjo.zip $?

install: all
	aws s3 sync . s3://aws-website-kjoca-vduyb --exclude Makefile --exclude README --exclude *.zip --exclude '.*'

index.html: index.haml
	haml $< $@

style.css: style.sass
	sass $< $@
