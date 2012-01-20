all: index.html style.css

index.html: index.haml
	haml $< $@

style.css: style.sass
	sass $< $@
