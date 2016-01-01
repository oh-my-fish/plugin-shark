XDG_CONFIG_HOME ?= $$HOME/.config
FISH_PATH := $(XDG_CONFIG_HOME)/fish/functions

MAN = man/man1
NAME := shark
FILE := $(NAME).fish
SOURCE = src/$(FILE)

GETOPTS := getopts.fish

FISHERMAN := fisherman
FISHERMAN_URL := https://github.com/$(FISHERMAN)/$(FISHERMAN)

MSG = printf "\033[47m\033[30m%s\033[0m\n" $(1)

.PHONY: all install uninstall clean

all: $(FILE) $(MAN)/$(NAME).1

install: $(FILE) $(FISH_PATH)/$(FILE) $(FISH_PATH)/$(GETOPTS)

uninstall:
	rm -f $(FISH_PATH)/{$(FILE),$(GETOPTS)}

clean:
	rm -f $(FILE)

$(FILE): $(SOURCE) $(NAME).awk VERSION
	cat  $< > $@
	sed "/##$(NAME).awk##/r $(NAME).awk" $@ >> $@.1
	sed -E "s/(set -l $(NAME)_version).*/\1 `cat VERSION`/" $@.1 > $@.2
	mv -f $@.2 $@ && rm -f $@.{1,2}

$(MAN)/$(NAME).1: $(MAN)/$(NAME).md
	@ronn --manual=$(NAME) -r $^

$(FISH_PATH)/$(FILE): $(FILE)
	cp $^ $@

$(FISH_PATH)/$(GETOPTS): $(FISHERMAN)
	cp $^/functions/`basename $@` $@
	rm -rf $(FISHERMAN)

$(FISHERMAN):
	git clone --depth 1 $(FISHERMAN_URL)
