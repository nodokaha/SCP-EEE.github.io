all:
	cd haunt && haunt build
	mv haunt/site/index.html haunt/site/blog.html
	rm -rf feeds images
	mv -fu haunt/site/* .
