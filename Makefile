DEP:=dep
LOVE_LOCATION:=dep/love
LOVE:=$(LOVE_LOCATION)/src/love

.PHONY: all
all: $(LOVE)
	@echo Launching
	@$(LOVE) src/

$(LOVE): $(DEP)
	curl -o $(LOVE_LOCATION).tar.gz -L https://bitbucket.org/rude/love/downloads/love-0.10.2-linux-src.tar.gz
	tar xzf $(LOVE_LOCATION).tar.gz -C dep/
	rm -rf dep/love*.tar.gz
	mv dep/love-* dep/love
	(cd $(LOVE_LOCATION) && ./configure && make)

$(DEP):
	mkdir $(DEP)
