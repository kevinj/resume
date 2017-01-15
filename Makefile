S3_BUCKET=aws-website-kjoca-vduyb

all: index.html style.css

clean:
	rm index.html style.css kjo.zip

zip: kjo.zip

kjo.zip: index.html style.css
	zip kjo.zip $?

install: all
	aws s3 cp index.html s3://$(S3_BUCKET)/index.html
	aws s3 cp style.css s3://$(S3_BUCKET)/style.css
	aws s3 sync images s3://$(S3_BUCKET)/images

index.html: index.haml
	haml $< $@

style.css: style.sass
	sass $< $@
